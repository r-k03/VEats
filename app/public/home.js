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

    const response = await fetch('/restaurantNames', {
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
        // const li = document.createElement('li');
        // const a = document.createElement('a');

        // li.textContent = `${restaurant[0]} ⭐️: ${restaurant[1]}`; 
        // listElement.appendChild(li);
        
        const a = document.createElement('a');
        a.href = `/menu`;
        a.textContent = `${restaurant[0]} ⭐️: ${(restaurant[1]).toFixed(1)}`;

        const li = document.createElement('li');
        li.appendChild(a);
        listElement.appendChild(li);
    });

}

window.onload = function() {
    fetchTableData();
    fetchAndDisplayRestaurantNames();

}


function fetchTableData() {
    fetchAndDisplayUsers();
}