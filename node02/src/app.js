var express = require('express');
var ejs = require('ejs');
var path = require('path');
var mysql = require('mysql');
var bodyParser = require('body-parser')


const PORT=3000;
var app = express();

app.use(express.static(path.join(__dirname,'./../public')));

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())

app.set('views',path.join(__dirname,'../views'));
app.set('view engine','ejs');

// <MySQL 연결>
var conn = mysql.createConnection({
    host:"192.168.99.100",
    user:"scott",
    password:"tiger",
    port:"3306",
    database:"mydb"
})

conn.connect(function(err){
    if(err) throw err;
    console.log("CONN~~~~~~~~~~~");
    // <DATABASE 생성>
    // conn.query("CREATE DATABASE mydb", function (err, result) {
    //     if (err) throw err;
    //     console.log("Database created");
    //   });
    
    // <Table 생성>
    // var sql = "CREATE TABLE IF NOT EXISTS dept (DEPTNO int(11) DEFAULT NULL, DNAME varchar(14) DEFAULT NULL, LOC varchar(13) DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8";
    // <Dummy Data 생성>
    // var sql = "insert into dept values (3333,'회계팀','창원')";
    
    // conn.query(sql, function (err, result) {
    //   if (err) throw err;
    //   console.log("Table created : ",result);
    // });

    // <Table SELECT>
    // var sql = "select * from dept"
    // conn.query(sql, function (err, result,felds) {
    //   if (err) throw err;
    // //   console.log(result);
    //   result.forEach(function(ele,idx){
    //       console.log(ele.DEPTNO, ele.DNAME, ele.LOC);
    //   });
    // });
})

app.get('/intro',function(req,res){
    res.render('intro');
})

app.get('/dept/',function(req,res){
    let sql = "select * from dept"
    conn.query(sql, function (err, result,felds) {
        if (err) throw err;
        // result.forEach(function(ele,idx){
        //     console.log(ele.DEPTNO, ele.DNAME, ele.LOC);
        // });
        res.render('dept/list',{result});
    });
})
app.get('/dept/add',function(req,res){
    res.render('dept/add');
})
app.post('/dept/',function(req,res){
    console.log(req.body);
    let sql = "insert into dept values (?,?,?)";
    conn.query(sql,[req.body.deptno, req.body.dname, req.body.loc], function(err,result){
        res.redirect('./');
    });
})

//detail - get
app.get('/dept/:deptno',function(req,res){
    console.log(req.params.deptno);
    let sql = "select * from dept where deptno=?";
    conn.query(sql,[req.params.deptno],function(err, result,fields){
        if(err) return res.render('dept/detial');
        console.log(result);
        res.render('dept/detial',{dept:result[0]});
    })
    
})

//detail - post
app.post('/dept/:deptno',function(req,res){
    console.log('수정 : ', req.body.deptno, req.body.dname, req.body.loc);
    let arr = [req.body.dname, req.body.loc, req.body.deptno];
    let sql = "update dept set dname=?, loc=? where deptno =?";
    conn.query(sql,arr,function(err,result){
        if(err) 
            return res.render('dept/detail',{dept:{deptno:req.body.deptno, dname: req.body.dname, loc:req.body.loc}});
        if(result.changedRows)
            res.redirect('./');
        else
            return res.render('dept/detail',{dept:{deptno:req.body.deptno, dname: req.body.dname, loc:req.body.loc}});
    })
})

app.delete('/dept/:deptno',function(req,res){
    console.log('삭제 : ',req.params.deptno);
    let deptno = req.params.deptno;
    let sql = `delete from dept where deptno =${deptno}`;
    conn.query(sql,function(){
        res.status(200).send();
    })
});


app.listen(PORT);