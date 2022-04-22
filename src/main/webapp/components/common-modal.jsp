<!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cart">
  
</button>-->

<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!--begin card-->

                <section class="h-100 h-custom" style="background-color: #eee;">
                    <div class="container py-5 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col">
                                <div class="card">
                                    <div class="card-body p-4">
                                        <div class="row">
                                            <div class="col">
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <div>
                                                        <p class="mb-1">Shopping cart</p>
                                                        <p class="mb-0" id="blankCartMsg">You have 4 items in your cart</p>
                                                    </div>
                                                </div>
                                                <div id="modal-cart-body"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!--end here-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="modal-checkout">Checkout</button>
                </div>
            </div>
        </div>
    </div>
</div>