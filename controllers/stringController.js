const stringController = require('express').Router()

stringController.get('/reverse/:input', (req, res) => {
    const string = req.params.input;
    function reverseString(string) {
        return string.split("").reverse().join("");
    }
    res.render('reverse', {string, reverseString});
})

stringController.get('/upcase/:input', (req, res) => {
    const string = req.params.input;
    res.render('upcase', {string});
})

module.exports = stringController;