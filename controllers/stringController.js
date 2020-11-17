const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    res.render('strings/reverse', { string: req.params.string })
})

stringController.get('/upcase/:string', (req, res) => {
    res.render('strings/upcase', { string: req.params.string })
})

module.exports = stringController