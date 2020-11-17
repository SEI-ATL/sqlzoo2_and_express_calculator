let express = require('express');
let app = express();
let ejsLayouts = require('express-ejs-layouts');
let mathController = require('./controllers/mathController');
let stringController = require('./controllers/stringController');

app.set('view engine', 'ejs');
app.use(ejsLayouts);
app.use('/math', mathController);
app.use('/string', stringController);

// Home route

app.get('/', (req, res) => {
  res.render('index');
});

// Listen

app.listen(8000, () => {
  console.log('The server is up and running!');
});