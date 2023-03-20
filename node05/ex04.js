//object
//15버전 이후 object key는 문자열이다 라고 정의
//   --> key부분에 ""생략 가능
var obj1 = new Object({name:'obj1'});
var obj2 = {key1:'val1',obj1:obj1};
console.log(obj2);
console.log(obj2.obj1);
console.log(obj2.obj1.name);
var obj3 = {obj1};
console.log(obj3);

var obj4 = {
    name:'tester',
    setName:function(a){
        this.name = a;
    }
};
obj4.setName('변경');
console.log(obj4);

// upgrade

var obj5 = {
    ename:'tester',
    setName(a){
        this.ename=a;
    }
}
obj5.setName('변경2');
console.log(obj5);