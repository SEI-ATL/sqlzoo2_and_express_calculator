const express = require('express');
const router = express();

router.get('/double/:num', (req, res) => {
    res.render('math/double', { num: req.params.num });
})

router.get('/square/:num', (req, res) => {

    res.render('math/square', { num: req.params.num });
})


module.exports = router;