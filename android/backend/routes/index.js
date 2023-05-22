var express = require('express');
var router = express.Router();

const User = require('./user');

router.use('/user', User);

router.get('/', function(req, res, next) {
  res.send('hello world!!');
});

module.exports = router;