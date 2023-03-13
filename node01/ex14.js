//디렉토리 삭제
var fs = require('fs');

try{
    fs.rmdir('js01');
}catch(e){
    console.error(e);
}
