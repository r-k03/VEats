const express = require('express');
const appService = require('./appService');

const router = express.Router();
const path = require('path');
/**
 * API ENDPOINTS HERE
 */

router.use(express.static(path.join(__dirname, 'public')));

router.get('/home', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'home.html'));
});

router.get('/demotable', async (req, res) => {
    const tableContent = await appService.fetchRestaurants();
    res.json({data: tableContent});
});





module.exports = router;