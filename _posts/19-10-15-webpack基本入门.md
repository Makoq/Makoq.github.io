---
layout:     post
title:      webpack
subtitle:   webpack
date:       2019-10-15
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - webpack
---
>webpack

## webpack
- 当 webpack 处理应用程序时，它会递归地构建一个依赖关系图(dependency graph)，其中包含应用程序需要的每个模块，然后将所有这些模块打包成一个或多个 bundle。


- 在 Webpack 当中, 所有的资源都被当作是模块, js, css, 图片等等..
因此, Webpack 当中 js 可以引用 css, css 中可以嵌入图片 dataUrl

对应各种不同文件类型的资源, Webpack 有对应的模块 loader

- webpack引用模块的规则是依据CommonJS的
## webpack配置文件
webpack有一个配置文件，叫webpack.config.js,遵循CommonJS

- ####  最基本的形式
~~~
// webpack.config.js
module.exports = {
  entry: './main.js',
  output: {
    filename: 'bundle.js'
  }
};
~~~
这里将main作为打包入口，打包成bundle.js

有了webpack配置文件，就可以直接调用webpack了

- ####  resolve.entension
例子当中 resolve.extensions 用于指明程序自动补全识别哪些后缀,
注意一下, extensions 第一个是空字符串! 对应不需要后缀的情况.
~~~
// webpack.config.js
module.exports = {
  entry: './a.js',
  output: {
    filename: 'b.js'
  },
  resolve: {
    extensions: ['', '.coffee', '.js']
  }
}
~~~






- ####  css及图片的引用
实际上 CSS 被转化为 style 标签, 而图片可能被转化成 base64 格式的 dataUrl
但是要主要在 webpack.config.js 文件写好对应的 loader

~~~
// webpack.config.js
module.exports = {
  entry: './main.js',
  output: {
    path: './build', // This is where images AND js will go
    publicPath: 'http://mycdn.com/', // This is used to generate URLs to e.g. images
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: /\.less$/, loader: 'style-loader!css-loader!less-loader' }, // use ! to chain loaders
      { test: /\.css$/, loader: 'style-loader!css-loader' },
      {test: /\.(png|jpg)$/, loader: 'url-loader?limit=8192'} // inline base64 URLs for <=8k images, direct URLs for the rest
    ]
  }
};
~~~
注意module.loaders里的写法就是，识别这些结尾的文件，然后用对应的loader进行处理
