<%-- 
    Document   : login
    Created on : Apr 19, 2022, 5:16:23 PM
    Author     : ninja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container py-4">
            <%@include file="components/screenmsg.jsp" %>
            <h1 class="mt-0 text-center"><i class="fa-solid fa-arrow-right-to-arc"></i></h1>
            <h1 class="mt-0 text-center mb-4">Login</h1>
            <div class="row">
                <div class="col-md-6 offset-md-3 bg-light p-4">
                    <form action="LoginServlet" method="post">
                        <div class="mb-3">
                            <label for="userEmail" class="form-label">Email address</label>
                            <input type="email" class="form-control" name="userEmail" id="userEmail" aria-describedby="emailHelp">
                            <div id="emailHelp" class="form-text">Type your Email id.</div>
                        </div>
                        <div class="mb-3">
                            <label for="userPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" name="userPassword" id="userPassword">
                        </div>
                        <a href="registeration.jsp">
                            if not registered, click here.
                        </a>
                        <div class="text-center">
                        <button type="submit" class="btn btn-primary ">Logged In!</button>
                        <button type="reset" class="btn btn-outline-primary ">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
