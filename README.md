# zhongjiajie.github.com - source branch

This is source branch of [zhongjiajie's blog][1], including blog's posts source, Hexo and NexT setting.

## Restore env

```shell
# 安装 hexo
npm install hexo-cli -g
# 从 github clone 博客项目
git clone git@github.com:zhongjiajie/zhongjiajie.github.com.git
# 切换到源目录分支
cd zhongjiajie.github.com
git checkout source
# 安装hexo相关依赖
npm install
# 配置 hexo-next 主题 这个方法获取next最后的release版本
mkdir themes/next
curl -s https://api.github.com/repos/theme-next/hexo-theme-next/releases/latest | grep tarball_url | cut -d '"' -f 4 | wget -i - -O- | tar -zx -C themes/next --strip-components=1
# 查看hexo能否成功运行
hexo server
```

## Writing step

```shell
# 创建一篇新的文章
hexo new "My New Post"
# 运行查看文章详情
hexo server
# 将文章内容生成静态文件
hexo generate
# 将文章部署到github page
hexo deploy
```

## Upgrade step

### NexT

现在的NexT已经保留了`.git`文件夹在`themes/next/`中了，如果经常写博客的话可以定时更新git代码就能完成更新了。如果不常写博客，可以按照[这篇文章][2]进行升级。主要的做法是将最新的NexT主题拉到theme一个新的文件夹下，然后将旧`_config.yml`内容复制到新主题下，再运行`hexo s`看能否正常渲染。这样能成功是在没有太多自定义样式的情况下的，所以有一个重要结论**不要加入太多的样式，请专注博客的内容，更多的使用默认的样式**

下面记录本次升级主要修改`_config.yml`的部分：

* favicon
* seo
* menu
* scheme
* social
* reward
* baidu_analytics
* gitalk
* leancloud_visitors
* local_search
* avatar
* github_banner
* since
* needmoreshare(手动新增配置)
* themes/next/layout/_macro/sidebar.swig  themes/next/layout/_third-party/comments/gitalk.swig  (谷歌广告)

### Hexo

在根目录运行`npm outdated`查看当前包最新的版本，修改`package.json`下面相关版本到最新版，运行`npm update`，可以更新hexo以及全部的依赖

[1]: http://zhongjiajie.com
[2]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/UPDATE-FROM-5.1.X.md
