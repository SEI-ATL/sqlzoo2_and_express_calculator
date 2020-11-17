const mathController = require('express').Router()

mathController.get('/double/:number', (req, res) => {
    
    res.render('math/double', { number: req.params.number })
})

mathController.get('/square/:number', (req, res) => {
    
    res.render('math/square', { number: req.params.number })
})

module.exports = mathController;