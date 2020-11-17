const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    const userString = req.params.string
    res.render('strings/reverse', { plainString: userString, reversedString: userString.split('').reverse().join('')} )
})

stringController.get('/upcase/:string', (req, res) => {
    const userString = req.params.string
    res.render('strings/upcase', { plainString: userString, upperString: userString.toUpperCase() })
})

module.exports = stringController;