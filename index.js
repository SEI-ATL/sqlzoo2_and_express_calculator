//import
const express = require('express');
const app = express();

//view engine
app.set('view engine', 'ejs');

//routes
app.get('/', (req, res) => {
    res.render('homepage');
})



//assign port
app.listen(8000, () => console.log('server started'));