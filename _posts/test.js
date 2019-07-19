function f(str){
    str=str.toString()
    let arr=[...str],len=arr.length,m=0
    for(let i=0;i<len;i++){
        let tail=arr.slice(len-1-i,len)
        let body=arr.slice(0,len-i-1)
        let con=tail.concat(body)
        let i=0
        con.map((v)=>{
            if(v==='1'){
                i++
            }
        })
        if(i>=m){
            m=i
        }
 
    }
    console.log(m)
    return m
}

str=1
f(str)