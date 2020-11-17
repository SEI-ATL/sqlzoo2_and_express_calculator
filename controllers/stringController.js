const stringController = require('express').Router()

stringController.get('/reverse', (req, res) => {
    res.render('stringReverse')
})

stringController.get('/uppercase', (req, res) => {
    res.render('stringUpper')
})

module.exports = stringController
