const stringController = require('express').Router();

stringController.get('/reverse', (req, res) => {
    res.render('reverse');
})

stringController.get('/upcase', (req, res) => {
    res.render('upcase');
})

module.exports = stringController;