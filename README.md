# Express Calculator

## File Structure
- mkdir
- install 3 packages (express, ejs, express-ejs-layouts)
- create views folder with 2 subdirectories (string and math)
- touch 5 ejs files (index, double, square, reverse, uppercase)
- reate controllers folder

## Create Index.js
- import modules
```js
const express = require('express');
const app = express();
app.set('view engine', 'ejs');
const ejsLayouts = require('express-ejs-layouts')
```
- add a listner
```js
app.listen(5000, () => {
    console.log('server started!')
```

## Create Layout 
- Head
- Link
- H1
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Express Calculator</title>
</head>
<body>
    <h1>Express Calculator</h1>
    <h4>
        <a href="/">instructions</a>  
    </h4>
<%- body %>
</body>
</html>
```

## Populate ejs pages
Message add content to the ejs pages
```html
<h1>Double</h1>

<h2>You inputted <%= doubles %>. This number times two is <%= doubles * 2 %> </h2>
```
## Set Up Index.js and routes
```js
//route
app.get('/', function(req, res){
    
    
    res.render('index');
    res.status(200);
});


///Double the number
app.get('/double/:doubles', function(req, res){
    res.render('math/double', {doubles: req.params.doubles} );
    
})
///Reverse the string
app.get('/reverse/:reverse', function(req, res){
    function revverse(str){
        return str.split("").reverse().join("");
      }
      
    res.render('strings/reverse', {reverse: req.params.reverse});
    
})
///Square the number
 app.get('/square/:square', function(req, res){
    res.render('math/square', {square: req.params.square});
    
})
///Upcase the string
app.get('/uppercase/:upper', (req, res) =>{
    
    res.render('strings/uppercase', {upper:req.params.upper});
    
})
```

## Controllers
- create 2 controller files(math and string)
- import express - export modules
```js
const mathController = require('express').Router();
module.exports = mathController;
```
- import routes and code
- adjust index.js - import controllers - remove get requests
```js
const mathController = require('./controllers/mathController');
const stringController = require('./controllers/stringController');

app.use('/math', mathController);
app.use('/string', stringController);

```


## Enable Variables inside  index.js render methods
```
mathController.get('/double/:doubles', function(req, res){
    res.render('math/double', {doubles: req.params.doubles} );
    
})
```