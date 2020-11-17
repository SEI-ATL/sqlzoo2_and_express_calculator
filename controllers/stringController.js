const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    const string = req.params.string

    res.render('string/reverse', { initialString: string, reversedString: string.split(''). reverse().join('')})
})

stringController.get('upcase/:string', (req, res) => {
    const string = req.params.string

    res.render('string/upcase', { initialString: string, upcasedString: string.split(''). toUpperCase().join('')})
})



module.exports = stringController