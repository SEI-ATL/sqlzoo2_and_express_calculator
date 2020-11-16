const express = require('express')
const router = express.Router();


router.get('/reverse/:yourString', (req, res) => {
    const yourString = req.params.yourString
    res.render('reverse', {yourString})
})
router.get('/upcase/:yourString', (req, res) => {
    const yourString = req.params.yourString
    res.render('upcase', {yourString})
})

module.exports = router;