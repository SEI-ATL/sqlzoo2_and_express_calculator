const router = require('express').Router();

// string/reverse
router.get('/reverse/:string', (req, res) => {
  let str = req.params.string;
  let reverseStr = '';
  for (let i = str.length - 1; i >= 0; i--) {
    reverseStr += str[i];
  }

  res.render('string/reverse', {
    title: 'String - Reverse',
    string: req.params.string,
    reverseStr,
  });
});

//string/upcase
router.get('/upcase/:string', (req, res) => {
  let upStr = req.params.string.toUpperCase();

  res.render('string/upcase', {
    title: 'String - Uppercase',
    string: req.params.string,
    upStr,
  });
});

module.exports = router;
