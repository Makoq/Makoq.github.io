---
layout:     post
title:      javascript
subtitle:   tips
date:       2019-11-16
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - js tips
---
>一些在写代码和读《javascript高级程序设计》这本书过程中的一些个记录

1. 关于类样式的挂载切换
    html5中有一个扩展属性：classlist
    利用这个属性，可以对某一css类进行切换挂载

    总会遇到一些应用情景，在必要时给dom添加某css类，另外的情况下去除这个类，一般情况下都会去手动写，判断在不同情况下去给dom加载相应的类。

    但利用这个属性可以方便的切换类：
    ```
        div.classlist.toggle(use)

    ```
    这里利用classlist去切换挂载use这个css类