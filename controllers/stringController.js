const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    const userString = req.params.string
    res.render('reverse', { string: userString })
})

stringController.get('/upcase/:string', (req, res) => {
    const userString = req.params.string
    res.render('upcase', { string: userString })
})

module.exports = stringController;