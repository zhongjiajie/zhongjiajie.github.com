---
title: Airflow资源链接&常见问题-持续更新
date: 2020-04-21 09:48:05
categories:
- [Airflow]
---

使用Apache-Airflow过程中常见问题及解决方案，提供学习Apache-Airflow相关资源，本博文持续更新

<!-- more -->

## 前言

路走对了就不怕远。这篇博文不是为了替代官网[FAQ][1]，而是为了补充其内容，或者解决非master分支的问题（大部分人生产中的版本比较旧，部分问题可能仅存在于旧版本中，但master分支已经修复了）。本篇文章不应该含有和官网[FAQ][1]一样的内容，如果有[请联系作者][2]将其删除。

## 关键TIPS

* 我应该使用**什么版本的Airflow**，如果你第一次使用Airflow，或者想要调研Airflow解决方案，那推荐直接使用最新版，`pip install apache-airlfow`。因为Airflow的社区非常活跃，新版本包含了很多有趣的功能且修复了较多的bug。直到Backport Packages发布之前都是推荐新用户使用最新版，Backport Packages发布之后如果有用户想要稳定的生产环境，可以使用Backport Packages版本
* 如果你是Airflow的新人，遇到了安装/Tutorial跑不起来等安装类似问题，请先**重启/重试/重装**，一般都能解决问题
* 如果你是Airflow的新人，请阅读[官网][9]中如下三部分内容: **Tutorial、Qiuck Start、Installation**三部分的内容，及内容部分对应的连接，以上内容通读一遍大概就对Airflow有初步的了解
* 有问题请先检查问题是否在官网[FAQ][1]中已经有答案，如果没有，请去[Airflow-Github-issue][10]或[Airflow-JIRA][11]中查看是否别人也遇到类似问题，及相应的解决方案。之后才是在本博文的[问题汇总](#问题汇总)中寻找是否有相似的答案。如果经过了上述过程还不能找到对应的解决方案，才是加入[相关讨论群](#相关讨论群)进行讨论。**解决问题的顺序是：官网文档 > 官方ISSUE > 讨论群，而不是反过来遇到问题就找群友帮忙**

## 相关讨论群

<!-- TODO 这里不生效 -->
<style>
table th:nth-of-type(2) {
    width: 5cm;
}
</style>

| 类型 | 活跃程度 | 谁在支持 | 说明 |
| :----- | :----- | :----- | :----- |
| [![Slack Status][16]][15] | 非常活跃 | 官方支持 | 很多人帮忙解答问题，常用**用户channel**`#random #newbie-questions #troubleshooting`。常用**开发者channel**`#development #airflow-breeze #airflow-creative`。**中国用户channel**`#users-china`。**中文用户讨论没有QQ群活跃**，但本博文强烈建议想深入了解Airflow的进去看看。如果你是首次使用Slack可以参考[如何加入Airflow slack中国用户频道][17] |
| [![QQ-Group][18]][19] | 比较活跃 | 用户支持 | 国内部分Airflow使用者聚集地，较推荐中文用户加入，缺点是500人群，**经常满人** |

## 实用连接

<style>
table th:first-of-type {
    width: 2.7cm;
}
table th:nth-of-type(2) {
    width: 1.2cm;
}
table th:nth-of-type(3) {
    width: 1.75cm;
}
table th:nth-of-type(4) {
    width: 1.25cm;
}
table th:nth-of-type(5) {
    width: 4cm;
}
</style>

| 资源链接 | 更新频率 | 谁在支持 | 推荐程度 | 资源描述 |
| :----- | :----- | :----- | :----- | :----- |
| [Airflow官方文档][9] | 频繁更新 | 社区支持 | 强烈推荐 | 官方文档，最全，最新，覆盖最广。因为Airflow是一个**社区驱动**的项目，所以官方文档应该是全值得看的 |
| [Airflow官网-Blog][8] | 频繁更新 | 社区支持 | 强烈推荐 | Airflow官网的博客，由**Airflow committer维护**，有第一手资料，起步阶段资料还比较少，从1.10.9开始每个release有概览 |
| [Astronomer-Guides][7] | 频繁更新 | 商业公司支持| 强烈推荐 | **最值得看的第三方文档** Airflow商业版公司Astronomer（多个**Airflow核心开发者**所在公司）维护的指南，非常值得一看，很多问题可以在上面找到答案 |
| [Airflow-Issue][10] | 频繁更新 | 社区支持 | 推荐 | Airflow项目**官方汇报ISSUE**的地方，可以看看你遇到的问题是不是别人也遇到了，是否已经解决了。2020年3月以前的问题在[Airflow-JIRA][11]中，[mial-list][12]讨论了从JIRA迁移到Github-ISSUE的问题 |
| [awesome-airflow][5] | 很少更新 | 社区支持 | 推荐 | 有**Airflow导师**[jghoman][6]维护，涵盖简介、最佳实践、部署、相关博客、及商用版供应商等信息 |
| [Airflow中文文档][3] | 不更新 | 社区支持 | 推荐 | 由[apachecn][4]统筹翻译，仅翻译了**Airflow-1.10.2文档**，如果有兴趣可以和[apachecn][4]沟通进一步翻译别的版本的文档 |
| [Google-Composer][13] | / | 商业公司支持 | 了解 | GCP基于Airflow研发的商用版本，和[Astronomer-guides][7]异曲同工，有利于内部公司定制版本的借鉴，Google Composer向Airflow社区贡献并还维护着[apache/airflow-on-k8s-operator][14] |

## 问题汇总

简单对问题汇总的使用/查阅方式做说明

```md
<!-- 这个是说明同时是创建新问题的模板 如果有新的问题需要创建 则复制如下内容到 问题汇总 最后的一个问题 并修改 `常见问题汇总的问题标题（新建问题时需修改该题目）` -->
### 常见问题汇总的问题标题（新建问题时需修改该题目）

* **问题描述：**对该问题的描述
* **原因分析：**分析问题出现的原因
* **解决方案：**对该问题的解决方案
* **社区追踪：**Airflow社区对这个问题的处理，及相关的结果
```

### DAG表的description字段不支持中文

* **问题描述：**在没有修改过数据库参数情况下可能存在。当新建DAG文件且其中的description是中文时，会发现新的DAG一直没有被scheduler发现，webserver没有显示，且数据库dag表没有这个dag_id。查看scheduler日志有如下内容

  ```log
  sqlalchemy.exc.OperationalError: (_mysql_exceptions.OperationalError) (1366, "Incorrect string value: '\\xE4\\xB8\\xAD\\xE6\\x96\\x87...' for column 'description' at row 1")
  [SQL: UPDATE dag SET last_scheduler_run=%s, description=%s WHERE dag.dag_id = %s]
  [parameters: (datetime.datetime(2020, 4, 21, 14, 26, 50, 786593), '中文测试', 'tutorial')]
  ```

* **原因分析：**数据库编码有误，不支持中文，导致插入数据时报错，但是Airflow页面没有给出提示
* **解决方案：**修改数据库dag表的description字段编码

  ```sql
  -- 以 MySQL 为例
  ALTER TABLE airflow.dag MODIFY COLUMN description text CHARACTER SET utf8 COLLATE utf8_general_ci;
  ```

* **社区追踪：**无，但应该要解决

### SSHOperator命令在retry和failed的时候不会终结

* **问题描述：**使用SSHOperator的过程中，当task的状态变成failed或者up_for_retry时，SSHOperator后台进程仍在运行没有终结，按照道理应该是要kill掉进程的
* **原因分析：**这个**不仅仅是SSHOperator的问题**，很多的operator都存在类似的问题，原因是这些operator缺少`on_kill`方法，导致当这些operator状态变成failed或者超时导致up_for_retry时，executor没有调用对应的operator`on_kill`方法杀死他
* **解决方案：**修改SSHoperator中的源码，并使用修改后的SSHOperator而不是之前的SSHOperator，以下代码基于airflow-1.10.0源码修改

  * SSHHook中的修改

    ```diff
    <!-- SSHHook 中增加 kill 方法 -->
    +    def kill(self):
    +        self.client.close()
    ```

  * SSHoperator中的修改

    ```diff
    <!-- SSHoperator 参数修改 增加 get_pty 并默认设置成 True 删除 timeout -->
        @apply_defaults
        def __init__(self,
                     ssh_hook=None,
                     ssh_conn_id=None,
                     remote_host=None,
                     command=None,
    -                timeout=10,
    +                get_pty=True,
                     do_xcom_push=False,
                     *args,
                     **kwargs):
            super(SSHOperator, self).__init__(*args, **kwargs)
            self.ssh_hook = ssh_hook
            self.ssh_conn_id = ssh_conn_id
            self.remote_host = remote_host
            self.command = command
    -       self.timeout = timeout
    +       self.get_pty = get_pty
            self.do_xcom_push = do_xcom_push

    <!-- SSHoperator 删除通过 command 判断是否 get_pty 的逻辑 -->
    -           get_pty = False
    -           if self.command.startswith('sudo'):
    -               get_pty = True

    <!-- SSHoperator 删除 timeout 的引用 -->
                stdin, stdout, stderr = ssh_client.exec_command(command=self.command,
    -                                                           get_pty=get_pty
    -                                                           timeout=self.timeout
    +                                                           get_pty=self.get_pty
                                                                )

    -               readq, _, _ = select([channel], [], [], self.timeout)
    +               readq, _, _ = select([channel], [], [])

    <!-- SSHoperator 中增加 on_kill 方法 调用 SSHHook 中的 kill 方法 -->
    +   def on_kill(self):
    +       self.log.debug("Kill ssh process in remote")
    +       self.ssh_hook.kill()
    ```

* **社区追踪：**有一个Draft PR追踪该问题，该PR通过将BaseOperator的`execute`和`on_kill`方法设置成`@abstractmethod`让继承BaseOperator的全部类都必须含有`execute`和`on_kill`方法，详见[PR-8296][21]

### Tree View页面无法加载

* **问题描述：**如果DAG含有很多的task且已经运行了一段时间，打开webserver中的Tree View时会非常卡，有时甚至会页面奔溃
* **原因分析：**从数据库返回浏览器的数据太多，其中包含了较多无用的信息，减少返回的数据有利于降低响应时间
* **解决方案：**Airflow-1.10.9之前没有较好的解决方案，只能通过降低配置文件airflow.cfg中的`default_dag_run_display_number`值来稍微加速，Airflow-1.10.10已经修复了这个问题
* **社区追踪：**Airflow社区已经解决了这个问题，参考[PR-7492][22]，已经在Airflow-1.10.10中[发布][23]了

### 实现DAG之间的依赖

* **问题描述：**想实现DAG之间的依赖关系，不知道怎么实现
* **原因分析：**无
* **解决方案：**目前看到的解决方案主要有三种
  * 使用[SubDagOperator][28]。因为SubDagOperator可以将DAG文件切分成多个，且能实现依赖关系，相当于实现了DAG间的触发，详细可参考官网的例子。[example_subdag_operator][24]和[subdag][25]。但是SubDagOperator本质是一个operator所有有很多局限性，可能出现的问题有：**无并发控制 和 死锁**详细问题见[mail-list][26]，这些问题在master分支代码中已经fix了，相关的[PR-5498]，但是一直没有release(截止Airflow-1.10.10都没有)。所以如果想要使用SubDagOperator来实现切分大DAG和DAG间依赖的同学要注意。优点是**能在webserver联动**，可以点击查看SubDagOperator
  * 使用[TriggerDagRunOperator][29]。这也是个不错的解决方案，没有了SubDagOperator中存在的问题，但**不能监控被触发DAG的状态**，即不知道DAG是成功/失败/运行。这是因为使用`trigger_dag`方法触发别的DAG，只要触发了就标记task为成功。因为是只是一个Operator，没有放例子
  * 使用[http-sensors][30]+[get_dag_run_state][31]API。这里理论可行，博主没有尝试过。SubDagOperator和TriggerDagRunOperator都是上有DAG主动触发下游DAG实现DAG间依赖的，这个方法是下游DAG主动监控上游DAG的状态实现DAG间依赖。*实现方式*是：下游DAG第一个task必须是http-sensors，调用Airflow自己的API`get_dag_run_state`，不断监控上游DAG的状态，如果成功才标记http-sensors为成功。但是这个解决方案也有问题，一是需要sensors一直监控（要资源）上游DAG状态（查询也要**浪费资源**），另一个是需要上下游DAG需要有**差不多的schedule_interval**。第一个很好理解，资源问题，第二个是为了保证上游DAG成功时立马调用下游。
  * 使用[ExternalTaskSensor][36]

| 方案 | 优势 | 劣势 |
| :----- | :----- | :----- |
| SubDagOperator | 原生支持 能在webserver联动  | 无并发控制 死锁 master修复但是没有release |
| TriggerDagRunOperator | 原生支持 没有SubDagOperator的问题 | 不能监控下游DAG的状态 |
| http-sensors + get_dag_run_state-API | 原生支持 | schedule_interval需要差不多 资源浪费 |

* **社区追踪：**Airflow社区暂时没有人对DAG间依赖有兴趣，博主也觉得DAG大点没有关系，分类好一点即可解决很多问题。**如果一定要实现**建议基于TriggerDagRunOperator修改，可借鉴第三种方式，让TriggerDagRunOperator触发完后不知里面标记成功，而是一直监控子DAG的状态是否成功。另外最近[bin][33]正在重构SubDagOperator，进度见[AIP-34 Refactor SubDagOperator][32]

### REST触发DAG如何接收参数

* **问题描述：**使用API不知如何触发DAG，如何接收传入DAG的参数
* **原因分析：**因为官网没有相似例子
* **解决方案：**首先如果触发DAG官网是给了[解决方案][35]的，要注意curl的`-d`参数是一个字符串，只要这个字符串写正确就肯定能触发DAG（这个字符串确实难写，建议调用时使用调用语言key-value转换字符串封装，如JAVA重写Hashmap的toString，Python重写dict的__str___）。如何调用的问题解决了，来看看如何在DAG中接收参数。可以使用`dag_run.conf['key']`的方式拿到传进去的键值对。这里给给一个简单的例子，以官方例子POST的，要拿到传入的'key'对应的'value'

  ```py
  # 在dag文件中获取 value
  in_dag_file = dag_run.conf['key']

  # 在operator中获取 value
  bash = BashOperator(
      task_id=f'test_{in_dag_file}',  # dag中获取的in_dag_file变量传递给operator
      bash_command='echo "in operator value is {{ dag_run.conf['key'] }}"',
      dag=dag,
  )
  ```

* **社区追踪：**Airflow社区准备重构REST API[AIP-32: Airflow REST API][34]，相信到AIP完成的时候不管文档还是易用性应该会有较大提高

### 日志占用磁盘太多如何处理

## 我想问的这里没有

请核对是否按照[关键TIPS](#关键TIPS)第三点顺序查找完了且没有相似问题，如果是，你有以下渠道反馈问题，越靠前越推荐

* 根据[帮忙改进文档](#帮忙改进文档)中的指引，创建PR并在[问题汇总](#问题汇总)最后面增加你的问题
* 加入[相关讨论群](#相关讨论群)寻找问题的解决方案，如果在群中得到解答，且觉得该问题应该包含在博文中，请根据第一点提PR
* 在本博文的评论页面增加你想要问的问题

## 期望

一个人走可以走得很快，但是一群人能走得更远。如果你在使用Apache-Airflow，觉得这是好的工作流解决方案，且想要丰富其中文资料，参与到这篇博文的建设中，请参考[帮忙改进文档](#帮忙改进文档)对文档进行改进。目前的贡献形式仅有合并zhongjiajie这篇博文这一个，如果以后贡献的人变多，或有小伙伴想要将本资料库做大，非常欢迎[联系作者][2]，可以考虑创建一个Github组织专门做这个事。

## 帮忙改进文档

目前形式比较单一且不是太友好，如果帮忙改进文档的人数比较多，会创建新的Github组织，创建特定项目完成这件事，当前的形式如下

```sh
# Fork项目https://github.com/zhongjiajie/zhongjiajie.github.com
# 在github中clone本博客源码
git clone --depth=1 --single-branch --branch source https://github.com/<YOUR_GITHUB_ID>/zhongjiajie.github.com.git
# 找到对应的博文源文件叫 2020-04-21-airflow-faq-and-useful-resource.md
ls zhongjiajie.github.com/source/_posts/ | grep "2020-04-21-airflow-faq-and-useful-resource.md"
# 使用任意的markdown编辑器打开文件 修改对应的内容 并提交到本地并push到你的origin分支
# 创建PR并将base分支从master修改成source，点击创建 你可能需要参考 https://help.github.com/cn/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request
```

## Timeline

* 2020-04-17: 起草博文

[1]: https://airflow.readthedocs.io/en/latest/faq.html
[2]: http://zhongjiajie.com/about/index.html#%E8%81%94%E7%B3%BB%E6%96%B9%E5%BC%8F
[3]: https://github.com/apachecn/airflow-doc-zh
[4]: https://github.com/apachecn
[5]: https://github.com/jghoman/awesome-apache-airflow
[6]: https://github.com/jghoman
[7]: https://www.astronomer.io/guides
[8]: http://airflow.apache.org/blog
[9]: https://airflow.readthedocs.io/en/latest
[10]: https://github.com/apache/airflow/issues
[11]: https://issues.apache.org/jira/projects/AIRFLOW/summary
[12]: https://lists.apache.org/thread.html/r19014fac5aa2aa15a86890aa438940da263e430cb535ca451ef451a4%40%3Cdev.airflow.apache.org%3E
[13]: https://cloud.google.com/composer
[14]: https://github.com/apache/airflow-on-k8s-operator
[15]: https://apache-airflow-slack.herokuapp.com
[16]: https://img.shields.io/badge/slack-join_chat-white.svg?logo=slack&style=social
[17]: https://github.com/zhongjiajie/zhongjiajie.github.com/wiki/How-to-join-airflow-slack-china
[18]: https://img.shields.io/badge/QQ群-178978627-blue.svg
[19]: https://shang.qq.com/wpa/qunwpa?idkey=586919e2e4934b7253aba5bbb572409e078f04c7c2523dc475b20edbb7bd6fed
[20]: https://help.github.com/cn/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request
[21]: https://github.com/apache/airflow/pull/8296
[22]: https://github.com/apache/airflow/pull/7492
[23]: https://github.com/apache/airflow/blob/c9c336c3fdedee5316d6dde24d604ef84a545139/CHANGELOG.txt#L100
[24]: https://github.com/apache/airflow/blob/master/airflow/example_dags/example_subdag_operator.py
[25]: https://github.com/apache/airflow/blob/master/airflow/example_dags/subdags/subdag.py
[26]: https://lists.apache.org/thread.html/0aec158c42662370c3e8dc210c1a2b5ec21278d85243e257c174a549%40%3Cdev.airflow.apache.org%3E
[27]: https://github.com/apache/airflow/pull/5498
[28]: https://github.com/apache/airflow/blob/master/airflow/operators/subdag_operator.py
[29]: https://github.com/apache/airflow/blob/master/airflow/operators/dagrun_operator.py
[30]: https://github.com/apache/airflow/blob/master/airflow/providers/http/sensors/http.py
[31]: https://github.com/apache/airflow/blob/97a429f9d0cf740c5698060ad55f11e93cb57b55/airflow/api/common/experimental/get_dag_run_state.py
[32]: https://cwiki.apache.org/confluence/display/AIRFLOW/AIP-34+Refactor+SubDagOperator
[33]: https://github.com/xinbinhuang
[34]: https://cwiki.apache.org/confluence/display/AIRFLOW/AIP-32%3A+Airflow+REST+API
[35]: https://airflow.readthedocs.io/en/latest/rest-api-ref.html#post--api-experimental-dags--DAG_ID--dag_runs
[36]: https://github.com/apache/airflow/blob/f3ad5cf6185b9d406d0fb0a4ecc0b5536f79217a/airflow/sensors/external_task_sensor.py
