const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mysql = require('promise-mysql');
const path = require('path');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

const config = require('./config');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(express.static(/*__dirname+*/'public/app/browser'));

app.use(function(req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type, \ Authorization');
    next();
});


mysql.createPool(config.pool).then(pool=> {
    const authRouter = require('./app/routes/authenticate')(express, pool, jwt, config.secret, crypto);
    app.use('/authenticate',authRouter)

    const apiRouter = require('./app/routes/api')(express,pool, crypto);
    app.use('/api', apiRouter)
});

app.get('/', function(req, res) {
    console.log('Request path:', req.path);
    res.sendFile(path.join(__dirname + '/public/app/browser/index.html'));
});

app.listen(config.port);

console.log('Running on port ' + config.port);