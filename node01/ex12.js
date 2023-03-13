var fs = require('fs');

//비동기
// fs.readFile('ex01.js',function(err,data){
//     console.log(data.toString('utf-8'));
// })

//동기
var msg = fs.readFileSync('ex02.js','utf-8');
console.log(msg);