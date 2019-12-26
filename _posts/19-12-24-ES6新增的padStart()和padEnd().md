---
layout:     post
title:      E6新增补充头和补充为
subtitle:   padSrart,padEnd
date:       2019-12-23
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - padSrart
    - padEnd
---
> E6新增补充头和补充为

- padStart() 用于头部补全；

- padEnd() 用于尾部补全。

```
'abc'.padStart(13, '0123456789') // 0123456789abc

'abc'.padEnd(13, '0123456789') // abc0123456789
```