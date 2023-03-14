const mysql = require('mysql');
const info = {
    connectionLimit : 10,
    host:"192.168.99.100",
    user:"scott",
    password:"tiger",
    port:"3306",
    database:"mydb"
  };
const pool = mysql.createPool(info);
module.exports=pool;