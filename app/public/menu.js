async function fetchAndDisplayMenu(restaurantAddress) {
    const menu_container = document.getElementById('menu_container');
    
    const url = `/menus/${restaurantAddress}`;
    const response = await fetch(url, {
        method: 'GET'
    });

    const responseData = await response.json();
    const menuItems = responseData.data;

    if (menu_container) {
        listElement.innerHTML = '';
    }
    
}

window.onload = function() {
    alert(sessionStorage.getItem('currentRestaurant'));
    fetchAndDisplayMenu(sessionStorage.getItem('currentRestaurant'));
}