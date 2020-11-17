const mathController = require('express').Router()

mathController.get('/double', (req, res) => {
    res.render('mathDouble')
})

mathController.get('/square', (req, res) => {
    res.render('mathSquare')
})

module.exports = mathController
