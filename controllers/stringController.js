const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    const number = req.params.string
    res.render('reverse', {number})
})

stringController.get('/upcase/:string', (req, res) => {
    const string = req.params.string
    res.render('upcase', {string})
})


module.exports = stringController;