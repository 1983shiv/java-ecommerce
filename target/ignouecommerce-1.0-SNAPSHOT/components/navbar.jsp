<%@page import="com.shiv.ignouecommerce.entities.User"%>

<%
    
User user1 = (User) session.getAttribute("current-user");


%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">IgnouCart</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin.jsp">Admin</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="index.jsp" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="index.jsp">All Categories</a></li>
            <li><a class="dropdown-item" href="index.jsp?category=2">Laptop</a></li>
            <li><a class="dropdown-item" href="index.jsp?category=1">Mobile</a></li>
            <li><a class="dropdown-item" href="index.jsp?category=3">Digital Watches</a></li>
            <li><a class="dropdown-item" href="index.jsp?category=4">Digital Tv</a></li>
            
          </ul>
        </li>
      </ul>
        <ul class="navbar-nav ml-auto">
            
            <%
                if( user1 == null){
                %>
                
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="registeration.jsp">Register</a>
                </li>
                
                <%
                }else{
                    %>
                    <li class="nav-item">
                        <a class="nav-link active" href="admin.jsp">Welcome <%= user1.getUserName() %></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                    <%
                }
            
            %>
            <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#cart" onclick="updateModal()">
                        <i class="fa fa-cart-plus" style="font-size: 20px; color: #fff;"></i>
                        <span id="headerCart" style="font-size: 16px;">(0)</span>
                    </a>
                </li>
        </ul>
    </div>
  </div>
</nav>
            
<%@include file="common-modal.jsp" %> 
