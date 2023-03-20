// 배열
var arr = ['item1','item2','item3','item4','item2'];
for(i=0; i<arr.length; i++){
    // console.log(arr[i]);
}

for(msg of arr){
    // console.log(msg);
}

// forRach의 경우 새로운 배열을 생성하고 push해서 새로운 배열을 만들어줘야함
// var result = [];
// arr.forEach(ele => {
//     result.push(ele+"번");
// });

// map의 경우 새로운 배열을 생성할 필요없음
// var result = arr.map(ele=>ele+"번");

// var result = arr.filter((ele,idx)=>{
//                             console.log(ele,idx);
//                             return idx%2==0;
//                         });

// var result = arr.reduce((before, curr, idx, target)=>{
//                             console.log(before, curr, idx, target);
//                             return before+","+curr;
//                         });

// var result = arr.find((ele,idx,target)=>{
//     console.log('find');
//     return ele=='item2';
// });

var result = arr.findIndex((ele,idx,target)=>{
    console.log('find');
    return ele=='item2';
});

console.log(arr,result);

let arr2 = JSON.parse('{}');
console.log(arr2);