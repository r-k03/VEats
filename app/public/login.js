async function login() {
    const id = document.getElementById("loginID").value;
    const phone = document.getElementById("loginPhone").value;

    if (!id || !phone) {
        alert("Invalid entry");
        return;
    }

    
    const response = await fetch('/login', {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            id: id,
            phone: phone
        })
    });

    if (response.ok) {
        sessionStorage.setItem("customerID", id);
        window.location.href = "main.html";
    } else {
        alert("User not found OR failed to match");
    }
}