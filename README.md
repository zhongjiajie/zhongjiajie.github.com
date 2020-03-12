# zhongjiajie.github.com - source branch

This is source branch of [zhongjiajie's blog][1], including blog's posts source, Hexo and NexT setting.

## restore env

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

## writing step

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

[1]: http://zhongjiajie.com