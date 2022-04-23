function showToast(content){
    document.querySelector("#toast").classList.add("toast-display");
    document.querySelector("#toast").innerHTML = `${ content }`;
    setTimeout(()=>{
        document.querySelector("#toast").classList.remove("toast-display");
    }, 3000);
}

// add to cart function
function addToCart(id, name, price, pic){
    let cart = localStorage.getItem("cart");
    if (cart === null){
        // no products in cart.
        let products = [];
                let product = {
                    pId: id,
                    pName: name,
                    pQuantity: 1,
                    pPrice: price,
                    pPhoto: pic
                };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        // console.log("product added first time", localStorage.getItem("cart"));
        updateCart();
        showToast(`${name} added successfully to the cart `);
    } else {
    let pcart = JSON.parse(cart);
    let oldProduct = pcart.find((item) => item.pId === id);
    if (oldProduct){
        // only increase the quantity of find products by 1;
        pcart.map((item) => {
            if (item.pId === oldProduct.pId){
                item.pQuantity = oldProduct.pQuantity + 1;
            }
        });
    localStorage.setItem("cart", JSON.stringify(pcart));
    // console.log("product qty increased------", localStorage.getItem("cart"));
    updateCart();
    showToast(`product qty increased for ${oldProduct.pName}`);
    } else{
        // add the products
        let product = {
        pId: id,
                pName: name,
                pQuantity: 1,
                pPrice: price,
                pPhoto: pic
        };
        pcart.push(product);
        localStorage.setItem("cart", JSON.stringify(pcart));
        console.log("new producdt added to cart", localStorage.getItem("cart"));
        updateCart();
        showToast(`${name} added successfully to the cart `);
        }
    }
}

function removeItem(id){
    let indexToRemove;
    let cartStr = localStorage.getItem("cart");
    let cart = JSON.parse(cartStr);
    let removedItem = cart.find((item) => item.pId === id);
    console.log("removed Item : ", removedItem);
    cart.map((item, i) => {
        if(item.pId === id){
            indexToRemove = i;
        }
    });
    cart.splice(indexToRemove, 1);
    // console.log("newcart", cart);
    localStorage.setItem("cart", JSON.stringify(cart));
    if (cart === null || cart.length === 0){
        document.querySelector(".blankCartMsg").innerHTML = `You have 0 items in your cart`;
        document.querySelector("#modal-cart-body").innerHTML = ``;
        document.querySelector(".blankCheckoutMsg").innerHTML = `You have 0 items in your cart`;
        document.querySelector("#modal-checkout").classList.add("disabled");
    }
    showToast(`product removed successfully to the cart `);
    updateModalCart();
    updateCart();
}

// update cart
function updateCart(){
        let cartStr = localStorage.getItem("cart");
        let cart = JSON.parse(cartStr);
        if (cart === null || cart.length === 0){
        document.querySelector("#headerCart").innerHTML = `( 0)`;
        document.querySelector(".blankCartMsg").innerHTML = `You have 0 items in your cart`;
        document.querySelector(".blankCheckoutMsg").innerHTML = `You have 0 items in your cart`;
        
    } else {
        document.querySelector("#headerCart").innerHTML = `( ${ cart.length })`;
    }
}

function updateModal(){
    let cartStr = localStorage.getItem("cart");
        let cart = JSON.parse(cartStr);
        if (cart === null || cart.length === 0){
            document.querySelector(".blankCartMsg").innerHTML = `You have 0 items in your cart`;
            document.querySelector(".cartTotal").innerHTML = `0`;
            document.querySelector("#modal-cart-body").innerHTML = ``;
            document.querySelector("#modal-checkout").classList.add("disabled");
            
        } else {
            let cartTotal = 0;
            cart.map((item) => {
                cartTotal += item.pPrice*item.pQuantity;
            });
            document.querySelector(".blankCartMsg").innerHTML = `You have ${ cart.length } items in your cart.`;
            document.querySelector(".cartTotal").innerHTML = `${ cartTotal }`;
            // loop through the cart items;
            let newModalBody = ``;
            cart.map((item) => {
                newModalBody += `
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="d-flex flex-row align-items-center">
                                <div>
                                    <img
                                        src="img/products/${item.pPhoto}"
                                        class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                </div>
                                <div class="ms-3">
                                    <h5>${item.pName}</h5>
                                </div>
                            </div>
                            <div class="d-flex flex-row align-items-center">
                                <div style="width: 50px;">
                                    <h5 class="fw-normal mb-0">${item.pQuantity}</h5>
                                </div>
                                <div style="width: 80px;">
                                    <h5 class="mb-0">${item.pPrice}</h5>
                                </div>
                                <a href="#!" style="color: #cecece;" onclick="removeItem(${item.pId})"><i class="fas fa-trash-alt"></i></a>
                            </div>
                        </div>
                    </div>
                </div>`;
            });
            document.querySelector("#modal-cart-body").innerHTML = newModalBody;
        }
}

function updateModalCart(){
        let cartStr = localStorage.getItem("cart");
        let cart = JSON.parse(cartStr);
        if (cart === null || cart.length === 0){
            document.querySelector(".blankCartMsg").innerHTML = `You have 0 items in your cart`;
            document.querySelector(".cartTotal").innerHTML = `0`;
            document.querySelector(".blankCheckoutMsg").innerHTML = `You have 0 items in your cart`;
            document.querySelector(".CheckoutTotal").innerHTML = `0`;
            document.querySelector(".subtotal").innerHTML = `0`;
            document.querySelector(".ctotal").innerHTML = `0`;
            document.querySelector("#modal-cart-body").innerHTML = ``;
            document.querySelector("#modal-checkout").classList.add("disabled");
            
        } else {
            let cartTotal = 0;
            cart.map((item) => {
                cartTotal += item.pPrice*item.pQuantity;
            });
            document.querySelector(".blankCartMsg").innerHTML = `You have ${ cart.length } items in your cart.`;
            document.querySelector(".cartTotal").innerHTML = `${ cartTotal }`;
            // document.querySelector(".blankCheckoutMsg").innerHTML = `You have ${ cart.length } items in your cart.`;
            document.querySelector(".CheckoutTotal").innerHTML = `${ cartTotal }`;
            document.querySelector(".subtotal").innerHTML = `${ cartTotal }`;
            document.querySelector(".ctotal").innerHTML = `${ cartTotal }`;
            // loop through the cart items;
            let newModalBody = ``;
            cart.map((item) => {
                newModalBody += `
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="d-flex flex-row align-items-center">
                                <div>
                                    <img
                                        src="img/products/${item.pPhoto}"
                                        class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                </div>
                                <div class="ms-3">
                                    <h5>${item.pName}</h5>
                                </div>
                            </div>
                            <div class="d-flex flex-row align-items-center">
                                <div style="width: 50px;">
                                    <h5 class="fw-normal mb-0">${item.pQuantity}</h5>
                                </div>
                                <div style="width: 80px;">
                                    <h5 class="mb-0">${item.pPrice}</h5>
                                </div>
                                <a href="#!" style="color: #cecece;" onclick="removeItem(${item.pId})"><i class="fas fa-trash-alt"></i></a>
                            </div>
                        </div>
                    </div>
                </div>`;
            });
            document.querySelector("#modal-cart-body").innerHTML = newModalBody;
            document.querySelector("#checkout-body").innerHTML = newModalBody;
        }
    }

document.addEventListener('DOMContentLoaded', function() {
        updateCart();
});


