const mathController = require('express').Router()

mathController.get('/double/:number', (req, res) => {
    const userNumber = req.params.number
    res.render('math/double', { number: userNumber, doubleNumber: userNumber * 2 })
})

mathController.get('/square/:number', (req, res) => {
    const userNumber = req.params.number
    res.render('math/square', { number: userNumber, squareNumber: userNumber * userNumber })
})

module.exports = mathController;