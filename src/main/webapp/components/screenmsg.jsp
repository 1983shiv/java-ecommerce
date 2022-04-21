<% 
  String msg = (String)session.getAttribute("screenmsg");
  if(msg != null){
  
%>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%= msg %></strong> 
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
    
<%
    // print the msg
    // out.println("<div class='alert alert-primary' role='alert'>");
    // out.println(msg);
    // out.println("</div>");
    // remove the session attributes once it is displayed on the screen;
    session.removeAttribute("screenmsg");
    }
%>


