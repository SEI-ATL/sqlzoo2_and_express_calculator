const mathController = require('express').Router()

mathController.get('/double/:number', (req, res) => {
    const userNumber = req.params.number
    res.render('math/double', { number: userNumber })
})

mathController.get('/square/:number', (req, res) => {
    const userNumber = req.params.number
    res.render('math/square', { number: userNumber })
})

module.exports = mathController;