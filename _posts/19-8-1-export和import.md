---
layout:     post
title:      export&import
subtitle:   export&import
date:       2019-8-1
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - export
    - import
---
>export&import


# 变量
## export
### 导出时声明并定义
```
export var firstName = 'Michael';
```

### 导出变量名

```
var firstName = 'Michael';

var lastName = 'Jackson';
    
export {firstName, lastName};
```
## import
```
import {firstName, lastName} from 'xxx';
```
# 函数

### 直接导出函数

```
export function multiply(x, y) {

  return x * y;

};
```

### 导出声明的函数

```
function v1() { ... }
function v2() { ... }

export {

  v1 as streamV1,

  v2 as streamV2,

  v2 as streamLatestVersion

};
```

# 类

```
export default class { ... }
```

# export default

从前面的例子可以看出，使用import命令的时候，用户需要知道所要加载的变量名或函数名，否则无法加载。但是，用户肯定希望快速上手，未必愿意阅读文档，去了解模块有哪些属性和方法。

**为了给用户提供方便，让他们不用阅读文档就能加载模块，就要用到export default命令，为模块指定默认输出。**

## eg.1 默认导出函数，导入时，由导入端进行命名

```
//导出
// export-default.js
export default function () {
  console.log('foo');
}

//导入
// import-default.js
import customName from './export-default';
customName(); // 'foo'
```

这里对于匿名函数和非匿名函数都适用


**export default 本质就是输出名为default的变量或方法，然后在导入方允许给它起任意的名字**

## eg.2 默认导出函数，导入时，由导入端进行命名

```
// modules.js
function add(x, y) {
  return x * y;
}
export {add as default};

// 等同于
// export default add;

// app.js
import { default as xxx } from 'modules';
```

## eg.3 默认导出变量

```
var a = 1;

export default a;

//export default a的含义是将变量a的值赋给变量default
```