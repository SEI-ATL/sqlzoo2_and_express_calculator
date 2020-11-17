const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    const yourString = req.params.string
    

    res.render('string/reverse', { string: yourString})
})

stringController.get('/upcase/:string', (req, res) => {
    const yourString = req.params.string
    
    res.render('string/upcase', { string: yourString})
})

module.exports = stringController