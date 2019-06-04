---
layout:     post
title:      async await
subtitle:   async await的作用
date:       2019-6-4
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - async
    - await
---

>async和await的作用。

## 概念

>async和await是es7出现的一个新概念，主要与promise配合使用

## 基本特征
>async和await总是一起出现，await出现在async函数的内部，await不能单独在函数外部出现

>async 标注的函数会返回Promise对象，即使函数本身没有返回一个promise对象，js也会自动将返回值包装成promise的resolved值

>await会使得执行过程进行等待，一般常用于等待promise直到执行成功

## 错误处理
>await 在promise成功resolve是返回结果，而在reject时，抛出错误

>可以用try catch直接在函数里捕获异常，这不同于用promise.then/catch

```
async function f() {
    try {
        let response = await fetch('http://no-such-url')
    } catch (err) {
        alet(err) // TypeError: failed to fetch
    }
}
f()
```

## 总结
>函数前面加了async使得函数总返回一个promise，而且可以在函数里使用await

>await使得js等待，通常等待promise的返回值或抛出的异常

>async/await在一定程度上让我们少写promise.then/catch

具体看
https://segmentfault.com/a/1190000013292562?utm_source=channel-newest