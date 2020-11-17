let router = require('express').Router();

router.get('/double/:number', (req, res) => {
  res.render('math/math-double', { number: req.params.number });
});

router.get('/square/:number', (req, res) => {
  res.render('math/math-square', { number: req.params.number });
});

module.exports = router;