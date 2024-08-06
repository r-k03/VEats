const express = require('express');
const appService = require('./appService');

const router = express.Router();
// router.use(express.json());
// router.use(express.raw({type: "application/*", limit: "10mb"}));
const path = require('path');
/**
 * API ENDPOINTS HERE
 */

router.post('/loginUser', async (req, res) => {
    const {id, phone} = req.body 
    const result = await appService.findUser(id, phone);
    if (result.length > 0) {
        res.sendStatus(200);
    } else {
        res.sendStatus(401);
    }
});

router.post('/registerUser', async (req, res) => {
    const {id, phone, addr} = req.body 
    const result = await appService.registerUser(id, phone, addr);
    if (result) {
        res.sendStatus(201);
    } else {
        res.sendStatus(409);
    }
});

router.delete('/deleteUser/:customerID', async (req, res) => {

    const customerID = req.params.customerID;
    const result = await appService.deleteUser(customerID);
    if (result) {
        res.sendStatus(200);
    } else {
        res.sendStatus(404);
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

router.get('/dietarypref/:customerID', async (req, res) => {
    const customerID = req.params.customerID;
    const prefs = await appService.fetchUserPrefs(customerID);
    res.json({data: prefs});
});

router.post('/dietarypref/:customerID', async (req, res) => {
    const customerID = req.params.customerID;
    const {ingred, pref} = req.body
    const result = await appService.createUserPref(customerID, ingred, pref);

    if (result) {
        res.sendStatus(201);
    } else {
        res.sendStatus(409);
    }
});

router.put('/dietarypref/:customerID', async (req, res) => {
    const customerID = req.params.customerID;
    const {ingred, pref} = req.body
    const result = await appService.updateUserPref(customerID, ingred, pref);

    if (result) {
        res.sendStatus(200);
    } else {
        res.sendStatus(400);
    }
});

router.get('/restaurantNames', async (req, res) => {
    const tableContent = await appService.fetchRestaurantNames();
    res.json({data: tableContent});
});

// SELECTION QUERY
router.get('/menu/:address/:customerID', async (req, res) => {
    const restaurantAddress = req.params.address;
    const customerID = req.params.customerID;
    const tableContent = await appService.fetchMenus(restaurantAddress, customerID);
    res.json({data: tableContent});
});

// DIVISION QUERY
router.get('/menu/recommended/:address/:customerID', async (req, res) => {
    const restaurantAddress = req.params.address;
    const customerID = req.params.customerID;
    const tableContent = await appService.fetchReccomendations(restaurantAddress, customerID);
    res.json({data: tableContent});
});

// router.get('/menus/randomDriver', async (req, res) => {
//     console.log("0");
//     const tableContent = await appService.getRandomDriver();
//     res.json({data: tableContent});
// });

router.post('/insertOrder', async (req, res) => {
    const { id, items, restaurant} = req.body;

    // todo assign random license
    const license = await appService.getRandomDriver();

    const orderID = await appService.getMaxOrder() + 1;

    const date = new Date().toJSON().slice(0,10);

    const orderResult = await appService.insertOrder(orderID, date, id, license, restaurant);

    if (!orderResult) {
        res.sendStatus(500)
        return;
    }

    let itemResult;

    for (let item of Object.keys(items)) {
        itemResult = await appService.insertItem(orderID, item);
        if (!itemResult) {
            // should handle better and delete all previous added item, shouldnt fail regardless
            res.sendStatus(500);
            return;
        }
    }

    res.sendStatus(200);
    return;
    
    if (result) {
        res.send(200);
    } else {
        res.sendStatus(409);
    }
});

router.post('/menus/insertItem', async (req, res) => {
    const {id, item} = req.body;
    const result = await appService.insertItem(id, item);
    if (result) {
        res.sendStatus(200);
    } else {
        res.sendStatus(409);
    }
});

router.get('/orders/:cID', async (req, res) => {
    const customerID = req.params.cID;
    const orderContent = await appService.fetchOrders(customerID);
    const totalContent = await appService.fetchOrderTotals(customerID);
    res.status(200).json({data: orderContent, totals: totalContent});
});

router.get('/orders/:cID/:fVal', async (req, res) => {
    const customerID = req.params.cID;
    const filterVal = req.params.fVal;
    const orderContent = await appService.fetchOrders(customerID);
    const filteredTotals = await appService.filteredOrderTotals(customerID,filterVal);
    res.status(200).json({data: orderContent,totals:filteredTotals});
});


module.exports = router;