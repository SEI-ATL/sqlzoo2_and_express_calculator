//import
const express = require('express');
const app = express();
const ejsLayouts = require('express-ejs-layouts');

const mathController = require('./controllers/mathController')
const stringController = require('./controllers/stringController')

app.set('view engine', 'ejs');
app.use(ejsLayouts);

app.get('/', (req, res)=>{
    res.render('index')
})

app.use('/math', mathController);
app.use('/string', stringController);



//app.listen
app.listen(8000, ()=>{
    console.log('testing for listen');
})