---
layout:     post
title:      moudle.export&exports
subtitle:   moudle.export,export
date:       2019-9-4
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - moudle.export
    - exports 
---
>exports只是对moudle.exports的一个全局引用

# 在nodejs中，每个js文件都默认创建一个moudle对象，moudle对象会创建一个exports的属性，初始化值为{}

```moudle.exports={}```

# 最终在程序里导出的是moudle.export

# exports只是对moudle.exports的一个全局引用

# exports.myFunc只是moudle.exports.myFunc的简写