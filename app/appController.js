const express = require('express');
const appService = require('./appService');

const router = express.Router();
// router.use(express.json());
// router.use(express.raw({type: "application/*", limit: "10mb"}));

/**
 * API ENDPOINTS HERE
 */

router.post('/login', async (req, res) => {
    const {id, phone} = req.body 
    const result = await appService.findUser(id, phone);
    if (result > 0) {
        res.sendStatus(200);
    } else {
        res.sendStatus(401);
    }
});







module.exports = router;