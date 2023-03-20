// 스프레드 연산자
var arr1 = ['item1', 'item2', 'item3'];
var arr2 = [...arr1, 'item4'];

// arr1[3]='item4';

// console.log(arr1);
// console.log(arr2);

var obj1={
    'key1':'val1',
    'key2':'val2'
};

var obj2={
    // ...obj1, arr2
    ...obj1, 'key1':'VAL1'
}
// obj1.key3='val3';
// console.log(obj1);
// console.log(obj2);

var [ele1,...ele2] = arr1;
var {key1,key2} = obj1;
// console.log(ele1,ele2);
console.log(key1,key2);