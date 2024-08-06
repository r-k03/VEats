function getCustomerID() {
    return sessionStorage.getItem("customerID");
}


window.onload = function() {
    fetchAndDisplayOrders();
    document.getElementById('filterForm').addEventListener('submit',filteredFetch);

    loadOrderAverages();
};

async function loadOrderAverages() {

    const lim = document.getElementById("avgLimit").value;

    const result = await fetch(`/orders/${getCustomerID()}/avgFact`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            lim: lim,
        })
    });
    if (!result.ok) {
        alert("Error in fetching fun fact, try again");
        return;
    }
    
    const avg = (await result.json()).data


    const orderAvgFactDiv = document.getElementById("orderAvgFact");

    orderAvgFactDiv.innerText = `Fun fact: your per order totals greater than ${lim} average to ${avg}`


}

//Fetches Past Orders and Display The Items, Total For Each
async function fetchAndDisplayOrders() {
    const orderDisplayElement = document.getElementById('oList');

    const url = `/orders/${getCustomerID()}`;
    const response = await fetch(url, {
        method: 'GET'
    });

    const responseData = await response.json();
    const orders = responseData.data;
    const totals = responseData.totals;
    let html = '';

    if (orderDisplayElement) {
        orderDisplayElement.innerHTML = '';
    }

    if (orders.length === 0) {
        html += '<p style="text-align:center;font-size:32px;">No Orders Made</p>';
        orderDisplayElement.innerHTML = html;
        return;
    }

    const groupedOrders = orders.reduce((acc, curr) => {
        const oID = curr[0];
        if (!acc[oID]) {acc[oID] = [];}
        acc[oID].push(curr);
        return acc;
    },{});

    const groupedTotals = totals.reduce((acc, curr) => {
        const oID = curr[0];
        if (acc[oID]) {alert("problem");}
        acc[oID] = curr[1];
        return acc;
    },{});

    for (const order of Object.keys(groupedOrders)) {
        if (groupedOrders[order].length > 0) {
        let firstItem = groupedOrders[order][0];
        html += '<div class="past-orders">' + '<p>' + firstItem[2] + '</p>';
        html += '<p>' + firstItem[1] + '</p>';
        html += '<p>Items:</p>';
        groupedOrders[order].forEach(o => {
            html += '<p>' + o[3] + '</p>';
        });
        html += `<p> Total: ${groupedTotals[order]}</p></div>`;
        }
    }
    orderDisplayElement.innerHTML = html;
}

async function filteredFetch(event) {
    event.preventDefault();
    let filterVal = document.getElementById('oval').value;
    filterVal = (filterVal === "") ? 0 : parseInt(filterVal);
    // console.log(filterVal);
    const orderDisplayElement = document.getElementById('oList');

    const dateBool = document.getElementById('noDate').checked;
    const itemBool = document.getElementById('noItems').checked;
    const totalsBool = document.getElementById('noTotals').checked;
    // console.log(dateBool,itemBool,totalsBool);

        const url = `/orders/${getCustomerID()}/${filterVal}/${dateBool}/${itemBool}`;
        const response = await fetch(url, {
            method: 'GET'
        });

        const responseData = await response.json();
        const orders = responseData.data;
        const totals = responseData.totals;
        let html = '';

        if (orderDisplayElement) {
            orderDisplayElement.innerHTML = '';
        }

        if (totals.length === 0) {
            html += '<p style="text-align:center;font-size:32px;">No Orders Above Specified Value</p>';
            orderDisplayElement.innerHTML = html;
            return;
        }

        const groupedOrders = orders.reduce((acc, curr) => {
            const oID = curr[0];
            if (!acc[oID]) {acc[oID] = [];}
            acc[oID].push(curr);
            return acc;
        },{});

        const groupedTotals = totals.reduce((acc, curr) => {
            const oID = curr[0];
            if (acc[oID]) {alert("problem");}
            acc[oID] = curr[1];
            return acc;
        },{});

        for (const order of Object.keys(groupedTotals)) {
                if (groupedOrders[order].length > 0) {
                let firstItem = groupedOrders[order][0];
                console.log(firstItem);
                html += (dateBool) ? '<div class="past-orders">' + '<p>' + firstItem[2] + '</p><p>' + firstItem[1] + '</p>' : '<div class="past-orders">' + '<p>' + firstItem[1] + '</p>';

                if (itemBool) {
                    html += '<p>Items:</p>';
                    groupedOrders[order].forEach(o => {
                        html += '<p>' + ((dateBool) ? o[3] : o[2]) + '</p>';
                    });
                }
                if (totalsBool) {html += `<p> Total: ${groupedTotals[order]}</p>`;}
                html += '</div>';
                }
            }
            orderDisplayElement.innerHTML = html;

}