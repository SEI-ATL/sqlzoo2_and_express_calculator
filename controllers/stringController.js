const stringController = require('express').Router();

stringController.get('/reverse/:string', (req, res) => {
    const string = req.params.string
    
    res.render('./string/reverse', { string: string })
});

stringController.get('/upcase/:string', (req, res) => {
    const string = req.params.string
    
    res.render('./string/upcase', { string: string })
});

module.exports = stringController;