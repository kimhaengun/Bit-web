var query = require('querystring');
var msg = "where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%E3%85%87%E3%85%88%E3%85%82%E3%85%87%E3%85%82%E3%85%88%E3%85%87%E3%85%88%E3%85%82%E3%85%87%E3%85%88%E3%85%82%E3%85%87%E3%84%B4%E3%85%81%E3%85%87";
console.log(query.parse(msg));
console.log(query.stringify(query.parse(msg)));