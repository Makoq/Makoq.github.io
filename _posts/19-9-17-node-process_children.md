---
layout:     post
title:      node child_process
subtitle:   child_process
date:       2019-9-17
author:     Lan
header-img: img/blog-bak.jpg
catalog: true
tags:
    - child_process
---
>node子进程 process_children

node子进程作用相当于打开一个cmd命令行程序，可以通过拼凑命令行的方式去执行cmd命令，这是我在写数据容器时用过的东西

```
const { exec } = require('child_process');//引入包

//要执行的exe路径
let exe_dir= __dirname + '/../xml2js_cmd/'+'Xml2Json.exe'
//拼凑的命令行
let commond=exe_dir+" "+new_path + "/"+schemaArray[i]
       
//执行，并在回调中打印exe执行的输出     
exec(commond,(error,stdout,stderr)=>{
    if(error){
    console.log(error)
    }
    console.log(`stdout: ${stdout}`);
    console.log(`stderr: ${stderr}`)

    let json=(schemaArray[i].split("."))[0]+".json"
    schemaResult.push(JSON.parse(fs.readFileSync(new_path + "/"+json, 'utf-8')));

    res.send({
    errno:0,
    data:{
        schema:schemaResult,
        udx_data:schemaDataArray
    }   
    })

})
```