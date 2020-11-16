const mathController = require('express').Router()

mathController.get('/double', (req, res) => {

    res.render('double')
})

mathController.get('/square', (req, res) => {

    res.render('square')
})

module.exports = mathController;