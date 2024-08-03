
window.onload = async () => {
    const welcome = document.getElementById("accountWelcome");
    welcome.textContent = "Hello " + sessionStorage.getItem("customerID") + "!"
    const dietaryPrefs = document.getElementById("dietaryPrefs");
    
    const response = await fetch(`/${sessionStorage.getItem("customerID")}/dietarypref`, {
        method: 'GET'
    });

    const prefs = (await response.json()).data;
    for (let pref of prefs) {

        const removeButton = document.createElement('button');
        removeButton.onclick = () => {
            if (confirm("Are you sure you want to remove this dietary preference?")) {
                // todo
                alert("not implemented yet");
                window.location.reload();
            }
        }
        removeButton.innerText = 'x'; // very simple hehe

        const prefIngred = document.createElement('div');
        prefIngred.innerText = pref[0];

        const prefType = document.createElement('div');
        prefType.innerText = pref[1];

        const newPref = document.createElement('li');
        newPref.appendChild(removeButton);
        newPref.appendChild(prefIngred);
        newPref.appendChild(prefType);

        // temp styling
        newPref.style.display = 'flex';
        newPref.style.flexDirection = 'row';
        newPref.style.gap = '3vw';

        dietaryPrefs.appendChild(newPref);
    }
}

function toggleDietary() {
    const dietaryPrefsDiv = document.getElementById('dietaryPrefs');

    if (dietaryPrefsDiv.style.display == 'none') {
        dietaryPrefsDiv.style.display = 'block'
    } else {
        dietaryPrefsDiv.style.display = 'none';
    }
}

function deleteAccount() {
    if (confirm("Are you sure? (THIS IS AN IRREVERSIBLE ACTION)")) {
        // todo
        alert("not implemented yet");
        window.location.href = "index.html";
        sessionStorage.setItem("customerID", "");
    }
}
