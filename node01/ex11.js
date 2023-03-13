var crypto = require('crypto');
var msg = 'abcdefg';
var key = 'mykey';
var hash = crypto.createHash('sha512');
hash.update(msg+key);
console.log(hash.digest('hex'));