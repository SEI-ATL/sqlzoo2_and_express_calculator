const express = require('express')
const app = express()
const ejsLayouts = require('express-ejs-layouts')
const mathController = require('./controllers/mathController')
const stringController = require('./controllers/stringController')

app.set('view engine', 'ejs')
app.use(ejsLayouts)

app.get('/', function(req, res) {
    res.render('home');
  });

//   app.get('/animals', function(req, res) {
//     res.render('animals', {title: 'Favorite Animals', animals: ['sand crab', 'corny joke dog']})
//   });

app.get('/math/double/:number', (req, res) => { // this makes the /blog page irrelevant without a date
    const theNumber = req.params.number;
    res.render('blog', { number: theNumber }); //
});

app.get('/strings/:string', (req, res) => { // this makes the /blog page irrelevant without a date
    const theString = req.params.string;
    res.render('blog', { string: theString }); //
});
// res.send("Our parameter is " + req.params.input + ".");

app.use('/math', mathController)
app.use('/strings', stringController)

app.listen(8000, () => {
    console.log('server started!');
});
