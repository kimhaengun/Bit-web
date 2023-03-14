// ===<mongodb 버전 5.x 에서 적용가능>===
// const mongo = require('mongodb');
// const  MongoClient  = mongo.MongoClient;

// // Connection URL
// const url = 'mongodb://127.0.0.1:27018';
// const client = new MongoClient(url);

// // Database Name
// const dbName = 'mydb';

// async function main() {
//   // Use connect method to connect to the server
//   console.log('before');

//   //awiat - client.connect()함수가 종료될떄까지 다음으로 넘어가지 않음
//   //awiat는 async가 적용된 함수에서만 사용할 수 있다.
//   await client.connect(); 
//   console.log('after-','Connected successfully to server');
//   const db = client.db(dbName);
//   console.log('after-','use dbNAME');
//   const collection = db.collection('dept');

//   // the following code examples can be pasted here...

//   return 'done.';
// }

// main();

// ===<mongodb 버전 4.x 에서 적용가능>===
// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://127.0.0.1:27018/mydb";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   console.log("Database created!");
//   db.close();
// });

var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://127.0.0.1:27018/";
let coll;
MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    // <database 생성>
  //   db.db("mydb").createCollection("dept", function(err, res) {
  //     if (err) throw err;
  //     console.log("Collection created!");
  //     db.close();
  //   });
      var dbo = db.db("mydb");
      coll = dbo.collection("dept");


    // <insertOne>
    // var myobj = { deptno: 1111, dname: "전산팀", loc:"부산" };
    // coll.insertOne(myobj, function(err, res) {
    //   if (err) throw err;
    //   console.log("1 document inserted");
    //   db.close();
    // });
    
    // <insertMany>
    // var myobj = [
    //     { deptno: 2222, dname: "물류팀", loc:"대전" },
    //     { deptno: 3333, dname: "영업팀", loc:"서울" },
    //     { deptno: 4444, dname: "생산팀", loc:"대구" }
    //   ];
    //   coll.insertMany(myobj, function(err, res) {
    //     if (err) throw err;
    //     console.log("Number of documents inserted: " + res.insertedCount);
    //     db.close();
    //   });
});
module.exports = {MongoClient,url};