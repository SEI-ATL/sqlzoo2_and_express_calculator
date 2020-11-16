const express = require('express')
const app = express()
const ejsLayouts = require('express-ejs-layouts')
const router = express.Router()

app.set('view engine', 'ejs')
app.use('/math', require('./mathControllers/math'))
app.use('/string', require('./stringControllers/string'))




function reverseString(str){
    let newStr = str.split('')
    newStr = newStr.rever()
    newStr.join('')
    return newStr
}


app.listen(1337, () =>{
    console.log('server has started!')
})