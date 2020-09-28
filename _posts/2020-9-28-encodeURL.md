---
layout:     post
title:      encodeUrl
subtitle:   url加密
date:       2020-9-28
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - encodeURL
    - encodeURLComponent
---

- encodeURL

不会把本身属于url的特殊字符进行编码，例如冒号、正斜杠、问号和井字号


- encodeURLComponent

对它发现的任何非标准字符进行编码


- 应用场景

xss攻击防范，对url进行加密

```
var uri="http://www.jxbh.cn/illegal value.htm#start";

console.log(encodeURI (uri))

console.log( encodeURIComponent (uri));
```

```
原始url: 
http://www.jxbh.cn/illegal value.htm#start

encodeURL:
http://www.jxbh.cn/illegal%20value.htm#start

encodeURLComponment:
http%3A%2F%2Fwww.jxbh.cn%2Fillegal%20value.htm%23start

```