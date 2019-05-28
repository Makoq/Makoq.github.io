---
layout:     post
title:      first blog
subtitle:   搭建博客记录一些学习过程
date:       2019-5-28
author:     Lan
header-img: img/2019-5-28-firstBlog.jpg
catalog: true
tags:
    - 原生js
    - 轮播图
---

>利用原生js手写一个轮播图。

## 写在前面：
利用原生js实现轮播图，没有用任何框架

之前有人说，来前端面试前，先实现一个js写轮播图吧

最近刷了一套百度笔试题全球，其中就有这样一道编程题

说起来很简单，但自己动手实现一下还是很有必要的

## 原理：
一行多个内容，通过移动这一行，只显示某一个部分

## 效果:
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190522203222617.gif)

## 代码：
**html**

```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>sliider</title>
    <link rel="stylesheet" href="static/slider.css" />
     
  </head>
  <body>
    <!-- 轮播图容器 -->
    <div id="container">
      <!-- 轮播内容容器，实际上是一行多个照片 -->
      <div id="wrap" style="left:-500px">
        <!-- 虽然有三个内容，但分别在这三个左右多放一个，用作进行循环的标志 -->
        <div class="item">
          <img src="./static/img/3.jpg" />
        </div>

        <div class="item">
          <img src="./static/img/1.jpg" />
        </div>
        <div class="item">
          <img src="./static/img/2.jpg" />
        </div>
        <div class="item">
          <img src="./static/img/3.jpg" />
        </div>

        <div class="item">
          <img src="./static/img/1.jpg" />
        </div>
      </div>
      <!--显示目前的展示项  -->
      <div class="btns">
        <span>1</span>
        <span>2</span>
        <span>3</span>
      </div>

      <!-- 左右切换按钮 -->
      <button id="left" onclick="slideLeft()"><</button>
      <button id="right" onclick="slideRight()">></button>
    </div>

    <script src="static/slider.js"></script>
  </body>
</html>

```
**css**

```
#container {
  position: relative;
  height: 200px;
  width: 500px;
  border: 1px solid black;
  overflow: hidden;
}
.item {
  height: 198px;
  width: 498px;
  border: 1px solid pink;
  position: relative;
  margin: 0px;

  z-index: -99;
}
#wrap {
  padding: 0px;

  display: -webkit-box;
  position: absolute;
  left: 0;
}

.btns {
  margin-top: 180px;
  margin-left: 50%;
  z-index: 999;
}
#left {
  position: absolute;
  margin-top: -100px;
}
#right {
  position: absolute;
  margin-top: -100px;
  margin-left: 450px;
}

```
**javascript**

```

// 拿到一行排列的所有内容项
var wrap = document.getElementById("wrap");
//当前项显示，是一个数组
var span = document.getElementsByTagName("span")
//向左
function slideLeft() {
    //如果到最左，触发循环
    if (wrap.style.left == '0px') {
        wrap.style.left = '-1000px'
        //每点击一次，向左移动一个item单项
    } else {
        var newLeft = parseInt(wrap.style.left) + 500;
        wrap.style.left = newLeft + 'px';


    }
    //通过位置，得到当前是哪一项
    var index = getCurrentIndex(wrap.style.left);
    //对当前项变色
    span[index - 1].style.color = 'pink';
    //非当前项褪色
    for (let i = 0; i < span.length; i++) {
        if (i != index - 1) {
            span[i].style.color = 'black';
        }
    }


}

//向右，与向左原理相似。不同在最右时触发循环
function slideRight() {
    if (wrap.style.left == '-2000px') {
        wrap.style.left = '-1000px';

    } else {
        var newRight = parseInt(wrap.style.left) - 500;
        wrap.style.left = newRight + 'px';


    }

    var index = getCurrentIndex(wrap.style.left);

    span[index - 1].style.color = 'pink';

    for (let i = 0; i < span.length; i++) {
        if (i != index - 1) {
            span[i].style.color = 'black';
        }
    }

}
//拿到当前项
function getCurrentIndex(left) {
    var nowIndex = parseInt(left.split('p')[0]) / 500;
    //循环原理
    if (nowIndex == -4) {
        nowIndex = 1
    }
    if (nowIndex == 0) {
        nowIndex = 3;
    }

    if (nowIndex < 0) {
        nowIndex = -nowIndex;
    }
    return nowIndex;

}
//定时器，4s定时切换
setInterval(() => {
    slideLeft()
}, 4000)





```
