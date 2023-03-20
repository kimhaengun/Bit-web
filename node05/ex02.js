//함수
function func1(){
 console.log('func1~~~~~');   
}
func1();

var func02 = function(msg){
    console.log('func2'+msg);
}

func02('avc');

//화살표 함수
var func03= (msg)=>{
    console.log('func03~~~~'+msg);
}
func03('에에에에에');

var func05 = (a,b)=>{
    console.log('func05',a,b);
}
func05(5,'잉');

//매개변수가 오직 하나일 경우 () 생략가능
var func04 = msg =>{
    console.log('fun04'+msg);
}
func04('바바바바바');

//익명 함수 - 호출없이 바로 사용가능
(function(){
    console.log('익명 함수1');
})();

(()=>{console.log('익명함수 2');})();

//
var func005=()=>{return 5;};
console.log(func005());

var func005=()=>7;
console.log(func005());

var func06=msg=>msg;
console.log(func06('aaaaaa'));

//object return = 괄호안 오브젝트 작성
var func006=msg=>({});
console.log(func006());
err=>console.log(err);