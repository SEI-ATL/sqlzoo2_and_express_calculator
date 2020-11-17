const mathController = require('express').Router();

mathController.get('/double/:doubles', function(req, res){
    res.render('math/double', {doubles: req.params.doubles} );
    
})




mathController.get('/square/:square', function(req, res){
    res.render('math/square', {square: req.params.square});
    
})


module.exports = mathController;