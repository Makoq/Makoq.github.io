---
layout:     post
title:      Typescript
subtitle:   学习笔记
date:       2021-4-5
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - Typescript   
---

- typescript 基础

1. 编译

TS编译后会生成js


2. 类型声明

类型声明，对变量可以直接赋值，可以省略声明变量类型，会自动判断，ts的声明类型主要适用于函数（函数参数类型、函数返回值类型）

```
function sum(a:number,b:number):number{
    return a+b;
}

```

3. 基本类型

- 字面量
```
//联合类型
let a: string | boolean;
```

- 联合类型
```
let a:string|number;

```

- 交叉类型
```


```


- any
任意类型

```
let a:any;
a=1
a=true

```
- unknown

unkonwn用法与any基本一致，与any的区别在于：

any类型可以赋值给其他类型

unknown类型不可以赋值给其他类型，是类型安全的any

```
let e:unknown;
e=123

let s:string;

s=e//会报错

解决方案：
1.类型判断

if(typeof e==='string'){
    s=e
}

2.类型断言:就是高速编译器变量的类型是什么
s=e as string;
s= <string>e;

```
- void

函数返回值为空

```
function fn():void(){

}

```
- Object

```

//普通对象声明，age参数可选
let a:{name:string,age?:number};

//普通对象声明，可扩展字符串参数
let a:{name:string,[protpName:string]:any};

//函数对象声明
let b:(a:number,b:number)=>number;

```

- 数组
 
 两种声明方式

```
第一种
let arr:number[]=[1,2,3,4];
第二种
let arr:Array<number>=[1,2,3,4];

```
- 元组：就是固定长度的数组，存储效率比数组更好

```
let tuple:[string,string];

tuple=['h1','h2']

```

- enum:一系列可能固定值都列出来

```
enum Gender={
    Male,
    Female
}

let i:{name:string,gender:Gender}

i={name:'yao',gender:Gender.Male}

if(i.gender === Gender.Male){
    console.log(i.name)
}


```

- &
```
let b:{name:string}&{age:number};

```


- 类型别名

```
//把1 | 2 | 3 | 4类型给个名字为myType
type myType= 1 | 2 | 3 | 4;

let b:myType;

```

- 编译选项

编译配置文件：

tsconfig.json

主要有几个点：

```
{
    //编译包含的文件，**代表任意路径，*代表任意文件
    "include":
    [
        "./src/**/*"
    ],


    //编译不包含的文件
    "exclude":
    [
        "./src/hello/**/*"
    ],

    //编译配置
    "compilerOptions": {

        "target":"",//指定es版本，如es2015(es6)
        
        "module":"",//指定模块化版本

        "lib":"",//指定所用的库

        "outDir":"./dist/",//编译结果输出路径

        "outFile":""//编译输出文件，可以输出到一个文件中

        
        
        "allowJs":false,//是否对原始js进行编译

        "checkJs":true,//是否检查原始js的语法

        "removeComments":false,//是否在编译后文件中保留注释

        "noEmit":true,//不编译

        "noEmitOnError":true, //如果报错就不编译

        
        
        
        
        "strict":true,//所有严格检查的总开关

        "noImplicitAny":true,//不允许隐式any

        "noImplicitThis":true,//不允许不明确类型的this

        "strictNullChecks":true,//严格的检查空格    

        "alwaysStrict":true //是否使用严格模式

    }
}
```

- 面向对象

    - 类
        ```
        class Persion{
            
            name:string;
            static age:number;
            
            //构造函数
            constructor(theName:string){
                this.name=theName
            }

            sayHello(){
                console.log("hello world");
            }

        }

        ```
    - 构造函数：不同的实例有各自的初始属性和方法
        
        原始写法：
        ```
            class Persion{
                
                name:string;
                static age:number;
                
                //构造函数
                constructor(theName:string){
                    this.name=theName
                }

                sayHello(){
                    console.log("hello world");
                }

            }

        ```
        简洁写法(语法糖)：

        ```
            class Persion{
                //构造函数
                constructor(name:string,age:string){
                }
                sayHello(){
                    console.log("hello world");
                }

            }
        ```


    - super 字段：其实就是代表父类或者父类的实例

        - 子类构造函数中必须调用super(),才能继续使用this
          ```
            class XiaoMing{
                gender:string;
                constructor(name:string,theGender:string){
                    super();
                    this.gender=theGender;
                }
            }
          ```
        - 子类直接访问基类的方法或属性


    - 属性
        - 实例属性：创建对象后菜可以访问
            ```
            let xiaoming = new Persion();

            xiaoming.name="XiaoMing";

            ```
        - 静态属性：直接用类名去访问
            ```
            Persion.name="xiaohong";

            ```
    - 属性封装

        - public:在任意地方公开访问
        - private:只能在类内访问，可以通过get,set方法操作属性
        - protected:可以在类内部和继承的子类中使用，常用

        
    - 方法
        - 实例方法：创建对象后菜可以访问，概念上与实例属性相似
        - 静态方法：直接用类名去访问，概念上与静态属性相似

    - 抽象类：不能被实例化，专门就是被继承的类
        ```
            abstract class Persion{
                
                name:string;
                static age:number;
                
                //构造函数
                constructor(theName:string){
                    this.name=theName
                }

                //抽象方法
                abstract sayHello():void();
                                 
            }

        ```
        
        - 抽象方法：没有具体实现的基类函数，具体实现（函数体）在子类中完成
    
    - 接口：主要就是定义一个标准，限制某个实现接口的类符合这个标准

        - 接口中所有的属性都不能有实际的值（抽象类可以有实际值）
        - 接口只定义对象的结构，而不考虑实际值
        - 接口中所有方法都是抽象方法（抽象类可以有非抽象方法）

        - 实现接口：使类满足接口的要求

            ```
                interface behavior(){

                    name:string;

                    sayHello():void();

                }


                class Persion implements behavior{
                    name:string;

                    sayHello(){
                        console.log('你好');
                    }

                }

            ```
    - 多态：就是同一个接口，使用不同的实例而执行不同操作

        - 三个条件：
            1. 继承
            2. 重写
            3. 父类引用指向子类对象
    - 泛型：定义函数或类时，遇到类型不明确时使用泛型

        1. 基本用法：任意类型的泛型
            ```
                function fn<T>(a:T):T{
                    return a;
                }
                //不指定类型
                fn(1);
                //指定类型
                fn<string>("name");

            ```
        2. 进阶用法：利用类或接口进行限制
            1. 泛型函数
            
                ```
                    interface Inter{
                        length:number;
                    }

                    //泛型T是Inter的实现类（或子类）
                    function fn<T extends Inter>(a:T):number{
                        return a.length;
                    }

                ```
            2. 泛型类

                ```
                    class MyClass<T>{
                        name:T;
                        constructor(name:T){
                            this.name=name;
                        }
                    }

                    const mc= new MyClass<string>("孙悟空"); 

                ```

         