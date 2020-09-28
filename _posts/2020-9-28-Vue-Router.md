---
layout:     post
title:      Vue-Router
subtitle:   路由原理
date:       2020-9-28
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - Vue-Router
    - 路由原理
---

# Vue-Router路由
前端路由的原理就是改变url但是不刷新页面即不向后台请求，只更新局部视图。

- 两种方式实现路由
 - Hash --- 利用 URL 中的hash("#")
 - 利用 History interface 在HTML5中新增的方法。

- 不同点
 - hash模式下路由中出现‘#’

# Hash模式

hash("#") 的作用是加载 URL 中指示网页中的位置
本身以及它后面的字符称职位 hash，可通过 window.location.hash 获取

主要通过两个方法：HashHistory的push和replace

 - 对于push

    ```
    $router.push() //调用方法
    HashHistory.push() //根据hash模式调用,设置hash并添加到浏览器历史记录（添加到栈顶）（window.location.hash= XXX）
    History.transitionTo() //监测更新，更新则调用History.updateRoute()
    History.updateRoute() //更新路由
    {app._route= route} //替换当前app路由
    vm.render() //更新视图

    ```
- 对于replace
    就是替换路由

# History interface模式

History interface 是浏览器历史记录栈提供的接口，通过back()、forward()、go()等方法，我们可以读取浏览器历史记录栈的信息，进行各种跳转操作。

从 HTML5开始，History interface 提供了2个新的方法：pushState()、replaceState() 使得我们可以对浏览器历史记录栈进行修改


# 两种模式比较

1. hash模式的‘#’太丑陋

2. history模式中pushState的优势
    - pushState设置的新URL可以是与当前URL同源的任意URL；而hash只可修改#后面的部分，故只可设置与当前同文档的URL

    - pushState设置的新URL可以与当前URL一模一样，这样也会把记录添加到栈中；而hash设置的新值必须与原来不一样才会触发记录添加到栈中

    - pushState通过stateObject可以添加任意类型的数据到记录中；而hash只可添加短字符串

    - pushState可额外设置title属性供后续使用
3. history的一个问题

hash模式仅改变hash部分的内容，而hash部分是不会包含在HTTP请求中的：

```
http://oursite.com/#/user/id   // 如重新请求只会发送http://oursite.com/
```

故在hash模式下遇到根据URL请求页面的情况不会有问题。

而history模式则会将URL修改得就和正常请求后端的URL一样
```
http://oursite.com/user/id
```
在此情况下重新向后端发送请求，如后端没有配置对应/user/id的路由处理，则会返回404错误。官方推荐的解决办法是在服务端增加一个覆盖所有情况的候选资源：如果 URL 匹配不到任何静态资源，则应该返回同一个 index.html 页面，这个页面就是你 app 依赖的页面。同时这么做以后，服务器就不再返回 404 错误页面，因为对于所有路径都会返回 index.html 文件。为了避免这种情况，在 Vue 应用里面覆盖所有的路由情况，然后在给出一个 404 页面。或者，如果是用 Node.js 作后台，可以使用服务端的路由来匹配 URL，当没有匹配到路由的时候返回 404，从而实现 fallback。