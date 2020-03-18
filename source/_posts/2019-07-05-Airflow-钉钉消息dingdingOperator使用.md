---
title: Airflow-钉钉消息dingdingOperator使用
date: 2019-07-05 20:04:25
categories:
  - [Airflow]
---

Airflow 发送钉钉消息的 dingdingOperator 已经随着 [Airflow 1.10.3][1] 一起发布了, 有了 dingdingOperator 我们可以在 Airflow 中更优雅地发送钉钉消息,以及 任务 失败 成功 重试 sla过时等的通知.

## 背景

在较久之前,Airflow对消息系统的支持仅仅是[email][2]以及[slack][3].国内习惯使用IM系统作为通知,email一般比较少.slack在国内的普及程度远远没有达到[钉钉][4]和[微信][5]的水平,所以就有了在Airflow中新加钉钉或者微信作为消息通知的功能

由于我司使用钉钉作为内部通信而非企业微信(好像只有企业微信才开放了webhook?),所以我只给Airflow增加了钉钉的 operator,相关PR在[AIRFLOW-1526][6]

<!-- more -->

## 在没有Airflow dingdingOperator之前

在dingdingOperator没有合并到Airflow master分支之前,网上已经有方案解决Airflow使用钉钉发送消息通知问题

* [Apache-airflow 钉钉机器人插件][7]: 需要入侵Airflow发送email的源码,需要对Airflow的`basemodel`类(一个非常基础的类)进行修改,增加`ding_on_failure`以及`ding_on_retry`,并重新打包代码

有没有不对源码修改并且能实现发送系统消息的功能呢?答案是肯定的,可以使用Airflow中各种已经定义好了的callback.dingdingOperator正是通过这个方法实现了消息通知的功能的

## dingdingOperator实现原理

dingdingOperator的实现原理参考了`slack_wehook`的实现.主要的逻辑都在`DingdingHook`这个类中,通过继承`HttpHook`,将用户传过来的消息通过钉钉的webhook进行发送

## dingdingOperator怎么使用

详情参考[这里][8],已经默认定义了一个`dingding_default`作为默认的connection,只需要修改webhook详情就可以了,**注意: 需要将webhook放入`password`字段中, 且仅仅需要token而不是一整串的webhook**

一般的使用方法为

```py
text_msg_remind_all = DingdingOperator(
    task_id='text_msg_remind_all',
    dingding_conn_id='dingding_default',
    message_type='text',
    message='Airflow dingding text message remind all users in group',
    # list of user phone/email here in the group
    # when at_all is specific will cover at_mobiles
    at_mobiles=['156XXXXXXXX', '130XXXXXXXX'],
    at_all=True,
    dag=dag,
)
```

如果想要发送富文本内容

```py
markdown_msg = DingdingOperator(
    task_id='markdown_msg',
    dingding_conn_id='dingding_default',
    message_type='markdown',
    message={
        'title': 'Airflow dingding markdown message',
        'text': '# Markdown message title\n'
                'content content .. \n'
                '### sub-title\n'
                '![logo](http://airflow.apache.org/_images/pin_large.png)'
    },
    at_mobiles=['156XXXXXXXX'],
    at_all=False,
    dag=dag,
)
```

### 支持的消息类型

目前支持 `普通消息`, `link`, `markdown`, `actionCard` 和 `feedCard`, 考虑到用户对普通消息的需求更大,所以将普通消息进行了封装,不必传`content`关键字,只需要传消息的内容就行

## 通过dingdingoperator发送DAG状态的消息

上面的方法是使用dingdingOperator发送消息,本质是定义了一个dingdingOperator实例化后的task,放在DAG中的某个位置,当上游完全满足条件的时候由scheduler触发这个task.

但是作为消息通知,更常使用的场景是: 当Airflow中DAG运行到某个状态(task成功 失败 重试等)的时候发送消息通知对应的用户,这种情况就类似与callback函数,它应该作为DAG内部的一部分,而是不是仅仅是一个task.

这种情况下我们可以使用`Task callback`,在定义DAG的时候将`DingdingOperator`传到`DAG.default_args`的属性中,支持的callback类型包括`sla_miss_callback`, `on_success_callback`, `on_failure_callback`, 或者 `on_retry_callback`, 下面我们以 `on_failure_callback` 为例

```py
args = {
    'owner': 'airflow',
    'retries': 3,
    'start_date': airflow.utils.dates.days_ago(2),
}

def failure_callback(context):
    message = 'AIRFLOW TASK FAILURE TIPS:\n' \
              'DAG:    {}\n' \
              'TASKS:  {}\n' \
              'Reason: {}\n' \
        .format(context['task_instance'].dag_id,
                context['task_instance'].task_id,
                context['exception'])
    return DingdingOperator(
        task_id='dingding_success_callback',
        dingding_conn_id='dingding_default',
        message_type='text',
        message=message,
        at_all=True,
    ).execute(context)


args['on_failure_callback'] = failure_callback

dag = DAG(
    dag_id='example_dingding_operator',
    default_args=args,
    schedule_interval='@once',
    dagrun_timeout=timedelta(minutes=60),
)
```

如上面的例子,当DAG中有task报错时,会触发`dingding_success_callback`这个task,发送一个钉钉的消息到群中,并且`@`群里的全部人员.`message`中对应的信息是通过`context`获取的

如果消息中定义更多的类型,可以自行定义,`context`对象支持的属性有

* [get_template_context返回的全部类型][10], 其中有几个比较大的对象是:
  * `task instance`对象,[task_instance有的属性][9]
  * `configuration`对象,[configuration有的属性][12]
  * 数据血缘关系`inlets`和`outlets`
* 如果任务失败会还会[增加exception属性][11]

以上,希望大家可以更加方便的使用dingding发送系统消息.

[1]: https://airflow.apache.org/changelog.html#airflow-1-10-3-2019-04-09
[2]: https://github.com/apache/airflow/blob/master/airflow/operators/email_operator.py
[3]: https://github.com/apache/airflow/blob/master/airflow/operators/slack_operator.py
[4]: https://www.dingtalk.com/
[5]: https://weixin.qq.com/
[6]: https://github.com/apache/airflow/pull/4895
[7]: http://yangcongchufang.com/airflow/airflow-dingding-bot-plugin.html
[8]: http://airflow.apache.org/howto/operator/dingding.html
[9]: https://github.com/apache/airflow/blob/2b366934cdc20e8fb60b4b1e7b6c840a6708b258/airflow/models/taskinstance.py#L115-L149
[10]: https://github.com/apache/airflow/blob/2b366934cdc20e8fb60b4b1e7b6c840a6708b258/airflow/models/taskinstance.py#L1200-L1241
[11]: https://github.com/apache/airflow/blob/2b366934cdc20e8fb60b4b1e7b6c840a6708b258/airflow/models/taskinstance.py#L1057-L1058
[12]: https://github.com/apache/airflow/blob/master/airflow/configuration.py
