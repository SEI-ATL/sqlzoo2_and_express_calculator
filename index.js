const express = require('express')
const ejsLayouts = require('express-ejs-layouts')

const { mathController, stringController } = require('./controllers/')


const app = express()
const port = process.env.PORT || 5500

app.set('view engine', 'ejs')
app.use(ejsLayouts)

app.use('/math', mathController)
app.use('/string', stringController)

app.get('/', (_, res) => {
  res.render('instructions')
})
app.get('/instructions', (_, res) => {
  res.redirect('/instructions')
})

app.listen(port, () => { console.log(`Listening on ${port}`) })
