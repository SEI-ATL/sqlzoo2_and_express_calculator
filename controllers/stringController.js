const express = require('express');
const router = express();

router.get('/reverse/:str', (req, res) => {
    res.render('string/reverse', { str: req.params.str })
})

router.get('/upcase/:str', (req, res) => {
    res.render('string/upcase', { str: req.params.str })
})

module.exports = router;