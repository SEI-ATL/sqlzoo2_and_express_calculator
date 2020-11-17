const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    const browserString = req.params.string
    res.render('reverse', {string: browserString})
})

stringController.get('/upcase/:string', (req, res) => {
    const browserString1 = req.params.string
    res.render('upcase', {string: browserString1})
})



module.exports = stringController;