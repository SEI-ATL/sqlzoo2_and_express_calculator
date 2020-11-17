const mathController = require('express').Router();

mathController.get('/double/:double', (req, res) => {
    const num = req.params.double;
    const doubleNum = num * 2;
    res.render('double.ejs', {double: doubleNum, input: num});
});

mathController.get('/square/:square', (req, res) => {
    const num = req.params.square;
    const squareNum = num * num;
    res.render('square.ejs', {square: squareNum, input: num});
});

module.exports = mathController;