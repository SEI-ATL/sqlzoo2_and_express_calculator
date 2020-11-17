// Import modules
const express = require('express')
const ejsLayouts = require('express-ejs-layouts')
const mathController = require('./controllers/mathController')
const stringController = require('./controllers/stringController')

// Invoke modules
const app = express()

// Set modules
app.set('view engine', 'ejs')

// Use modules
app.use(ejsLayouts)
app.use('/math', mathController)
app.use('/string', stringController)

// Create routes
app.get('/', (req, res) => {
    res.render('index')
})

// Listen command
app.listen(8000, () => {
    console.log('server has started!')
})