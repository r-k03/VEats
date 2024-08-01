const express = require('express');
const appService = require('./appService');

const router = express.Router();
// router.use(express.json());
// router.use(express.raw({type: "application/*", limit: "10mb"}));
const path = require('path');
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
});router.use(express.static(path.join(__dirname, 'public')));

router.get('/home', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'home.html'));
});

router.get('/menu/:phone_number', (req, res) => {
    const restaurantNumber = req.params.phone_number;
    // console.log(restaurantNumber);
    // const menuTableContent = await appService.fetchRestaurantNames();
    res.sendFile(path.join(__dirname, 'public', 'menu.html'));
});

router.get('/restaurantNames', async (req, res) => {
    const tableContent = await appService.fetchRestaurantNames();
    res.json({data: tableContent});
});





module.exports = router;