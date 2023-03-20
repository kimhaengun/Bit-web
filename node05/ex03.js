var f1 = function(){
    console.log(this);
}
// f1();

//익명함수에서는 this 사용 불가능
// (()=>{console.log(this);})();

var obj1 = {
    name: 'test1',
    // setName:function(a){
    //     this.name=a;
    // }
    setName:(a)=>{
        this.name=a;
        return this;
    }
}
var result = obj1.setName('aaa');
console.log(result);