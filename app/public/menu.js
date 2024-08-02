async function fetchAndDisplayMenu(restaurantAddress) {
    const menu_container = document.getElementById('menu_container');
    
    const url = `/menus/${restaurantAddress}`;
    const response = await fetch(url, {
        method: 'GET'
    });

    const responseData = await response.json();
    const menuItems = responseData.data;

    console.log(menuItems); // 

    if (menu_container) {
        menu_container.innerHTML = '';
    }

    menuItems.forEach(item => {        
        const div = document.createElement('div');
        
        // div.onclick = () => addToCart(); // add an event listener to process menu item click
        div.textContent = `${item[7]} $${item[10]}`; // change div content to include item name and price

        menu_container.appendChild(div);
    });
    
}

function addToCart() {

}

window.onload = function() {
    alert(sessionStorage.getItem('currentRestaurant'));
    fetchAndDisplayMenu(sessionStorage.getItem('currentRestaurant'));
}