const express = require('express')
const app = express()
const ejsLayouts = require('express-ejs-layouts')

app.set('view engine', 'ejs')


app.get('/math/double/:number', (req, res) => {
    // let number = :number;
    const number = req.params.number
    res.render('double', {number})
})
app.get('/math/square/:number', (req, res) => {
    // let number = :number;
    const number = req.params.number
    res.render('square', {number})
})
app.get('/string/reverse/:yourString', (req, res) => {
    const yourString = req.params.yourString
    res.render('reverse', {yourString})
})
app.get('/string/upcase/:yourString', (req, res) => {
    const yourString = req.params.yourString
    res.render('upcase', {yourString})
})


function reverseString(str){
    let newStr = str.split('')
    newStr = newStr.rever()
    newStr.join('')
    return newStr
}


app.listen(1337, () =>{
    console.log('server has started!')
})