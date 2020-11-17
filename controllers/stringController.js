let router = require('express').Router();

router.get('/reverse/:string', (req, res) => {
  res.render('string/string-reverse', { string: req.params.string });
});

router.get('/upcase/:string', (req, res) => {
  res.render('string/string-upcase', { string: req.params.string });
});

module.exports = router;