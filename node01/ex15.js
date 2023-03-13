const { constants } = require('buffer');
var fs = require('fs');
fs.stat('js02', function(a,b){
    console.log(a,b);
})