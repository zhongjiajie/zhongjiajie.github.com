---
title: GithubAPI更新导致Gitalk触发持续邮件提醒
date: 2020-02-13 15:02:46
categories:
- blog
tags:
- Github
- blog
---

# Github API更新导致hexo-theme-next Gitalk触发持续邮件提醒

春节这几天持续收到了Github关于部分弃用API的邮件提醒，一天就能收到五六封，但是由于但是没有很好的网络条件没有进行处理，现在回来广州可以进行处理了。

<!-- more -->

![github-api-alter](github_api_alter.png)

## 具体描述

情况大概是我使用的博客评论系统Gittalk依赖，但是根据[Github-Deprecated APIs and authentication][1]可以知道Github对参数需求进行了部分修改，该方法已经被弃用了。

> GitHub is deprecating password authentication to the API. Instead of using password authentication, create a personal access token using your Personal access tokens settings page in limited situations like testing.

我这边追踪到了[Gitalk-issue-343][2]以及发现gitalk社区已经追踪到了这个issue并并且大家都给了自己临时的解决方案了，最后看到issue后面跟了一个已经合并了的相关PR，我意识到这个问题可能已经有了比较合理的解决方案[Gitalk-PR-344][3]以及[Gitalk-PR-346][4]。并且在[Gitalk-PR-346][4]中可知，只需要将gitalk升级到v1.5.2就可以了。

**解决方案已经出来了**，就是将hexo-next关于gitalk的的版本升级到1.5.2。

我去了theme-next/hexo-theme-next的库中查找了相关的issue以及PR，发现了两个相关的PR[hexo-theme-next-PR-1365]以及[hexo-theme-next-PR-1369]，从两个PR中可以知道Gitalk为了应对[Github-Deprecated APIs and authentication][1]也是经过了多次升级，但是根据我上面所说的

> **解决方案已经出来了**，就是将hexo-next关于gitalk的的版本升级到1.5.2。

可以知道，只需要将next的gitalk升级成1.5.2就可以了，从[hexo-theme-next-PR-1365]以及[hexo-theme-next-PR-1369]中可以知道next-gitalk相关引用路径在`themes/next/layout/_third-party/comment/gitalk.swig`,将其中的gitalk-js以及gitalk-css版本升级到1.5.2就行（因为此时的next还没有发布最新的release，只能手动更新）

```diff
{% if page.comments && theme.gitalk.enable %}

-  {% set gitalk_js_url = "//cdn.jsdelivr.net/npm/gitalk@1.4.0/dist/gitalk.min.js" %}
+  {% set gitalk_js_url = "//cdn.jsdelivr.net/npm/gitalk@1.5.2/dist/gitalk.min.js" %}
  {% if theme.vendors.gitalk_js %}
    {% set gitalk_js_url = theme.vendors.gitalk_js %}
  {% endif %}
  <script src="{{ gitalk_js_url }}"></script>

-  {% set gitalk_css_url = "//cdn.jsdelivr.net/npm/gitalk@1.4.0/dist/gitalk.css" %}
+  {% set gitalk_css_url = "//cdn.jsdelivr.net/npm/gitalk@1.5.2/dist/gitalk.css" %}
  {% if theme.vendors.gitalk_css %}
    {% set gitalk_css_url = theme.vendors.gitalk_css %}
  {% endif %}
  <link rel="stylesheet" href="{{ gitalk_css_url }}"/>

  {% set md5_url = "//cdn.jsdelivr.net/npm/js-md5@0.7.3/src/md5.min.js" %}
  {% if theme.vendors.md5 %}
    {% set md5_url = theme.vendors.md5 %}
  {% endif %}
  <script src="{{ md5_url }}"></script>

   <script>
        var gitalk = new Gitalk({
          clientID: '{{ theme.gitalk.client_id }}',
          clientSecret: '{{ theme.gitalk.client_secret }}',
          repo: '{{ theme.gitalk.repo }}',
          owner: '{{ theme.gitalk.github_id }}',
          admin: ['{{ theme.gitalk.admin_user }}'],
          id: md5(location.pathname),
          distractionFreeMode: '{{ theme.gitalk.distraction_free_mode }}'
        })
        gitalk.render('gitalk-container')
       </script>
{% endif %}
```

之后就是运行命令进行重新的部署

```sh
hexo clean
hexo generate
hexo deploy
```

---

[1]: https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api/#authenticating-using-query-parameters
[2]: https://github.com/gitalk/gitalk/issues/343
[3]: https://github.com/gitalk/gitalk/pull/344
[4]: https://github.com/gitalk/gitalk/pull/346
[5]: https://github.com/theme-next/hexo-theme-next/pull/1365
[6]: https://github.com/theme-next/hexo-theme-next/pull/1369
