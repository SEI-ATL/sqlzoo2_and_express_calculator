const mathController = require('express').Router()

mathController.get('/double/:number', (req, res) => {
    const yourNumber = req.params.number;

    res.render('math/double', { number: yourNumber});
});

mathController.get('/square/:number', (req, res) => {
    const yourNumber = req.params.number;

    res.render('math/square', { number: yourNumber});
});


module.exports = mathController