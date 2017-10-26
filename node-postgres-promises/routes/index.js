var express = require('express');
var router = express.Router();

/* GET home page. */
var db = require('/Users/xuke/Desktop/node-postgres-promises/queries.js');
router.get('/', function(req, res, next) {
  res.render('index', { title: 'ulpa' });
});

router.get('/api', db.getAllinformation);
router.get('/api/language/:title', db.getSingleLanguage);
router.get('/api/stateSchool/', db.getLocation);
router.get('/api/languagename',db.getAllLanguage);
router.get('/api/languageDescription',db.getdescription);





module.exports = router;
