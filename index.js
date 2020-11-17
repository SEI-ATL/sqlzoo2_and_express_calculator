//import
const express = require('express');
const app = express();
const ejsLayouts = require('express-ejs-layouts');
const mathController = require('./controllers/mathController');
const stringController = require('./controllers/stringController');

//init impoirts
app.set('view engine', 'ejs');
app.use(ejsLayouts);

//routes
app.get('/', (req, res) => {
    res.render('instructions');
})

app.use('/math', mathController);
app.use('/string', stringController);


//assign port
app.listen(8000, () => console.log('server started'));