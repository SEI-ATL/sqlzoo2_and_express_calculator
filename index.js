const express = require('express')
const app = express()
const ejsLayouts = require('express-ejs-layouts')

app.set('view engine', 'ejs')


app.get('/math/doubles/:number', (req, res) => {
    // let number = :number;
    const number = req.params.number
    res.render('doubles', {number})
})
app.get('/math/square/:number', (req, res) => {
    let outputNumber = number * number
})





app.listen(1337, () =>{
    console.log('server has started!')
})