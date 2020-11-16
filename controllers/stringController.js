const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    const userString = req.params.string
    res.render('strings/reverse', { string: userString })
})

stringController.get('/upcase/:string', (req, res) => {
    const userString = req.params.string
    res.render('strings/upcase', { string: userString })
})

module.exports = stringController;