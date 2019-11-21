---
layout:     post
title:      addEventListener与一般事件的区别
subtitle:   addEventListener('eventType',function(){})
date:       2019-11-21
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - addEventListener
  
---
>js中的addEventListener与一般事件的区别

1. addEventListener()可以添加多个绑定事件，而一般事件只能添加一个
2. 普通事件绑定后不可取消，但addEventListener可以removeEventListener() 
3. ie8及更早版本和opear 7.0及更早版本不支持addEventListener()和removeEventListener()