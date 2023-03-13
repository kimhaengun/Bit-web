var fs = require('fs');
// //동기적으로 작성 - 작성이 끝날떄까지 다음 코드로 넘어가지 않음.
// fs.writeFileSync('temp03.txt', '세번째 파일 작성2');

// //비동기로 읽기 --> 마지막에 callback함수 필수
// fs.readFile('temp03.txt',function(err,date){
//     console.log(data.toString('utf-8'));
// })

// --- 반대----

// fs.writeFileSync('temp04.txt', '두번째 파일 작성2',function(err){
//     console.log(err);
// });

// var msg = fs.readFileSync('temp04.txt','utf-8');
// console.log(msg);

//파일 이동 = 이동하면서 이름 변경
fs.rename('temp03.txt','./js02/temp05.txt',function(e){

});