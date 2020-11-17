const express = require('express');
// path library already included w/ node
const path = require('path');
const expressEjsLayouts = require('express-ejs-layouts');

const app = express();

app.set('view engine', 'ejs');

app.use(expressEjsLayouts);
app.use('/', express.static(path.join(__dirname, 'public')));

// home route
app.get('/', (req, res) => {
  res.render('index');
});

// for the stylesheet

// localhost:8000/math/double/:parameter
app.use('/math', require('./controllers/math'));
app.use('/string', require('./controllers/string'));

// listen on this port
app.listen(8000, () => {});




// 1. setup all requires
    // 1.1. 'express' >> for app
    // 1.2. 'path' >> for css
    // 1.3. ' express-Ejs-Layouts' >> for layouts

// 2. Create/Setup app
    // 2.1. Create express instance as app
    // 2.2. set app view for ejs engine
    // 2.3 app.use(expressEJsLayouts)
    // 2.4 app.use (ignore public folder for css styling)

// 3. Create routes
    // '/' >> home route in index.js
    // app.use ('start url path', require(imported data from ejs file))

    // Create routers w/ controllers
    // router = require('express').router();
    // instead of app.get, we use router.get
    // create the endpoint
    // module.exports = router >> export the router

// 4. Getting data from req/res objects
    // req/res objects
    // when user reaches an endpoint, the req object sends us data
    // which we can manipulate + pass back into the ejs files with <% %>

// app.use('start url path', the returned controller)
// router.get(' end url path')
//localhost:xxxx/starturlpath/endurlpath/:param or /?searchKey=value

// 5. Listen and start router




// 5. get controllers w/ app. use >> index.js
// 6. listen >> index.js


//notes
// 3 parameters in every route / middleware in express
    // 1. request, 2. response, 3. xx- error (special)
    // req + res  = objects defined by the library being used (express here)
    // can use middleware to change the 2 objects
    // middle ware applies functions to the two objects
    //https://expressjs.com/en/api.html#req