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

app.use('/math', mathController);
app.use('/string', stringController);



app.listen(5000, () => {
    console.log('server started!')
});
