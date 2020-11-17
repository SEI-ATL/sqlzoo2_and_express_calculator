//import
const express = require('express');
const app = express();
const ejsLayouts = require('express-ejs-layouts');

//init impoirts
app.set('view engine', 'ejs');
app.use(ejsLayouts);

//routes
app.get('/', (req, res) => {
    res.render('instructions');
})



//assign port
app.listen(8000, () => console.log('server started'));