const stringController = require('express').Router()

stringController.get('/reverse/:string', (req, res) => {
    const reverse = req.params.string
    res.render('reverse', {string: reverse})
})

stringController.get('/upcase/:string', (req, res) => {
    const upcase = req.params.string
    res.render('upcase', {string: upcase})
})

module.exports = stringController