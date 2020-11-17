const mathController = require('express').Router()

mathController.get('/double/:number', (req, res) => {
    const double = req.params.number
    res.render('double', {number: double})
})

mathController.get('/square/:number', (req, res) => {
    const square = req.params.number
    res.render('square', {number: square})
})

module.exports = mathController