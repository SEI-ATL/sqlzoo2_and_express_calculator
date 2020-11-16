const express = require('express');
const app = express();
const expressLayouts = require('express-ejs-layouts');
const mathController = require('./controllers/mathController');
const stringController = require('./controllers/stringController');


app.set('view engine', 'ejs');
app.use(expressLayouts);

app.get('/', (req, res) => {
    res.render('index')
})

app.use('/math', mathController);
app.use('/string', stringController);


app.listen(8001, () => {
    console.log('Server has started')
})