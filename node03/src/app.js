const express = require('express');
const app = express();
const rootRouter = require('./routers');
const ejs =require('ejs');
const path = require('path');
const deptRouter = require('./routers/dept');

app.use(express.static(path.join(__dirname,'../public')));
app.set('views',path.join(__dirname,'../views'));
app.set('view engine','ejs');


app.use(express.urlencoded({extended:false}));

app.use('/',rootRouter);
app.use('/dept',deptRouter);

app.listen(3000);