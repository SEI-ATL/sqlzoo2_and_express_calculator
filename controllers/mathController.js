const mathController = require('express').Router();

mathController.get('/double/:num', (req, res) => {
    res.render('double', { num: req.params.num });
})

mathController.get('/square/:num', (req, res) => {
    res.render('square', { num: req.params.num });
})

module.exports = mathController;