async function login() {
    const id = document.getElementById("loginID").value;
    const phone = document.getElementById("loginPhone").value;

    if (!id || !phone) {
        alert("Missing login details");
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
        window.location.href = "home.html";
    } else {
        alert("User not found OR failed to match");
    }
}

function toggleRegister() {
    const regDiv = document.getElementById("registerDiv");
    if (regDiv.style.display == 'none') {
        regDiv.style.display = 'block';
    } else {
        regDiv.style.display = 'none';
    }
}

async function register() {
    const id = document.getElementById("registerID").value;
    const phone = document.getElementById("registerPhone").value;
    const addr = document.getElementById("registerAddr").value;
    if (!id || !phone || !addr) {
        alert("Missing registration details");
    }

    const response = await fetch('/register', {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            id: id,
            phone: phone,
            addr: addr
        })
    });

    if (response.ok) {
        alert("Thanks for joining us!");
        sessionStorage.setItem("customerID", id);
        window.location.href = "home.html";
    } else {
        alert("Failed to register, ID already exists");
    }
}