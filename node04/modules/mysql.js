var mysql = require('mysql');
var pool  = mysql.createPool({
  connectionLimit : 10,
  host            : '192.168.99.100',
  user            : 'scott',
  password        : 'tiger',
  database        : 'mydb'
});

module.exports=pool;