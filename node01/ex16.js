//파일 읽기
var fs = require('fs');

fs.writeFile('temp01.txt','안녕안녕',function(err){
    console.log(err);
});

fs.readFile('temp01.txt',function(err,data){ //첫번째 매개변수 err , 두번째 buffer
    console.log(err, data.toString('utf-8'));
});