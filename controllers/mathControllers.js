const express = require('express');
const router = express.Router();


router.get('/double/:number', (req, res) => {
    const number = req.params.number
    res.render('double', {number})
})

router.get('/square/:number', (req, res) => {
    const number = req.params.number
    res.render('square', {number})
})


module.exports = router;