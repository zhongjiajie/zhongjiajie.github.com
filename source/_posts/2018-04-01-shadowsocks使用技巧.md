---
title: shadowsocks使用技巧
date: 2018-04-01 14:53:07
categories:
- shadowsocks
---

## timeline

* update at 2019-01-11: update content from personal wiki.

记录了安装使用ss过程中使用到的文档,包括后期遇到的问题及相关的解决方案

<!-- more -->

* [github-shadowsocks][1]
* 相关资料
  * 逗逼根据地
    * [Shadowsocks指导篇（总结归类）——从无到有，境无止尽！][3]
    * [Shadowsocks（Sock5代理）的PAC模式与全局模式与VPN的区别][2]
    * [一些便宜性价比高的VPS推荐][4]
  * [wuchong-科学上网之 Shadowsocks 安装及优化加速][5]
  * 全套包括客户端

* Github
  * [如何关闭SS的日志][6]: ss的日志问题，日志等级及日志的输出位置
* 关于PAC的自定义规则
  * [ShadowSocks 自定义规则][7]
  * [Shadowsocks 进阶之 PAC][8]
  * [撰写 Adblock Plus 过滤规则][9]： Adblock Plus官网 user-rule用该规则定义
* 关于GFWlist
  * [github-gfwlist/gfwlist][10]: 一定时间更新 通过base64编码
  * [github-itcook/gfwlist2pac][11]： 时间复杂度O(1)，将base64编码还原成pac文件
* 用了ss还是上不了或者慢的问题
  * **PAC模式**失效是要使用**全局模式**，定时更新客户端，更新PAC
  * 关于**s3下载慢**的问题，可以用**ss开全局模式**下载
  * **s3**慢还可以在host文件中增加一条路由`219.76.4.4  github-cloud.s3.amazonaws.com`

## FAQ

* ss开了多个端口且多人使用后，发现 `ssseerver` 服务经常死掉，参照[shadowsocks进程停止后自动重启][12]写了一个定时检查的任务运行

  ```shell
  #!/bin/sh
  proc_name="shadowsocks"
  number=`ps -ef | grep $proc_name | grep -v grep | wc -l`
  if [ $number -eq 0 ]; then
    ssserver -c /etc/shadowsocks.json -d start
  fi
  ```

  * 将文件放在任意目录下，如 `/root`
  * 启动系统的 `cron` 任务 `sudo service cron start`
  * 编辑 crontab 任务，增加一个任务 **注意路径要是全路径** `*/1 * * * * /bin/bash /path/to/file` ，其中 `*/1 * * * *` 代表每分钟运行一次

## Ref

* [github-shadowsocks][1]
* [Shadowsocks（Sock5代理）的PAC模式与全局模式与VPN的区别][2]
* [Shadowsocks指导篇（总结归类）——从无到有，境无止尽！][3]
* [一些便宜性价比高的VPS推荐][4]
* [科学上网之 Shadowsocks 安装及优化加速][5]
* [如何关闭SS的日志][6]
* [ShadowSocks 自定义规则][7]
* [Shadowsocks 进阶之 PAC][8]
* [撰写 Adblock Plus 过滤规则][9]
* [github-gfwlist/gfwlist][10]
* [github-itcook/gfwlist2pac][11]
* [shadowsocks进程停止后自动重启][12]

[1]: https://github.com/shadowsocks/shadowsocks/tree/master
[2]: https://doub.io/ss-jc9/
[3]: https://doub.io/ss-jc26/
[4]: https://doub.io/vps-tj/
[5]: http://wuchong.me/blog/2015/02/02/shadowsocks-install-and-optimize/
[6]: https://github.com/shadowsocks/shadowsocks/issues/682
[7]: http://honglu.me/2015/06/26/ShadowSocks%E8%87%AA%E5%AE%9A%E4%B9%89%E8%A7%84%E5%88%99/
[8]: https://www.zybuluo.com/yiranphp/note/632963
[9]: https://adblockplus.org/zh_CN/filters
[10]: https://github.com/gfwlist/gfwlist
[11]: https://github.com/itcook/gfwlist2pac
[12]: http://aircjm.com/2016/10/17/linux-timer-task-instance-shadowsocks-process-automatically-restarts-after-stopping/
