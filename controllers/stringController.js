const stringController = require('express').Router();

stringController.get('/reverse/:string', (req, res) => {
    res.render('reverse', { string: req.params.string });
})

stringController.get('/upcase/:string', (req, res) => {
    res.render('upcase', { string: req.params.string });
})

module.exports = stringController;