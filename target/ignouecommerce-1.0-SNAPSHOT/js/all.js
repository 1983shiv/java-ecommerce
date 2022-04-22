// add to cart function
function addToCart(id, name, price){
    let cart = localStorage.getItem("cart");
    
    if(cart === null){
        // no products in cart.
        let products = [];
        let product = {
            pId: id,
            pName: name,
            pQuantity: 1,
            pPrice: price
        };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("product added first time", localStorage.getItem("cart"));
    } else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.pId === id);
        if(oldProduct){
            // only increase the quantity of find products by 1;
            pcart.map((item) => {
                if(item.pId === oldProduct.pId){
                    item.pQuantity = oldProduct.pQuantity + 1;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product qty increased------", localStorage.getItem("cart"));
        }else{
            // add the products
            let product = {
                pId: id,
                pName: name,
                pQuantity: 1,
                pPrice: price
            };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("new producdt added to cart", localStorage.getItem("cart"));
        }
    }
}