var mysql = require('mysql');
var conn = mysql.createConnection({
    host:"192.168.99.100",
    user:"scott",
    password:"tiger",
    database:"lecture"
});

conn.connect(function(err){
    console.log(err);
    console.log('connect~~~~~~~~~~~~~~~~~~~~~~~~~~');
})

