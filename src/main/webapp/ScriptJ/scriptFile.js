function add_to_cart(pid, pname, price)
{
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        //console.log("Product added first time......");
        showToast("item added to the cart");
    } else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid);

        if (oldProduct) {
            console.log("old product");
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            //console.log("Product quantity increased....");
            showToast("item quantity increased in the cart, Quantity :: "+oldProduct.productQuantity);
        } else {
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            //console.log("Product added");
            showToast("item added to the cart");
        }
    }

    updateCart();
}

function updateCart()
{
    let cartStr = localStorage.getItem("cart");
    let cart = JSON.parse(cartStr);

    if (cart === null || cart.length === 0) {
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h2>Cart doesn't have any items.....</h2>");
        $(".checkout-btn").attr('disabled',true);
    } else {
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);

        let table = `
            <table class='table'>
            <thead class='thead-light'>
            <tr>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Action</th>
            </tr>
            </thead>
            
        `;

        let totalPrice = 0;
        cart.map((item) => {

            table += `

                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity}</td>
                    <td>${item.productQuantity * item.productPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">remove</button></td>
                </tr>   
            `
            totalPrice += item.productPrice * item.productQuantity;

        });



        table = table + `
        <tr><td class="totalPriceStyle">Total Price :: ${totalPrice}</td></tr>
        </table>`;

        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled',false);
    }
}

function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    let newcart = cart.filter((item) => item.productId != pid);

    localStorage.setItem("cart", JSON.stringify(newcart));

    updateCart();
    
    showToast("item is removed from cart");
    
}

$(document).ready(function () {
    updateCart();
});

function showToast(content) {
    $('#toast').addClass("display");
    $('#toast').html(content);
    setTimeout(() => {
        $('#toast').removeClass("display");
    }, 3000);
}

function goToCheckOut(){
    
    window.location="checkout.jsp";
    
}

function goToHome(){
    
    window.location="index.jsp";
    
}