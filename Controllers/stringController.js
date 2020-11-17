const stringController = require('express').Router();

stringController.get('/reverse/:reverse', (req, res) => {
    const string = req.params.reverse;
    const reverseString = string.split('').reverse().join('');
    res.render('reverse.ejs', {reverse: reverseString, input: string});
});

stringController.get('/upcase/:upcase', (req, res) => {
    const string = req.params.upcase;
    const upcaseString = string.toUpperCase();
    res.render('upcase.ejs', {upcase: upcaseString, input: string});
});

module.exports = stringController;
