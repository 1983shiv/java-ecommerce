<%-- 
    Document   : index
    Created on : Apr 19, 2022, 1:37:22 PM
    Author     : ninja
--%>

<%@page import="com.shiv.ignouecommerce.entities.Category"%>
<%@page import="com.shiv.ignouecommerce.dao.CategoryDao"%>
<%@page import="com.shiv.ignouecommerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.shiv.ignouecommerce.dao.ProductDao"%>
<%@page import="com.shiv.ignouecommerce.helper.factoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IgnouCart - Home </title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container py-4">
            <%@include file="components/screenmsg.jsp" %>
             
            
                <%                    
//                    String catId = "all";
//                    if(request.getParameter("category") == null){
//                        // catId = request.getParameter("category");
//                        out.println("request is working....");
//                    }
                    
                    ProductDao pdao = new ProductDao(factoryProvider.getFactory());
                    List<Product> plist = null;
                    //System.out.println("request is working....");
                    if(request.getParameter("category") == null){
                        plist = pdao.getProducts();
                    } else {
                        //System.out.println("request is working....");
                        String catId = request.getParameter("category");
                        int cid = Integer.parseInt(catId.trim());
                        plist = pdao.getProductsByCategoryId(cid);
                    }
                    //plist = pdao.getProducts();
                    CategoryDao cdao = new CategoryDao(factoryProvider.getFactory());
                    List<Category> list = cdao.getCategories();
                %>
                <div class="row">
                    <h6 class="my-4">Total No. of Products <%= plist.size()%></h6>
                </div> 
                <div class="row">
                <!--showing categories-->
                <div class="col-md-3">
                    <!--showing products in grid-->
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-action active">Categories</li>
                        <a href="index.jsp" class="list-group-item list-group-item-action">
                            <li class="d-flex justify-content-between align-items-center">Show All</li>
                        </a>
                        <% for (Category c : list) {%>
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action">
                            <li class="d-flex justify-content-between align-items-center"><%= c.getCategoryTitle()%>
                                <span class="badge bg-primary rounded-pill">
                                    <i class="fa-solid fa-arrow-up-right-from-square"></i>
                                </span>
                            </li>
                        </a>
                        <% }%>
                    </ul>
                </div>

                <div class="col-md-9">
                    <div class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-3 g-3">
                        <% for (Product p : plist) {%>

                        <!--https://freefrontend.com/bootstrap-cards/-->
                        <div class="col product-card">
                            <div class="card h-100 shadow-sm"> <img src="img/products/<%= p.getpPhoto()%>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <div class="clearfix mb-3 text-center"> <span class="badge rounded bg-secondary text-md">₹ <%= p.getPriceAferApplyingDiscount()%></span><span class="text-xs">&nbsp;&nbsp;&nbsp;₹<del><%= p.getpPrice()%></del>/- <%= p.getpDiscount()%>% Off  </span></div>
<!--                                    <div class="clearfix mb-3 text-center"> <span class="float-start badge rounded bg-primary">Price - <%= p.getpDiscount()%>% Off</span> <span class="float-end price-hp">₹<%= p.getPriceAferApplyingDiscount()%> </span></div>-->
                                    <h5 class="card-title text-center"><%= p.getpName()%></h5>
                                    <div class="text-center w-full my-4"> <a href="#" onclick="addToCart('<%= p.getpId()%>', '<%= p.getpName()%>', '<%= p.getpPrice()%>', '<%= p.getpPhoto()%>')" class="btn btn-outline-primary">Add to Cart</a> </div>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
                 
    </body>
</html>
