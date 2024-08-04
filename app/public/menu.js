let cart = [];
let subtotal = 0;

async function fetchAndDisplayMenu(restaurantAddress, restaurantName) {
    const restaurantTitle = document.getElementById('restaurant');
    restaurantTitle.textContent = `${restaurantName} - ${restaurantAddress}`;

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
        div.innerHTML = `<span>⊕ ${item[0]} -- ${item[7]}</span><span>$${item[10]}</span>`;
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
        const cartContainer = document.getElementById("cart_container");

        if (cartContainer) {
            cartContainer.innerHTML = '';
        }

        cartContainer.innerHTML = '<h2>Cart</h2>'

        cart.forEach(item => {        
            const div = document.createElement('div');
            div.classList.add("cartItem");
            div.textContent = `⊖ ${item}`; // change div content to include item name and price?
            div.onclick = () => removeFromCart(item);

            cartContainer.appendChild(div);
        });
        
        // add checkout button to screen
        const checkoutArea = document.getElementById("checkout_area");
        checkoutArea.innerHTML = `
            <button class = "checkoutButton"> CHECKOUT </button>
            `;

}

function removeFromCart(item) {
    const remove = confirm(`Remove ${item} from cart?`);
    if (remove) {
        const indexToRemove = cart.indexOf(item);
        cart.splice(indexToRemove, 1);
        displayCart(); // update cart on webpage
    }
}

window.onload = function() {
    // alert(sessionStorage.getItem('currentRestaurant'));
    fetchAndDisplayMenu(sessionStorage.getItem('currentRestaurant'), sessionStorage.getItem('restaurantName'));
}