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
    var sql = "select * from dept"
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
    var sql = "insert into dept values (?,?,?)";
    conn.query(sql,[req.body.deptno, req.body.dname, req.body.loc], function(err,result){
        res.redirect('./');
    });
})

app.listen(PORT);