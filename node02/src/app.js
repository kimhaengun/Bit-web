var express = require('express');
var ejs = require('ejs');
var path = require('path');

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


// <모듈화 - router>
app.use('/',require('./routes/'));
app.use('/dept',require('./routes/dept'));




app.listen(PORT);