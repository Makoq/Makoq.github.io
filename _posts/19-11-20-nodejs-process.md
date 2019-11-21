---
layout:     post
title:      node process
subtitle:   process
date:       2019-11-20
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - process
---
>node 进程 process

node的三个全局变量console, process, global

process是node的三个变量之一，node的运行背景是在单线程下，所以该变量就是主要对当前node线程的一些属性获取和操作。


比如

```
\\获取当前node运行线程的pid
process.pid,
\\获取当前node运行线程的文件目录
process.cwd()
```
等等