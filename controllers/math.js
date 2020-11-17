const router = require('express').Router();

// math/double
router.get('/double/:number', (req, res) => {
  // req.params
  let doubleNum = 2 * req.params.number;
  res.render('math/double', {
    title: 'Math - Double',
    number: req.params.number,
    doubleNum,
  });
});

//math/square
router.get('/square/:number', (req, res) => {
  let squareNum = req.params.number ** 2;
  res.render('math/square', {
    title: 'Math - Double',
    number: req.params.number,
    squareNum,
  });
});

module.exports = router;
