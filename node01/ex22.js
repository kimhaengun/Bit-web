var http = require('http');
var query = require('querystring');
var url = require('url');
var fs = require('fs');

var serv = http.createServer(function(req,resp){
    // console.log(url.parse(req.url).path);
    // console.log(url.parse(req.url,true).query.id);

    resp.writeHead(200, {'Content-Type': 'text/html'});
    // resp.write('<h1>hi</h1>');
    fs.readFile('ex22.html',function(err,data){
        resp.write(data);
        //비동기 처리 이기 때문에 end가 readFile 밖에 있으면 IO가 먼저 끊기기 때문에 출력되지 않음
        resp.end();
    });
});

serv.listen(3000,function(){
    console.log('server start');
});