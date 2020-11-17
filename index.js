const express = require('express')
const app = express()
const ejsLayouts = require('express-ejs-layouts')

app.set('view engine', 'ejs')
app.use(ejsLayouts)

app.get('/', (req, res)=>{
    res.render('index')
})




//app.listen
app.listen(6000, ()=>{
    console.log('testing for listen')
})