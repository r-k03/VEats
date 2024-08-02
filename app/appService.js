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

async function fetchMenu() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT * FROM Menu');
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



// EXPORT FUNCTIONS FOR APPCONTROLLER
module.exports = {
    findUser,
    registerUser,
    fetchRestaurantNames,
    fetchOrders,
    fetchOrderTotals
};