const express = require('express');
const app = express();
const ejsLayouts = require('express-ejs-layouts');




app.set('view engine', 'ejs')
app.use(ejsLayouts)

const mathController = require('./controllers/mathController')
const stringController = require('./controllers/stringController')

app.get('/', (req, res) => {
    res.render('index')
})

app.use('/math', mathController);
app.use('/string', stringController);


app.listen(8000, () => {
    console.log('server has started')
})