const express = require('express')
const app = express()
const ejsLayouts = require('express-ejs-layouts')
const router = express.Router()
const mathControllers = require('./controllers/mathControllers')
const stringControllers = require('./controllers/stringControllers')

app.set('view engine', 'ejs')
// app.use(ejsLayouts);

app.use('/math', mathControllers)
app.use('/string', stringControllers)



app.listen(8000, () => {
    console.log('Im listening boss!')
})