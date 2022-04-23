<%-- 
    Document   : checkout
    Created on : Apr 23, 2022, 10:48:08 AM
    Author     : ninja
--%>

<%@page import="com.shiv.ignouecommerce.entities.User"%>

<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("screenmsg", "You are not loggedd in! ");
        response.sendRedirect("login.jsp");
        return;
    }   

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IgnouCart - Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container py-4">
            <%@include file="components/screenmsg.jsp" %>
            <h2 class="text-lg my-4">Checkout</h2>
            <section class="h-100 h-custom" style="background-color: #f4f4f4;">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <div class="cardd">
                                <div class="card-body p-4">

                                    <div class="row">

                                        <div class="col-lg-7">
                                            <h5 class="mb-3"><a href="index.jsp" class="text-body">
                                                    <i class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                            <hr>
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <div>
                                                    <p class="mb-1">Shopping cart</p>
                                                    <p class="mb-0 blankCheckoutMsg">You have 4 items in your cart</p>
                                                </div>
                                                <div>
                                                    <p class="mb-0"><span class="text-muted">Cart Total :</span> 
                                                        <i class="fa-solid fa-indian-rupee-sign"></i>
                                                        <span class="CheckoutTotal">121212121</span></p>
                                                </div>
                                            </div>
                                            <div id="checkout-body"></div>
                                        </div>
                                        <!--right side Summery-->
                                        <div class="col-lg-5">

                                            <div class="card bg-primary text-white rounded-3">
                                                <div class="card-body">
                                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                                        <h5 class="mb-0">Card details</h5>
                                                    </div>

                                                    <p class="small mb-2">Card type</p>
                                                    <a href="#!" type="submit" class="text-white"><i
                                                            class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                                    <a href="#!" type="submit" class="text-white"><i
                                                            class="fab fa-cc-visa fa-2x me-2"></i></a>
                                                    <a href="#!" type="submit" class="text-white"><i
                                                            class="fab fa-cc-amex fa-2x me-2"></i></a>
                                                    <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>

                                                    <form class="mt-4">
                                                        <div class="form-outline form-white mb-4">
                                                            <input type="text" id="cCardNumber" class="form-control form-control-lg" siez="17"
                                                                   placeholder="1234 5678 9012 3457" minlength="19" maxlength="19" />
                                                            <label class="form-label" for="typeText">Card Number</label>
                                                        </div>

                                                        <div class="row mb-4">
                                                            <div class="col-md-6">
                                                                <div class="form-outline form-white">
                                                                    <input type="text" id="cCardexpiration" class="form-control form-control-lg"
                                                                           placeholder="MM/YYYY" size="7" id="exp" minlength="7" maxlength="7" />
                                                                    <label class="form-label" for="typeExp">Expiration</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-outline form-white">
                                                                    <input type="password" id="cCartcvv" class="form-control form-control-lg"
                                                                           placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                                                    <label class="form-label" for="typeText">Cvv</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="form-outline form-white mb-4">
                                                            <input type="text" id="cName" class="form-control form-control-lg" siez="17"
                                                                   placeholder="Name" value="<%= user.getUserName()%>" />
                                                            <label class="form-label" for="typeName">Name</label>
                                                        </div>
                                                        
                                                        <div class="form-outline form-white mb-4">
                                                            <input type="text" id="cEmail" class="form-control form-control-lg" siez="17"
                                                                   placeholder="Email" value="<%= user.getUserEmail()%>" />
                                                            <label class="form-label" for="typeName">Email</label>
                                                        </div><!-- comment -->
                                                        
                                                        <div class="form-outline form-white mb-4">
                                                            <input type="number" id="cPhone" class="form-control form-control-lg" siez="17"
                                                                   placeholder="Mobile No" value="<%= user.getUserPhone()%>" />
                                                            <label class="form-label" for="typeName">Mobile No</label>
                                                        </div>

                                                        <div class="form-outline form-white mb-4">
                                                            <Textarea type="number" id="cAddress" class="form-control form-control-lg" siez="17"
                                                                      placeholder="Address" /><%= user.getUserAddress()%></Textarea>
                                                            <label class="form-label" for="typeName">Address</label>
                                                        </div>

                                                    </form>

                                                    <hr class="my-4">

                                                    <div class="d-flex justify-content-between">
                                                        <p class="mb-2">Subtotal</p>
                                                        <p><i class="fa-solid fa-indian-rupee-sign"></i>
                                                        <span class="mb-2 subtotal">4818</span></p>
                                                    </div>

                                                    <div class="d-flex justify-content-between">
                                                        <p class="mb-2">Shipping</p>
                                                        <p><i class="fa-solid fa-indian-rupee-sign"></i>
                                                        <span class="mb-2">0</span></p>
                                                    </div>

                                                    <div class="d-flex justify-content-between mb-4">
                                                        <p class="mb-2">Total(Incl. taxes)</p>
                                                        <p><i class="fa-solid fa-indian-rupee-sign"></i>
                                                        <span class="mb-2 ctotal">4818</span></p>
                                                    </div>

                                                    <button type="button" class="btn btn-info btn-block btn-lg">
                                                        <div class="d-flex justify-content-between">
                                                            <p><span>Order Now <i class="fas fa-long-arrow-alt-right ms-2"></i></span></p>
                                                        </div>
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script>
        updateModalCart();
        </script>
    </body>
</html>
