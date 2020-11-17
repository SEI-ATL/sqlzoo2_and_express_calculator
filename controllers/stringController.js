const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    
    res.render('string/reverse', { string: req.params.string })
})

stringController.get('/upper/:string', (req, res) => {
    
    res.render('string/upper', { string: req.params.string })
})

module.exports = stringController;