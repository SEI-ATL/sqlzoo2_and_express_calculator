const mathController = require('express').Router()

mathController.get('/double/:input', (req, res) => {
    const number = req.params.input;
    res.render('double', {number});
})

mathController.get('/square/:input', (req, res) => {
    const number = req.params.input;
    res.render('square', {number});
})

module.exports = mathController;