let cart = {};
let subtotal = 0;

async function fetchAndDisplayRecommendations() {    
    // alert("clicked!");
    const custID = sessionStorage.getItem('customerID') || '-1';
    const recommendations_container = document.getElementById('reccomendations_container');

    const url = `/menu/recommended/${sessionStorage.getItem('currentRestaurant')}/${custID}`;
    const response = await fetch(url, {
        method: 'GET'
    });

    const responseData = await response.json();
    const menuItems = responseData.data;

    console.log(menuItems); // 

    if (recommendations_container) {
        recommendations_container.innerHTML = '';
    }

    menuItems.forEach(item => {        
        const div = document.createElement('div');
        div.classList.add("recommendedItem");
        
        // div.onclick = () => addToCart(item[7], item[10]); // add an event listener to process menu item click
        div.innerHTML = `<span>👍🏼 ${item[0]}</span>`;
        recommendations_container.appendChild(div);
    });
}

async function fetchAndDisplayMenu(restaurantAddress, restaurantName) {
    const restaurantTitle = document.getElementById('restaurant');
    restaurantTitle.textContent = `${restaurantName} - ${restaurantAddress}`;

    const custID = sessionStorage.getItem('customerID') || '-1';

    const menu_container = document.getElementById('menu_container');
    const checkout_container = document.getElementById('checkout_area');
    
    const url = `/menu/${restaurantAddress}/${custID}`;
    const response = await fetch(url, {
        method: 'GET'
    });

    const responseData = await response.json();
    const menuItems = responseData.data;

    // console.log(menuItems);

    if (menu_container) {
        menu_container.innerHTML = '';
    }

    menuItems.forEach(item => {        
        const div = document.createElement('div');
        div.classList.add("menuItem");
        
        div.onclick = () => addToCart(item[1], item[2]); // add an event listener to process menu item click
        div.innerHTML = `<span>⊕ ${item[0]} -- ${item[1]}</span><span>$${item[2]}</span>`;
        menu_container.appendChild(div);
    });

    // const cartContainer = document.getElementById("cart_container");
    // cartContainer.innerHTML = '<h2>Cart</h2>'
    // const pTotal = document.createElement('p');
    // pTotal.innerText = `Subtotal: ${subtotal}`;
    // checkout_container.appendChild(pTotal);
}

function addToCart(item, price) {
    let add = confirm("Add this item to cart?");
    if (add) {
        if (item in cart) {
            alert("Item already in cart!");
            return;
        } else {
            cart[item] = price;
            subtotal+=cart[item];
            subtotal = parseFloat(subtotal.toFixed(2)); // fixes float arithmetic issues
            alert(`Added ${item} to cart`);
            console.log(subtotal);
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

        Object.keys(cart).forEach(item => {        
            const div = document.createElement('div');
            div.classList.add("cartItem");
            // div.textContent = `⊖ ${item}`; // change div content to include item name and price?
            div.innerHTML = `<span>⊖ ${item}</span><span>$${cart[item]}</span>`;
            cartContainer.appendChild(div);
            div.onclick = () => removeFromCart(item);
                cartContainer.appendChild(div);
        });

        const checkoutArea = document.getElementById("checkout_area");
        checkoutArea.innerHTML = `
            <div>SUBTOTAL: $${subtotal}</div>
            <button class = "checkoutButton"> CHECKOUT </button>
            `;
        document.getElementsByClassName("checkoutButton")[0].addEventListener("click",checkout);
}

function removeFromCart(item) {
    const remove = confirm(`Remove ${item} from cart?`);
    if (remove) {
        subtotal-=cart[item];
        subtotal = parseFloat(subtotal.toFixed(2)); // fixes float arithmetic issues
        delete cart[item];
        displayCart(); // update cart on webpage
        console.log(subtotal);
    }
}

 async function checkout(event) {
    event.preventDefault();
    if (Object.keys(cart).length <= 0) {
        alert("Cart Empty");
        return;
    }


    const response = await fetch(`/insertOrder/`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            id: sessionStorage.getItem("customerID"),
            items: cart,
            restaurant: sessionStorage.getItem("currentRestaurant")
        })
    })

    if (response) {
        alert("Order placed successfully!")
    } else {
        alert("Failed to place order, try again")
    }

    subtotal = 0;
    cart = {};
    displayCart();
}

window.onload = function() {
    //alert(sessionStorage.getItem('currentRestaurant'));
    fetchAndDisplayMenu(sessionStorage.getItem('currentRestaurant'), sessionStorage.getItem('restaurantName'));
}