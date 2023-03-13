var fs =require('fs');

fs.readdir('.', function(err, files){ // (경로, 파일 목록)
    files.forEach(function(ele,idx){
        console.log(ele);
    })
})