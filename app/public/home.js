async function fetchAndDisplayUsers() {
    const tableElement = document.getElementById('demotable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/demotable', {
        method: 'GET'
    });

    const responseData = await response.json();
    const demotableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    demotableContent.forEach(user => {
        const row = tableBody.insertRow();
        user.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}

async function fetchAndDisplayRestaurantNames() {
    const listElement = document.getElementById('restaurant_list');

    const response = await fetch('/restaurants', {
        method: 'GET'
    });

    const responseData = await response.json();
    const restaurants = responseData.data;

    console.log(restaurants);

    // Clear old data
    if (listElement) {
        listElement.innerHTML = '';
    }

    // Add list items
    restaurants.forEach(restaurant => {        
        const a = document.createElement('a');
        a.href = `menu.html`; // use restuarant addr to get unique menu page
        a.onclick = () => setCurrRestaurant(restaurant[0], restaurant[1]);
        a.textContent = `${restaurant[1]} ⭐️: ${(restaurant[2]).toFixed(1)}`;

        const li = document.createElement('li');
        li.appendChild(a);
        listElement.appendChild(li);
    });

}

function setCurrRestaurant(restaurantAddr, restaurantName) {
    sessionStorage.setItem('currentRestaurant', restaurantAddr);
    sessionStorage.setItem('restaurantName', restaurantName)
}

window.onload = function() {
    // for debugging/ or catch error
    if (!sessionStorage.getItem('customerID')) alert("Warning: not logged in/no customerID");
    fetchAndDisplayRestaurantNames();
}

function fetchTableData() {
    fetchAndDisplayUsers();
}

function logout() {
    sessionStorage.setItem("customerID", "");
}