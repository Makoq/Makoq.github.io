---
layout:     post
title:      nextTick
subtitle:   vue.nextTick
date:       2020-9-29
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - nextTick
---


# 用法

nextTick将回调延迟到下次dom更新后执行。

举例，我们操作了dom产生了修改，但是不想页面上的dom立即发生变化，而是想等待dom更新后再实现变化

应用场景：需要在视图更新之后，基于新的视图进行操作

再举例，在vue生命周期中，created阶段不能操作dom,但如果就是想在created里操作dom，并不是没有办法，用nextTick就可以实现将回调延迟到dom在初始化并渲染之后