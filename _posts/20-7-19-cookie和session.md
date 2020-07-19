---
layout:     post
title:      cookie和session
subtitle:   基本内容和属性
date:       2020-7-19
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - cookie
    - session
---

# cookie

- 前端操作

```
获取：
document.cookie
添加：
document.cookie="k=v"
//添加后会追加在原理cookie之后

```

- 后端操作
```
以nodejs为例

获取：
req.headers.cookie

设置：
res.setHeader("Set-Cookie","username=lan;path=/;httppnly")

设置cookie过期时间

const getCookieExpires=()=>{

const d=new Date()

d.setTime(d.getTiem()+(24*60*60*1000))//当前时间加一天

return d.toGMTString()

}

之后在上面httponly后面加上expires=${getCookieExpires()}
```


- cookie属性

name字段：一个cookie的名称
value字段：一个cookie的值
domain字段：可以访问此cookie的域名
path字段：可以访问此cookie的页面路径
Size字段：此cookie大小
http字段：cookie的httponly属性，若此属性为True，则只有在http请求头中会有此cookie信息，而不能通过document.cookie来访问此cookie。
secure字段：设置是否只能通过https来传递此条cookie。
expires/Max-Age字段：设置cookie超时时间。如果设置的值为一个时间，则当到达该时间时此cookie失效。不设置的话默认是session，意思是cookie会和session一起失效，当浏览器关闭（并不是浏览器标签关闭，而是整个浏览器关闭）后，cookie失效。



