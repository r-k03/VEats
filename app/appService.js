const oracledb = require('oracledb');
const loadEnvFile = require('./utils/envUtil');

const envVariables = loadEnvFile('./.env');

// Database configuration setup. Ensure your .env file has the required database credentials.
const dbConfig = {
    user: envVariables.ORACLE_USER,
    password: envVariables.ORACLE_PASS,
    connectString: `${envVariables.ORACLE_HOST}:${envVariables.ORACLE_PORT}/${envVariables.ORACLE_DBNAME}`,
    poolMin: 1,
    poolMax: 3,
    poolIncrement: 1,
    poolTimeout: 60
};

// initialize connection pool
async function initializeConnectionPool() {
    try {
        await oracledb.createPool(dbConfig);
        console.log('Connection pool started');
    } catch (err) {
        console.error('Initialization error: ' + err.message);
    }
}

async function closePoolAndExit() {
    console.log('\nTerminating');
    try {
        await oracledb.getPool().close(10); // 10 seconds grace period for connections to finish
        console.log('Pool closed');
        process.exit(0);
    } catch (err) {
        console.error(err.message);
        process.exit(1);
    }
}

initializeConnectionPool();

process
    .once('SIGTERM', closePoolAndExit)
    .once('SIGINT', closePoolAndExit);


// ----------------------------------------------------------
// Wrapper to manage OracleDB actions, simplifying connection handling.
async function withOracleDB(action) {
    let connection;
    try {
        connection = await oracledb.getConnection(); // Gets a connection from the default pool 
        return await action(connection);
    } catch (err) {
        console.error(err);
        throw err;
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error(err);
            }
        }
    }
}


/**
 * SQL QUERY FUNCTIONS HERE
 */

async function findUser(id, phone) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT * FROM Customer WHERE CustomerID = :id AND CustomerPhoneNum = :phone`,
            [id, phone]
        );
        return result.rows;
    }).catch(() => {
        return false;
    });
}

async function registerUser(id, phone, addr) {
    return await withOracleDB(async (connection) => {
        const existingUsers = await connection.execute(
            `SELECT * FROM Customer WHERE CustomerID = :id`, [id]
        );
        if (existingUsers.rows.length > 0) {
            return false;
        }

        const result = await connection.execute(
            `INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) 
                VALUES (:id, NULL, :addr, :phone)`,
            [id, addr, phone],
            { autoCommit: true }
        );
        return result.rowsAffected && result.rowsAffected > 0;

    }).catch(() => {
        return false;
    });
}

async function deleteUser(customerID) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`
            DELETE FROM Customer WHERE CustomerID = :customerID
        `, [customerID], { autoCommit: true });
        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}


async function fetchUserPrefs(customerID) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`
            SELECT IngredientName, PreferenceType
            FROM HasDietaryPreference
            WHERE CustomerID = :customerID
            `, [customerID]);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function createUserPref(id, ingred, pref) {
    return await withOracleDB(async (connection) => {

        result = await connection.execute(`
            INSERT INTO HasDietaryPreference (CustomerID, IngredientName, PreferenceType)
                VALUES (:id, :ingred, :pref)`, 
            [id, ingred, pref],
            { autoCommit: true }
        );
        
        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}

async function updateUserPref(id, ingred, pref) {

    return await withOracleDB(async (connection) => {

        const result = await connection.execute(`
            UPDATE HasDietaryPreference SET PreferenceType = :pref WHERE CustomerID = :id AND IngredientName = :ingred`,
            [pref, id, ingred],
            { autoCommit: true }
        );

        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}

async function fetchRestaurants() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT * FROM Restaurant');
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchRestaurantNames() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT * FROM Restaurant');
        return result.rows;
    }).catch(() => {
        return [];
    });
}

// note: doesn't filter out food by customer preference yet
async function fetchMenus(restaurantAddress) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`
            SELECT * 
            FROM Menu m, Restaurant r, MenuFeaturesItem mf 
            WHERE r.RestaurantAddress = :restaurantAddress 
                AND r.RestaurantAddress = m.restaurantaddress 
                AND mf.MenuName = m.MenuName
            ORDER BY m.MenuName`, 
            [restaurantAddress]);
        /* 
        'SELECT * 
        FROM Menu m, Restaurant r, MenuFeaturesItem mf
        WHERE r.RestaurantAddress = :restaurantAddress 
            AND r.RestaurantAddress = m.restaurantaddress 
            AND mf.MenuName = m.MenuName', [restaurantAddress]
        */
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchOrders(cID) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`
            Select o.OrderID, o.OrderDate, r.RestaurantName, oc.MenuItemName 
            FROM Orders o, Restaurant r, OrderContains oc 
            WHERE o.CustomerID=:cID 
                AND o.RestaurantAddress = r.RestaurantAddress 
                AND o.OrderID = oc.OrderID`,
        [cID]);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchOrderTotals(cID) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`
            Select o.OrderID, SUM(mfi.ItemPrice) AS TotalPrice 
            FROM Orders o, Restaurant r, OrderContains oc, Menu m, MenuFeaturesItem mfi 
            WHERE o.CustomerID=:cID 
                AND o.RestaurantAddress = r.RestaurantAddress 
                AND o.OrderID = oc.OrderID 
                AND r.RestaurantAddress = m.RestaurantAddress 
                AND m.MenuName = mfi.MenuName 
                AND oc.MenuItemName = mfi.MenuItemName 
            GROUP BY o.OrderID`,
        [cID]);
        console.log(result);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function filteredOrderTotals(cID, fVal) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`Select o.OrderID, SUM(mfi.ItemPrice) AS TotalPrice FROM Orders o, Restaurant r, OrderContains oc, Menu m, MenuFeaturesItem mfi WHERE o.CustomerID=:cID AND o.RestaurantAddress = r.RestaurantAddress AND o.OrderID = oc.OrderID AND r.RestaurantAddress = m.RestaurantAddress AND m.MenuName = mfi.MenuName AND oc.MenuItemName = mfi.MenuItemName GROUP BY o.OrderID HAVING SUM(mfi.ItemPrice)>=:fVal`,
        [cID,fVal]);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function getMaxOrder() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT MAX(OrderID) FROM Orders');
        return result.rows[0][0];
    }).catch(() => {
        return false;
    });
}

async function getRandomDriver() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT LicenseNum FROM DeliveryPerson ORDER BY DBMS_RANDOM.VALUE');
        return result.rows[0][0];
    }).catch(() => {
        return false;
    });
}

async function insertOrder(oID,oDate,cID,lNum,rAdd) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
        `INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress)
            VALUES (:oID, TO_DATE(:oDate, 'YYYY-MM-DD'), :cID, :lNum, :rAdd)`,
            [oID, oDate, cID, lNum, rAdd],
            { autoCommit: true }
        );
        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}

async function insertItem(oID, item) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
        `INSERT INTO OrderContains (OrderID, MenuItemName) VALUES (:oID, :item)`,
        [oID, item],
        { autoCommit: true }
        );
        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}



// EXPORT FUNCTIONS FOR APPCONTROLLER
module.exports = {
    findUser,
    registerUser,
    deleteUser,
    fetchUserPrefs,
    createUserPref,
    updateUserPref,
    fetchRestaurantNames,
    fetchMenus,
    fetchOrders,
    fetchOrderTotals,
    filteredOrderTotals,
    getMaxOrder,
    getRandomDriver,
    insertOrder,
    insertItem
};