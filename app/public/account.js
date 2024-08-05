
window.onload = async () => {
    const welcome = document.getElementById("accountWelcome");
    welcome.textContent = "Hello " + sessionStorage.getItem("customerID") + "!"
    const dietaryPrefs = document.getElementById("dietaryPrefsList");
    
    const response = await fetch(`/dietarypref/${sessionStorage.getItem("customerID")}`, {
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

        const prefType = document.createElement('select'); // semantic coupling with options when adding
        prefType.innerHTML = `
        <option value="Allergy">Allergy</option>
        <option value="Favourite">Favourite</option>` // poor practice probably but quick
        prefType.onchange = () => {
            fetch(`/dietarypref/${sessionStorage.getItem("customerID")}`, {
                method: "PUT",
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    ingred: pref[0],
                    pref: prefType.value
                })
            }).then((res) => {
                if (res.ok) {
                    alert("Ingredient preference successfully updated");
                } else {
                    alert("Ingredient unable to be updated, try again")
                }
            });
        }
        prefType.value = pref[1];

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
    const dietaryPrefsDiv = document.getElementById('dietaryPrefsDiv');

    if (dietaryPrefsDiv.style.display == 'none') {
        dietaryPrefsDiv.style.display = 'block'
    } else {
        dietaryPrefsDiv.style.display = 'none';
    }
}

// make sure ingredient exists
async function submitNewPref() {
    const ingred = document.getElementById("newIngred").value;
    const pref = document.getElementById("newPref").value;
    console.log(ingred, pref);

    if (!pref) {
        alert("Please select a preference type");
        return;
    }

    const response = await fetch(`/dietarypref/${sessionStorage.getItem("customerID")}`, {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            ingred: ingred,
            pref: pref
        })
    });

    
    if (response.ok) {
        alert("Ingredient preference added");
        window.location.reload();
    } else {
        alert("Unable to add ingredient preference, try again");

    }
}

async function deleteUser() {
    if (confirm("Are you sure? (THIS IS AN IRREVERSIBLE ACTION)")) {
        
        const response = await fetch(`/deleteUser/${sessionStorage.getItem("customerID")}/`, {
            method: 'DELETE'
        });

        if (response.ok) {
            alert(`Successfully deleted ${sessionStorage.getItem("customerID")}`)
            window.location.href = '/';
            sessionStorage.setItem("customerID", "");
            return;
        }

        alert("Failed to delete account, try again");
    }
}
