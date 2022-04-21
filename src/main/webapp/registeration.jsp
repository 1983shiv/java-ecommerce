<%-- 
    Document   : registeration
    Created on : Apr 19, 2022, 5:16:34 PM
    Author     : ninja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get Registered</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container py-4">
            <%@include file="components/screenmsg.jsp" %>
            <h1 class="mt-0 text-center"><i class="fa-solid fa-user-plus"></i></h1>
            <h1 class="mt-0 text-center mb-4">Get Registered</h1>
            <div class="row">
                <div class="col-md-6 offset-md-3 bg-light p-4">
                    <form action="RegisterServlet" method="post">
                        <div class="mb-3">
                           
                        </div>
                        <div class="mb-3">
                            <label for="userName" class="form-label">User Name</label>
                            <input type="text" class="form-control" id="userName" name="userName" aria-describedby="emailHelp">
                            <div id="nameHelp" class="form-text">Please type your full name</div>
                        </div>
                        <div class="mb-3">
                            <label for="userPhone" class="form-label">User Phone</label>
                            <input type="number" class="form-control" name="userPhone" id="userPhone" aria-describedby="emailHelp">
                            <div id="nameHelp" class="form-text">Please type your mobile number</div>
                        </div>
                        <div class="mb-3">
                            <label for="userAddress" class="form-label">User Address</label>
                            <textarea class="form-control" name="userAddress" id="userAddress" placeholder="Please type your address" ></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="userEmail" class="form-label">Email address</label>
                            <input type="email" class="form-control" name="userEmail" id="userEmail" aria-describedby="emailHelp">
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="mb-3">
                            <label for="userPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" name="userPassword" id="userPassword">
                        </div>
                        <button type="submit" class="btn btn-primary">Register Now!</button>
                        <button type="submit" class="btn btn-warning">Reset</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
