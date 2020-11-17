const app = require('express')()
app.set('view engine', 'ejs')
app.use(require('express-ejs-layouts'))

app.get('/', (req, res) => {
    res.render('home')
})
app.use('/math', require('./Controllers/mathController'))

app.listen(8000, () => {
    console.log('server started.')
})