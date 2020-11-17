const express = require('express')
const app = express()
const ejslayouts = require('express-ejs-layouts')

const mathController = require('./Controllers/mathController')
const stringController = require('./Controllers/stringController')

app.set('view engine', 'ejs')
app.use(ejslayouts)

app.get('/',(req,res)=>{
    res.render('index')
})

app.use('/math', mathController)
app.use('/string',stringController)

app.listen(8000,()=>{
    console.log('Server started')
})