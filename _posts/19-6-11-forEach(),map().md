---
layout:     post
title:      Array遍历方法forEach,map
subtitle:   forEach(),map()
date:       2019-6-11
author:     Lan
header-img: img/2019-5-28-firstBlog.jpg
catalog: true
tags:
    - forEach
    - map
---
>forEach和map是替代for对Array循环遍历的高效方法

## forEach()：
**按索引值升序顺序，遍历每一项**
 1. .不直接改变原数组，但如果在其callback中操作数组（回调中的第三个参数），也会改变数组。 
 2. .总是会返回一个undefined。 
 3. .不能break和return,除非是利用抛出异常的方式跳出循环。
 4. .其callback回调函数通常接收3个参数：
 5. 遍历时新添加的项不会被遍历到，若原有项发生改变，便利的是在遍历它时当下的值，若被删除则不会被遍历到

 val  当前位置值 		
 ind  当前位置索引 		
 arr  正在操作的当前数组 （利用此参数可以间接改变原数组）

**一般而言forEach()偏重于处理数组，但相对不关注返回值**


## map():
**按索引值升序顺序，遍历每一项**
同样不直接改变原数组，但可以利用callback的第三个参数（arr,调用方法的数组本身，同forEach）去改变

 1. 返回值是一个新数组 
 2. 同样不支持break，但如果return，则会返回给对应索引的新数组，也就是他的返回值
 如图：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190611162637156.png)
 3. 同样接收三个参数、增删改的特点与forEach()相同

**map更侧重于返回值**


## 总结：

两者对于替代传统的for循环十分有效，但不能中断循环是两者最大的问题，若想提前中断循环，可以用some和every,或者for of


老师会看到网上面试会问到，forEach和map的中断循环问题，此博客的总结应该是可以从容应对这个问题了


