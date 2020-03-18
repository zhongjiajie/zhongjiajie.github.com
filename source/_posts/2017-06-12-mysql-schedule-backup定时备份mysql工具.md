---
title: mysql_schedule_backup定时备份mysql工具
date: 2017-06-12 20:22:25
categories:
  - [MySQL]
  - [Python]
---

[mysql_schedule_backup](https://github.com/zhongjiajie/mysql_schedule_backup)是定时、全量备份指定mysql数据库的程序。可设置是否压缩备份文件、备份文件保留的天数。
使用场景是简单的备份逻辑，通过[schedule](https://github.com/dbader/schedule)就能满足的备份逻辑，没有DAG流程。

<!-- more -->

## Requirements

* schedule==0.4.2

## How to run

* 先安装schedule

```shell
pip install schedule
```

* 根据demo配置`conf.py`中相关的备份信息
* 修改`mysql_schedule_backup.py`文件中`schedule.every().day.at("06:00").do(backup_mysql, bacup_conf)`为你的业务时间
* 在mysql_schedule_backup目录下运行

```python
python mysql_schedule_backup.py
```

## 备份结果

* 备份是文件夹或者压缩文件，以备份时间为名称
* 文件夹（压缩文件）里面分为`*.sql`和`*.json`两类文件，其中`conf.json`为备份的配置文件，`*.sql`为备份的主文件，以`datetime_database.sql`方式命名
* 最终的备份样例

```shell
└─20170611
     ├─20170611_sakila.sql
     ├─20170611_tmp.sql
     ├─20170611_world.sql
     └─conf.json
```

## Features

* 使用[schedule](https://github.com/dbader/schedule)支持定时备份
* 使用配置文件`conf.py`统一除了备份时间外的配置备份信息（schedule的定时计划比较复杂，没有放置到配置文件`conf.py`中，而是放在主程序`mysql_schedule_backup.py`）
* 支持多个数据库备份
* 支持压缩备份文件
* 支持设置备份文件保留时间
* 备份文件中包含`mysql_schedule_backup`运行的配置信息

## 项目构成

```shell
└─mysql_schedule_backup
     ├─conf.py
     ├─mysql_schedule_backup.py
     └─requirements.txt
```

* `requirements.txt`:项目的requirements列表
* `mysql_schedule_backup.py`:是备份运行的主程序，其中`backup_mysql`函数是与配置文件`conf.py`交互的主函数。如果定制配置文件的样式可以对`backup_mysql`函数进行相应的修改

```python
if __name__ == "__main__":
    SLEEP_TIME = 30
    # 测试定时运行程序 每分钟运行一次
    # schedule.every().minutes.do(backup_mysql)
    # 每天固定时间运行程序
    schedule.every().day.at("06:00").do(backup_mysql)

    while True:
        schedule.run_pending()
        time.sleep(SLEEP_TIME)
```

* `conf.py`:mysql_schedule_backup是定时的配置文件，可配置内容包括备份存放路径、备份保留时间、备份是否压缩、备份的数据库及表（支持多个库备份）。一般的备份文件如下

```python
job = {
    "setting": {
        # 备份的根目录
        "root": "F:/mysql_schedule_backup",
        # 备份保持的时间
        "keep_day": 60,
        # 是否压缩备份
        "is_zip": "true"
    },
    "db_connection": [
        # 第一个要备份的库
        {
            "usr": "root",
            "pwd": "mysql",
            "host": "127.0.0.1",
            "port": "3306",
            "db_and_table": {
                # "backup_database": ["backup_table_1", "backup_table_2", ...]
                "tmp": [
                    "tb1",
                    "tb2"
                ],
                # "backup_database": ["*"]   # *默认全库备份
                "world": [
                    "*"
                ]
            }
        },
        # 第二个要备份的库
        {
            "usr": "root",
            "pwd": "mysql",
            "host": "127.0.0.1",
            "port": "3306",
            "db_and_table": {
                # "backup_database": ["backup_table_1", "backup_table_2", ...]
                "sakila": [
                    "*"
                ]
            }
        }
    ]
}
```

## 欢迎start

[mysql_schedule_backup](https://github.com/zhongjiajie/mysql_schedule_backup)地址，欢迎start或者fork