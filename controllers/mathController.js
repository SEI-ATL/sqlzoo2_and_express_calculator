const mathController = require('express').Router()

mathController.get('/double/:num', (req, res) => {
    const browserNum = req.params.num
    res.render('double', {num: browserNum})
})

mathController.get('/square/:num', (req, res) => {
    const browserNum1 = req.params.num
    res.render('square', {num: browserNum1})
})



module.exports = mathController;