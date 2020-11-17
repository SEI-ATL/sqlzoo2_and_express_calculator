const stringController = require('express').Router();

stringController.get('/reverse/:yourStr', (req, res) => {
    const yourStr = req.params.yourStr
    res.render('reverse', {yourStr})
})


stringController.get('/upcase/:yourStr', (req, res) => {
    const yourStr = req.params.yourStr
    res.render('upcase', {yourStr})
})


module.exports = stringController;