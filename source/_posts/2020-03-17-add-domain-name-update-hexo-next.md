---
title: 博客大版本更新
date: 2020-03-17 20:08:23
categories:
  - [Blog]
---

本次进行了博客大版本更新，其中包括：增加个人域名、更新到最新的NexT主题、更新到了最新的Hexo版本

<!-- more -->

## 个人域名

写博客的时候就有考虑顾是否要买个人域名，当时担心自己只是玩玩，所以一直没有买，现在转眼间已经毕业两年多了，还是想在互联网留下点属于自己的东西，所以近期在万网买了一个域名，从此我也是有域名的人了。哈哈，欢迎大家[常来看看][1]

## Github和Coding双线部署

因为使用了个人域名，为Github和Coding双线部署提供了可能。只需要在阿里云解析中配置好CNAME的对应关系，并将Coding的解析线路设置成国内，Github的解析线路设置成境外就能实现境内访问统一使用Coding进行加速，境外的使用Github page服务的功能。同时由于百度不能爬取Github，但是可以爬取Coding，也能为以后网站获取百度流量做准备。由于网上关于Coding怎么搭建静态网站的教程都比较老，我现在（2020年03月19日）放[Coding官方教程][6]，给有需要的同学。最后放上我云解析DNS的截图，给有需要参考的同学。

![aliyun-dns](aliyun-dns.png)

## 更新NexT到最新版

我的NexT主题已经很久没有更新了，本次直接更新到了github中的master版本，以后会定期更新的，更新文档主要参考了[官网的文档][2]，基本仅保留了`themen/NexT/_config.yml`中的内容，并把修改了的内容记录到[source-README][3]中，以备下次更新可以直接挑选需要的部分更新新的NexT主题中。更新NexT主题的时候发现，如果有太多自定义的样式和效果，更新迁移的时候会带来更多的麻烦，所以我决定以后仅使用NexT中默认的样式，这样才能保证每次更新仅修改`themen/NexT/_config.yml`文件就能达到目标。将更多的精力专注在内容的本身。

## 更新Hexo至最新版

和NexT主题一样，Hexo框架也很久没有更新了，此次更新了NexT主题的同时也更新了Hexo框架到最新版，方法是使用`npm outdated`查看最新版本，然后手动修改package.json文件更新到最新版本

## 更新了NexT相关组件到最新版

更新过程如下

```sh
npm outdated
# 将 package.json 中限制版本的 ^ 去掉
npm update
npm install
```

## 删除了Hexo-tag

由于博客内容没有很多，所以删除了标签，直接使用分类对文章进行区分，并且隐藏了页面中的标签页

## 切换了主题至Pisces

不想要太多的动态效果，所以切换了主题到Pisces，这样右侧栏就没有动态效果了

## Gitalk修改成自定义的域名

修改成了个人域名后gitalk自动创建失效了，通过[相关ISSUE][5]找到了是因为改了域名导致的，只要将域名进行相应的修改就能重新使用了，修改后的情况如下

![gitalk-self-domain](gitalk-self-domain.png)

## 增加了个人twitter

twitter没有怎么玩，但是因为要接触apache社区，所以以开通并且放出来了。久不久登陆上去，顺便学习学习英文

## 创建文章使用英文避免链接encodeRUI编码

之前的创建文章时都是使用中文，导致最后的连接含有中文会自动转成encodeRUI编码，现在统一使用`Hexo new "post-english-name"`避免了这样的情况发生

## 修复了很多之前博客的错误

### 图片显示的错误

之前博客部分图片不能正常显示，也不确定是插件有问题还是路径有问题，升级了NexT新版后已经默认支持本地图片加载了，只需要在Hexo配置文件中配置`post_asset_folder: true`即可

### 删除了重复的文章标题名

之前每次运行完`Hexo new "post-name"`之后都会在文章开头加上标题名称，review的时候发现这个操作没有必要，而且会导致vscode的markdown插件提示语法错误，所以全部文章统一删除了首段的标题

### 使用正确的多个分类方式

之前的多个分类方式是错误的，错误的将子分类当成了多个分类，现在已经纠正了，保证了分类页面的准确性

```markdown
<!-- 之前错误的多分类方式 -->
categories:
  - Blog
  - Github

<!-- 正确的多分类方式 -->
categories:
  - [Blog]
  - [Github]
```

### 修改了markdown相关的错误

之前文章存在较多的markdown语法错误，比如多次引用一个`#`，结尾没有空行，引用代码有误等，现在已经全部修正

### ~~修复local serach~~使用algolia search

~~发现local search失效了，现在已经将其修复~~，不知道为什么local search一直是失效的，使用NexT推荐的第一个搜索algolia search，详细配置见[NexT-search-services][4]

## TODO

* 做好百度的seo增加博客曝光度

[1]: http://zhongjiajie.com/
[2]: https://github.com/theme-NexT/Hexo-theme-NexT/blob/master/docs/zh-CN/UPDATE-FROM-5.1.X.md
[3]: https://github.com/zhongjiajie/zhongjiajie.github.com/blob/source/README.md
[4]: https://theme-NexT.org/docs/third-party-services/search-services
[5]: https://github.com/gitalk/gitalk/issues/115
[6]: https://help.coding.net/docs/devops/cd/static-website.html#pageTitle
