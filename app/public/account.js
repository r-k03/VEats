
window.onload = () => {
    const div = document.getElementById("accountWelcome");
    div.textContent = "Hello " + sessionStorage.getItem("customerID") + "!"
}

function deleteAccount() {
    if (confirm("Are you sure? (THIS IS AN IRREVERSIBLE ACTION)")) {
        // delete
        // alert("account deleted! (not implemented)");
        alert("not implemented yet");
        window.location.href = "index.html";
        sessionStorage.setItem("customerID", "");
    }
}
