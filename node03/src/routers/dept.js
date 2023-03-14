const express = require('express');
const router = express.Router();
const MongoClient = require('../modules/mongodb').MongoClient;
const url = require('../modules/mongodb').url;
const ObjectId = require('mongodb').ObjectId;

// <findAll>
router.get('/', (req,res)=>{
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
          var dbo = db.db("mydb");
          coll = dbo.collection("dept");
        var result = coll.find({});
        result.toArray(function(err, result) {
        if (err) throw err;
        console.log(result);
        // db.close();
        res.render('dept/list',{result});
        });
});
});
router.post('/',(req,res)=>{
    var myobj = { 
            deptno: req.body.deptno ,
            dname: req.body.dname, 
            loc:req.body.loc 
        };
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db("mydb");
        coll = dbo.collection("dept");
    
        coll.insertOne(myobj, function(err, result) {
          if (err) throw err;
          console.log("1 document inserted");
          db.close();
          res.redirect('./');
        });
    });
});

router.get('/add',(req,res)=>{
    res.render('dept/add');
});

//상세보기
router.get('/:id',(req,res)=>{
    let param =req.params.id;
    console.log('상세 : ',req.params.id);
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db("mydb");
        coll = dbo.collection("dept");
        coll.findOne({_id:ObjectId(param)},(err,result)=>{
            if(err) throw err;
            console.log('상세보기 : '+result);
            res.render('dept/detail',{dept:result});
        });
});
});



module.exports = router;
