const express = require('express');
const app = express();
const ejsLayouts = require('express-ejs-layouts');
const mathController = require('./Controllers/mathController');
const stringController = require('./Controllers/stringController');

app.set('view engine', 'ejs');

app.use(ejsLayouts);

app.get('/', (req, res) => {
    res.render('index.ejs');
});

app.use('/math', mathController);

app.use('/string', stringController);

app.listen(8000, () => {
    console.log('Server has started');
});