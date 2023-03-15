var express = require('express');
const session = require('express-session');
var router = express.Router();
var pool = require('../modules/mysql');

router.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false,maxAge: 60000  }
}));

// 로그인 했다는 가능 = /login 주소로 들어오면 자동 로그인 되었다고 설정
router.get('/login',(req,res)=>{
  req.session.login='admin';
  res.status(200).end();
})

var login = ('/',(req,res,nxt)=>{
  if(req.session.login){
    nxt();
  }else{
    res.status(403).end();
  }
}) 

/* GET users listing. */
router.get('/',login, function(req, res, next) {
  // res.setHeader('Content-Type','application/json; charset=utf-8');
  // <session 사용법>
  // if(req.session.num){
  //   req.session.num++;
  // }
  // else{
  //   req.session.num=1;
  // }
  // console.log('getSession',req.session.num,req.session);
  console.log('로그인 session : ',req.session.login);
    const sql = "select * from dept";
    const query = pool.query(sql,(err,result,fields)=>{
      console.log(result);
      res.status(200).json(result);
    });
});


router.post('/',(req,res)=>{
  const deptno = req.body.deptno;
  const dname = req.body.dname;
  const loc = req.body.loc;
  // console.log(deptno, dname, loc);
  const sql = `insert into dept values (${deptno},'${dname}','${loc}')`;
  pool.query(sql,(err)=>{
    if(err) return res.status(500).end();
    res.status(200).end();
  })
});


router.get('/:deptno',(req,res)=>{
  
  const deptno = req.params.deptno;
  // console.log('deptno??',req.params.deptno);

  const sql = `select * from dept where deptno=${deptno}`;
  const query = pool.query(sql);
  query
  .on('error', function(err) {
    console.log('error : ',err);
  })
  .on("result",function(row){
    console.log('상세보기',row);
    res.status(200).json(row);
  });
});

module.exports = router;
