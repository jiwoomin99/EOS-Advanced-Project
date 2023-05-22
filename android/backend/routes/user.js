var express = require('express');
var router = express.Router();
const app = require('../app');

router.get('/login/:email', (req, res) => {
  app.getConnectionPool((conn) => {
    var sql = "SELECT * FROM user WHERE email='" + req.params.email+"'";
    console.log(sql)
    conn.query(sql, function(err, [user]) {
      conn.release();
      if(err) {
        res.status(400).json({
          error_message: "query 문법 오류"
        })
      }
      else if(!user) {
        res.status(400).json({
          error_message: "존재하지 않는 user"
        })
      } else {
        if (user["password"] == req.headers.password) {
          var result = {
            result: "login success"
          }
        } else {
          console.log(user["password"])
          var result = {
            result: "wrong password",
            id: user["id"],
            email: user["email"]
          }
        }
        res.json(result);
      }
    })
  })
})

router.post('/signup', (req, res) => {
  app.getConnectionPool((conn) => {
    var sql_check = "select * from user where email='" + req.body.email + "'";
    conn.query(sql_check, function(err, [user]) {
      if (user) {
        res.status(400).json({
          error_message: "중복 가입"
        })
      } else {
        var sql = "insert into user SET ?"
        console.log(sql)
        var values = {
          email: req.body.email,
          password: req.body.password
        }
        conn.query(sql, values, function(error, results) {
          conn.release()
          if(error) {
            res.status(400).json({
              error_message: "query 문법 오류"
            })
          } else {
            var result = {
              result: "signup success"
            }
            res.json(result);
          }
        })
      }
    })
  })
})

module.exports = router;