const express = require('express');
const app = express();
const expressEjsLayouts = require('express-ejs-layouts');

app.set('view engine', 'ejs');
app.use(expressEjsLayouts)
    //css
app.use(express.static(__dirname + '/public'));
app.use('/style', express.static(__dirname + 'public/style'));

app.get('/', (req, res) => {
    res.render('index')
})

app.use('/math', require('./controllers/mathController'));
app.use('/string', require('./controllers/stringController'));




app.listen(8000, () => console.log('start'));