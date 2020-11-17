const express = require('express');
const app = express();
app.set('view engine', 'ejs');
const ejsLayouts = require('express-ejs-layouts')
app.use(ejsLayouts);
const mathController = require('./controllers/mathController');
const stringController = require('./controllers/stringController');

app.get('/', function(req, res){
    
    
    res.render('index');
    res.status(200);
});
// app.get('/double/:doubles', function(req, res){
//     res.render('math/double', {doubles: req.params.doubles} );
    
// })
// app.get('/reverse/:reverse', function(req, res){
//     function revverse(str){
//         return str.split("").reverse().join("");
//       }
      
//     res.render('strings/reverse', {reverse: req.params.reverse});
    
// })

//  app.get('/square/:square', function(req, res){
//     res.render('math/square', {square: req.params.square});
    
// })

// app.get('/uppercase/:upper', (req, res) =>{
    
//     res.render('strings/uppercase', {upper:req.params.upper});
    
// })

app.use('/math', mathController);



app.use('/string', stringController);



app.listen(5000, () => {
    console.log('server started!')
});
