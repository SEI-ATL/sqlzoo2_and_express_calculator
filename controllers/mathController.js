const router = require('express').Router()

router.get('/double/:num', (req, res) => {
  const { num } = req.params,
    operation = 'times two'

  const calculate = parseInt(num) * 2
  res.render('math/math', { num, operation, calculate })
})
router.get('/square/:num', (req, res) => {
  const { num } = req.params,
    operation = 'squared'

  const calculate = parseInt(num) ** 2
  res.render('math/math', { num, operation, calculate })
})

module.exports = router;
