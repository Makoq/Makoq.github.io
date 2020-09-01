---
layout:     post
title:      commonjs&es6
subtitle:   内容、比较
date:       2020-7-19
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - moudle.exports,exports
    - export,export default
---

# commonjs,es6
- es6

 {

　　export   :      '可以输出多个，输出方式为 {}' ，

　　export  default : ' 只能输出一个 ，可以与export 同时输出，但是不建议这么做'，

　　解析阶段确定对外输出的接口，解析阶段生成接口，

　　模块不是对象，加载的不是对象，

　　可以单独加载其中的某个接口（方法），

　　静态分析，动态引用，输出的是值的引用，值改变，引用也改变，即原来模块中的值改变则该加载的值也改变，

　　this 指向undefined

}

- commonJS
 
{

　　module.exports =  ...   :      '只能输出一个，且后面的会覆盖上面的' ，

　　exports. ...  : ' 可以输出多个'，

　　运行阶段确定接口，运行时才会加载模块，

　　模块是对象，加载的是该对象，

　　加载的是整个模块，即将所有的接口全部加载进来，

　　输出是值的拷贝，即原来模块中的值改变不会影响已经加载的该值，

　　this 指向当前模块

}

# export,export default

- export

导出模块：

```
//属性
var firstName = 'Michael';
var lastName = 'Jackson';
var year = 1958;
//方法
var fc=function(){

}

export {firstName, lastName, year,fc};

```
导入模块：

```
import { firstName, lastName, year,fc} from 'xxx'
```

#### 注意：导出的接口名字要和模块中的导出相一致

- export default

    - 这种方式其实就是导出一个名为default的变量或者方法，但不同于之前的export，这种方式可以为导入模块取名字

    - 因为默认导出只会有一个，但不同于之前的export，所以不用大括号


导出模块：
```
const fc=function(){

}
export default fc

```

导入模块：
```
import fc as mufc from 'xxx'

```