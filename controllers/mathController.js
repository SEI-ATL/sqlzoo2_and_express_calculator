const mathController = require('express').Router()

mathController.get('/double/:number', (req, res) => {
    const number = parseInt(req.params.number)

    res.render('math/double', { initialNumber: number, doubledNumber: number * 2 })
})

mathController.get('/square/:number', (req, res) => {
    const number = parseInt(req.params.number)

    res.render('math.square', { initialNumber: number, squareNumber: number * number})
})








module.exports = mathController