
const mathController = require('express').Router()


mathController.get('/double/:number', (req, res) => {
    const number = req.params.number
    res.render('double', {number})
})

mathController.get('/square/:number', (req, res) => {
    const number = req.params.number
    res.render('square', {number})
})


module.exports = mathController;