const mathController = require('express').Router()

mathController.get('/double', (req, res) => {
    res.render('mathDouble')
})

module.exports = mathController
