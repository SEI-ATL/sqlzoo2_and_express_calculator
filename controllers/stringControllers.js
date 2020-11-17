const express = require('express');
const router = express.Router();

router.get('/reverse/:yourStri', (req, res) => {
    const yourStr = req.params.yourStr
    res.render('reverse', {yourStr})
})


router.get('/upcase/:yourStr', (req, res) => {
    const yourStr = req.params.yourStr
    res.render('upcase', {yourStr})
})


module.exports = router;