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
    if (result.length > 0) {
        res.sendStatus(200);
    } else {
        res.sendStatus(401);
    }
});

router.post('/register', async (req, res) => {
    const {id, phone, addr} = req.body 
    const result = await appService.registerUser(id, phone, addr);
    if (result) {
        res.sendStatus(201);
    } else {
        res.sendStatus(409);
    }
});

// router.use(express.static(path.join(__dirname, 'public')));

// router.get('/home', (req, res) => {
//     res.sendFile(path.join(__dirname, 'public', 'home.html'));
// });

// router.get('/menu/:phone_number', (req, res) => {
//     const restaurantNumber = req.params.phone_number;
//     // console.log(restaurantNumber);
//     // const menuTableContent = await appService.fetchRestaurantNames();
//     res.sendFile(path.join(__dirname, 'public', 'menu.html'));
// });

router.get('/restaurantNames', async (req, res) => {
    const tableContent = await appService.fetchRestaurantNames();
    res.json({data: tableContent});
});

router.get('/orders/:cID', async (req, res) => {
    const customerID = req.params.cID;
    const orderContent = await appService.fetchOrders(customerID);
    const totalContent = await appService.fetchOrderTotals(customerID);
    res.status(200).json({data: orderContent, totals: totalContent});
});


module.exports = router;