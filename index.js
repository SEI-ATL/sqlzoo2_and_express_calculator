const express = require('express')
const app = express()
app.set('view engine', 'ejs')

app.get('/', (req, res) => {
    res.send('Express Calculator')
});

app.listen(8000, () => {
    console.log('server started');
});