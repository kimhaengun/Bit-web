var express = require('express')
var app = express()

// app.get('/', function (req, res) {
//   res.send('Hello World2')
// })

// 쉽게 만드는 법
var app = express()
//js02를 띄움으로서 js02 폴더에 있는 index,ex01 html에 접근 가능
// css, js 파일을 구현하고 받으면 됨
var f = express.static('js02');
//static
app.use(f);

//<json 데이터 받기>
// body0parser
app.use(express.json());
app.use(express.urlencoded({extended:false}));
// app.post('/dept/:deptno',function(req, resp){
//     console.log(req.method, req.params.deptno);
//  resp.send('<h1>dept page</h1>');
// });
// app.get('/dept/:deptno',function(req, resp){
//     console.log(req.method, req.params.deptno);
//  resp.send('<h1>dept page</h1>');
// });

// app.get('/dept',function(req, resp){
//     console.log(req.method, req.query.deptno);
//  resp.send('<h1>dept page</h1>');
// });

// app.post('/dept',function(req, resp){
//     console.log(req.method, req.body.deptno);
//     console.log(req.method, req.body.dname);
//  resp.send('<h1>dept page</h1>');
// });

// <ejs>
// template
app.set('views',__dirname+'/views');
app.set('view engine','ejs');

app.get('/intro',function(req,res){
    var arr = ['item1', 'item2','item3','item4'];
    var obj = {key1:"var1",key2:"var2",key3:"var3"};
    res.render('intro',{msg:'hello', arr:arr, obj:obj , nalja:new Date()});
})



// -----초기 코드------

// use의 호출 우선순위는 위에서부터 아래로
// /dept url 요청을 하게 되면 /dept 함수 실행 후 / 함수도 실행됨
// app.use('/',function(req, res, nxt){
// //     //해당 url 요청(/)이 들어오면 해당 함수 실행
// //     // console.log(' / 이벤트 호춯~~~~~~~~~~');

// //     // 1.
// //     // res.setHeader('Content-Type','text/html; charset=utf-8');
// //     // res.write('<h1>출력~~~~</h1>');
// //     // res.end();

//     // 2. express를 사용하기 때문에 send() 사용 가능
//     // Header
//     res.status(200);
//     // Body
//     res.send('<h1>Send ~~~~~ 출력~~~~</h1>');

// });


// app.use('/dept',function(req, res, nxt){
    //     //해당 url 요청(/dept)이 들어오면 해당 함수 실행
    //     console.log('DEPT 이벤트 호춯~~~~~~~~~~');
    //     // nxt = callback 함수
    //     nxt(); 
    //     // filter chain과 비슷한 개념
    //     // 다음 url 요청으로 넘어감(use('/'))실행
    // });
    



app.listen(3000)