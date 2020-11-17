const stringController = require('express').Router();

stringController.get('/reverse/:reverse', function(req, res){
    function revverse(str){
        return str.split("").reverse().join("");
      }
      
    res.render('strings/reverse', {reverse: req.params.reverse});
    
})

stringController.get('/uppercase/:upper', (req, res) =>{
    
    res.render('strings/uppercase', {upper:req.params.upper});
    
})


module.exports = stringController;