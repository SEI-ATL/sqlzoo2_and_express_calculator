const express = require('express')
const app = express()
const ejsLayouts = require('express-ejs-layouts')



app.set('view engine', 'ejs')
app.use(ejsLayouts)

app.get('/', (req, res) => {
    res.render('index')
})

app.use('/math', require('./controllers/mathController'))
app.use('/string', require('./controllers/stringController'))

app.listen(8000, () => {
    console.log('server has started!');
})