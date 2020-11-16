let express = require('express');
let app = express();

// Home route

app.get('/', (req, res) => {
  res.send('This is the home page.');
});

// Listen

app.listen(8000, () => {
  console.log('The server is up and running!');
});