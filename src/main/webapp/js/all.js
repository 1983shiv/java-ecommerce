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
        console.log("product added first time", localStorage.getItem("cart"));
        updateCart();
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
    console.log("product qty increased------", localStorage.getItem("cart"));
    updateCart();
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
        }
    }
}

function removeItem(id){
    let indexToRemove;
    let cartStr = localStorage.getItem("cart");
    let cart = JSON.parse(cartStr);
    cart.map((item, i) => {
        if(item.pId === id){
            indexToRemove = i;
        }
    });
    cart.splice(indexToRemove, 1);
    console.log("newcart", cart);
    localStorage.setItem("cart", JSON.stringify(cart));
    if (cart === null || cart.length === 0){
        document.querySelector("#blankCartMsg").innerHTML = `You have 0 items in your cart`;
        document.querySelector("#modal-cart-body").innerHTML = ``;
        document.querySelector("#modal-checkout").classList.add("disabled");
    }
    updateModalCart();
    updateCart();
}

// update cart
function updateCart(){
        let cartStr = localStorage.getItem("cart");
        let cart = JSON.parse(cartStr);
        if (cart === null || cart.length === 0){
        document.querySelector("#headerCart").innerHTML = `( 0)`;
        document.querySelector("#blankCartMsg").innerHTML = `You have 0 items in your cart`;
        
    } else {
        document.querySelector("#headerCart").innerHTML = `( ${ cart.length })`;
    }
}

function updateModalCart(){
        let cartStr = localStorage.getItem("cart");
        let cart = JSON.parse(cartStr);
        console.log("updateModalCart");
        if (cart === null || cart.length === 0){
            document.querySelector("#blankCartMsg").innerHTML = `You have 0 items in your cart`;
            document.querySelector("#modal-cart-body").innerHTML = ``;
            document.querySelector("#modal-checkout").classList.add("disabled");
            
        } else {
            document.querySelector("#blankCartMsg").innerHTML = `You have ${ cart.length } items in your cart.`;
            // loop through the cart items;
            document.querySelector("#modal-cart-body").innerHTML = ``;
            cart.map((item) => {
                console.log("Name", item.pName);
                document.querySelector("#modal-cart-body").innerHTML += `
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
        }
    }

document.addEventListener('DOMContentLoaded', function() {
        updateCart();
});
