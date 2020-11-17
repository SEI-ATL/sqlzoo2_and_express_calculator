const mathController = require('express').Router();

mathController.get('/double/:math', (req, res) => {
    const num = req.params.math
    
    res.render('./math/double', { math: num })
});

mathController.get('/square/:math', (req, res) => {
    const num = req.params.math
    
    res.render('./math/square', { math: num })
});

module.exports = mathController;