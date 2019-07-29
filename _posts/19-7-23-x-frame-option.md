---
layout:     post
title:      x-frame-options
subtitle:   http header
date:       2019-7-23
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - x-frame-options
---
X-Frame-Options是一个HTTP标头（header），用来告诉浏览器这个网页是否可以放在iFrame内。例如：

X-Frame-Options: DENY
X-Frame-Options: SAMEORIGIN
X-Frame-Options: ALLOW-FROM http://caibaojian.com/

第一个例子告诉浏览器不要（DENY）把这个网页放在iFrame内，通常的目的就是要帮助用户对抗点击劫持。

第二个例子告诉浏览器只有当架设iFrame的网站与发出X-Frame-Options的网站相同，才能显示发出X-Frame-Options网页的内容。

第三个例子告诉浏览器这个网页只能放在http://caibaojian.com//网页架设的iFrame内。

不指定X-Frame-Options的网页等同表示它可以放在任何iFrame内。

X-Frame-Options可以保障你的网页不会被放在恶意网站设定的iFrame内，令用户成为点击劫持的受害人。

另外查了最新的资料，还可以直接通过meta标签来设置，不需要放在http头部请求中了