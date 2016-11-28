'use strict'

var Express = require('express');
var Mongojs = require('mongojs');

const PORT = 8080;
const MONGOIP = "172.20.0.7:28017";

// TODO: DB connection goes here
//var db = Mongojs(connectionString, [collections]);
// Maybe like this?
//var db = Mongojs(<mongo ip + port>, ['orders']);
// Or just the db connection
var db = Mongojs("mongodb://172.20.0.7:27017/ordersDB", ['orders']);
//var orders = db.collection('orders');

const app = Express();
// Routes
app.get("/", function(req, res) {
  res.send("/");
});

app.get("/backend/orders", function(req, res) {
    db.orders.find(function (err, docs) {
        var ordered = [];
        for( var i = 0; i < docs.length; ++i ){
           if( docs[i].ordered == 1 ){
              ordered.push( docs[i].name );
           }
        }
        res.json(ordered); 
  });
});

app.listen(PORT);
console.log('Node backend running on port ' + PORT);
