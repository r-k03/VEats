let cart = [];
let subtotal = 0;

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
        div.classList.add("menuItem");
        
        div.onclick = () => addToCart(item[7]); // add an event listener to process menu item click
        div.textContent = `${item[7]} $: ${item[10]} ⊕`; // change div content to include item name and price

        menu_container.appendChild(div);
    });
    
}

function addToCart(item) {
    let add = confirm("Add this item to cart?");
    if (add) {
        if (cart.includes(item)) {
            alert("Item already in cart!");
            return;
        } else {
            cart.push(item);
            alert(`Added ${item} to cart`);
            displayCart(); // 
        }
    }
    console.log(cart); // for debugging
}

function displayCart() {
    if (cart.length != 0) {
        const cartContainer = document.getElementById("cart_container");

        if (cartContainer) {
            cartContainer.innerHTML = '';
        }

        cartContainer.innerHTML = '<h1>Cart</h1>'

        cart.forEach(item => {        
            const div = document.createElement('div');
            
            div.textContent = `${item}`; // change div content to include item name and price
    
            cartContainer.appendChild(div);
        });
    }
}

window.onload = function() {
    // alert(sessionStorage.getItem('currentRestaurant'));
    fetchAndDisplayMenu(sessionStorage.getItem('currentRestaurant'));
}