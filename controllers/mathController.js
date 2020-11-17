const mathController = require('express').Router()

mathController.get('/double/:num', (req, res) => {
    const browserNum = req.params.num
    res.render('double', { num: browserNum })
})

mathController.get('/square/:num', (req, res) => {
    const browserNum = req.params.num
    res.render('square', { num: browserNum })
})

module.exports = mathController