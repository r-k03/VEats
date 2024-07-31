window.onload = function() {
    sessionStorage.setItem("customerID", "");
};

function login() {
    // communicate with backend and verify it exists
    // else alert fail
}

function getCustomerID() {
    return sessionStorage.getItem("customerID");
}