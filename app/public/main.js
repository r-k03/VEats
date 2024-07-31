

function getCustomerID() {
    return sessionStorage.getItem("customerID");
}


window.onload = function() {
    const div = document.getElementById("welcome");
    if (getCustomerID()) {
        div.innerText = "welcome customerid " + getCustomerID();
    }
    
};