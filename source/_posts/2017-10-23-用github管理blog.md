---
title: 用github管理blog
date: 2017-10-23 21:47:43
categories:
- blog
tags:
- Github
- blog
---

# 背景

update at 2019-01-11: 由于这种方式过于分散,导致换了电脑后就难以恢复博客内容,所以放弃了.**根据一个懒码农的经验,写博客需要的是耐心,而不是高明的博客内容管理方法.**所以我现在使用的方法是:

* 在个人[github-page-repo](https://github.com/zhongjiajie/zhongjiajie.github.com)上面新建一个分支source用于储存全部的源码(包括主题和配置),需要写博客时直接切换到这个分支写完,然后`hexo d`完成部署
* 如果有多篇文章同时在编写中,没有完成release的,统一将内容放在本人的[wiki](https://github.com/zhongjiajie/zhongjiajie.github.com/wiki)的**blog-tmp**文件夹中,这样wiki在本地提交到repo中也会因为没有暴露出**blog-tmp**的文件夹链接而没有直接入口

自从开始写博客以来，怎么管理博客文章的编写和发布一直困扰着我，最近刚好在加强Gitflow工作流，正好将其运用到博客管理上，使得博客的编写和发布更加有条理，现将个人对博客的管理经验与大家分享

<!-- more -->

# 为什么要管理文章

我写博客一般是下班或者午饭过后，都是一些零碎的时间。博客的内容有深有浅，有的能在20分钟内写完，有的要比较长的时间。如果遇到读书笔记之类的，要读完一本书才能完成一篇博客的就时间更长了

在写博客的时候很可能是多篇博客一起写，我目前有两篇读书笔记还在进行（长期），还有一个关于个人项目的博客（中长期），还有一些短期的想法想要分享，例如这篇博客

这样在博客发布的时候就笔记复杂了，之前的做法是认为将没有完成的文章剪切到别的地方，然后将已完成的博客用**HEXO**进行部署，这样的方法显得不够灵活，操作复杂且容易丢失博客，试过吃完饭睡个觉忘了把剪切出来的博客复制回去，之前时间太久博客被自己手贱删了。所以就有了用Gitflow来管理博客的想法，通过建立不同的分支来控制各个每篇不同的文章，完成之后再合并到master分支用于发布，更好管理文章的同时也可以加强写git的使用，何乐而不为？

# Gitflow博客管理流程

## 创建repository

在[Github][1]上创建存储blog的repository，我创建了一个[srcBlog][2]

## 对文章的管理

* 先将之前已经完成并发布的文章放在**master**分支中
* 从**master**分支中`checkout`一个**develop**分支
* 新建文章就从**develop**分支中`checkout`一个分支进行编写，分支名为**feature-<post_name>**
* 完成了文章的创建就`checkout`到**develop**分支，`git merge --no-ff feature-<post_name>`
* 对于没有完成的文章，或者持续更新的文章（读书笔记、学习日志等），及时的`git stash`储存或者`git push -u feature-<post_name>`推送到Github
* 对特定文章的编写再`git checkout feature-<post_name>`

## Gitflow工作流

![Gitflow](gitflow.png)

# Reference

[Git分支管理策略][3]

[1]: https://github.com
[2]: https://github.com/zhongjiajie/srcBlog
[3]: http://www.ruanyifeng.com/blog/2012/07/git.html
