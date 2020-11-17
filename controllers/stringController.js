const router = require('express').Router()

router.get('/reverse/:string', (req, res) => {
  const { string } = req.params,
    operation = 'times two'

  const calculate = string.split('').reverse().join('');
  res.render('string/string', { input: string, operation, calculate })
})
router.get('/upper/:string', (req, res) => {
  const { string } = req.params,
    operation = 'capitalized'

  const calculate = string.toUpperCase()
  res.render('string/string', { input: string, operation, calculate })
})

module.exports = router;
