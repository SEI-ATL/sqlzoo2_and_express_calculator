const express = require('express');
const app = express();
const ejsLayouts = require('express-ejs-layouts')

const mathController = require('./controllers/mathController')
const stringController = require('./controllers/stringController')

app.set('view engine', 'ejs')
app.use(ejsLayouts)



//----------------------------- Pages
app.get('/', (req, res) => {
    res.render('index')
})

app.use('/math', mathController)

app.use('/string', stringController)


//----------------------------- Listen
app.listen (5000, () => {
    console.log('Website Reloaded')
});
