<%-- 
    Document   : admin
    Created on : Apr 20, 2022, 8:20:16 PM
    Author     : ninja
--%>

<%@page import="java.util.List"%>
<%@page import="com.shiv.ignouecommerce.entities.Category"%>
<%@page import="com.shiv.ignouecommerce.helper.factoryProvider"%>
<%@page import="com.shiv.ignouecommerce.dao.CategoryDao"%>
<%@page import="com.shiv.ignouecommerce.entities.User"%>

<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("screenmsg", "You are not loggedd in! ");
        response.sendRedirect("login.jsp");
        return;
    } else if (!user.getUserType().equals("admin")) {
        session.setAttribute("screenmsg", "Only admins are allowed to access this admin page.");
        response.sendRedirect("index.jsp");
        return;
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container py-4 admin-page">
            <%@include file="components/screenmsg.jsp" %>
            <h1 class="row mb-4">Welcome <%= user.getUserName()%></h1>
            <div class="row py-4">
                <div class="col-md-4">
                    <div class="card p-4">
                        <div class="text-center">
                            <img class="img-fluid" src="icons/plus.png" alt="Users" width="64px" height="64px" />
                        </div>
                        <div class="card-body text-center" data-bs-toggle="modal" data-bs-target="#categoryModal">
                            <a href="#">
                                <h4 class="card-title">Add Categories</h4>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <div class="text-center">
                            <img class="img-fluid" src="icons/plus.png" alt="Users" width="64px" height="64px" />
                        </div>
                        <div class="card-body text-center" data-bs-toggle="modal" data-bs-target="#productModal">
                            <a href="#">
                                <h4 class="card-title">Add Products</h4>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <div class="text-center">
                            <img class="img-fluid" src="icons/plus.png" alt="Users" width="64px" height="64px" />
                        </div>
                        <div class="card-body text-center">
                            <a href="registeration.jsp">
                                <h4 class="card-title">Add Users</h4>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="card p-4">
                        <div class="text-center">
                            <img class="img-fluid" src="icons/people.png" alt="Users" width="64px" height="64px" />
                        </div>
                        <div class="card-body text-center">
                            <span class="card-subtitle">64</span>
                            <a href="#">
                                <h4 class="card-title">Users</h4>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card p-4">
                        <div class="text-center">
                            <img class="img-fluid" src="icons/keys.png" alt="Categories" width="64px" height="64px" />
                        </div>
                        <div class="card-body text-center">
                            <span>18+</span>
                            <a href="#">
                                <h4 class="card-title">Categories</h4>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card p-4">
                        <div class="text-center">
                            <img class="img-fluid" src="icons/delivery-box.png" alt="Users" width="64px" height="64px" />
                        </div>
                        <div class="card-body text-center">
                            <span>640</span>
                            <a href="#">
                                <h4 class="card-title">Products</h4>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card p-4">
                        <div class="text-center">
                            <img class="img-fluid" src="icons/note.png" alt="Users" width="64px" height="64px" />
                        </div>
                        <div class="card-body text-center">
                            <span>1240</span>
                            <a href="#">
                                <h4 class="card-title">Orders</h4>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Category Modal -->
        <div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <form action="ProductOperationsServlet" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add New Category</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" class="form-control" id="operations" name="operations" value="addcategory">
                            <div class="mb-3">
                                <label for="categoryTitle" class="form-label">Category Title</label>
                                <input type="text" class="form-control" id="categoryTitle" name="categoryTitle" required >
                            </div>
                            <div class="mb-3">
                                <label for="categoryDescription" class="form-label">Category Description</label>
                                <textarea class="form-control" name="categoryDescription" id="categoryDescription" ></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-outline-primary">Add New Category</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Product Modal -->
        <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <form action="ProductOperationsServlet" method="post" enctype="multipart/form-data">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New Product</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" class="form-control" id="operations" name="operations" value="addproduct">
                            <div class="mb-3">
                                <label for="pName" class="form-label">Title</label>
                                <input type="text" class="form-control" id="pName" name="pName" required >
                            </div>
                            <div class="mb-3">
                                <label for="pDesc" class="form-label">Description</label>
                                <textarea class="form-control" name="pDesc" id="pDesc" ></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="pPhoto">Product Image</label>
                                <input type="file" class="form-control" id="pPhoto" name="pPhoto">
                            </div>
                            <div class="mb-3">
                                <label for="pPrice" class="form-label">Price($)</label>
                                <input type="number" class="form-control" id="pPrice" name="pPrice" required >
                            </div>
                            <div class="mb-3">
                                <label for="pDiscount" class="form-label">Discount (If Any) (%)</label>
                                <input type="number" class="form-control" id="pDiscount" name="pDiscount" value = "0" required >
                            </div>
                            <div class="mb-3">
                                <label for="pQuantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="pQuantity" name="pQuantity" value = "1" required >
                            </div>

                            <%
                                CategoryDao cdao = new CategoryDao(factoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();
                                
                            %>    
                            <select name="categoryId" id="categoryId" class="form-select" aria-label="select">
                                <% for (Category c:list) { %>
                                <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                <% } %>
                                
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-outline-primary">Add Product</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
