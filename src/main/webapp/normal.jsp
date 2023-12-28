<%@page import="com.company.safalmart.entities.User"%>
<%
    User user2 = (User) session.getAttribute("current-user");
    if (user2 == null) {
        session.setAttribute("message", "You are not logged in !!! Login First...");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user2.getUserType().equals("admin")) {
            session.setAttribute("message", "You are not a User !!! Do not access this page...");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Panel</title>
        <%@include file="Components/common_CSS_Js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/common_modals.jsp" %>
        
        <div class="container mt-5" id="normal">
            <div class="row">    
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <a href="profile.jsp"><img style="max-width: 200px;" class="img-fluid" src="Img/profile.gif" alt="user"/></a>
                            </div>
                            <h1>Profiles</h1>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 200px;" class="img-fluid" src="Img/notification-bell.gif" height="100px" alt="categories"/>
                            </div>
                            <h1>Notifications</h1>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 200px;" class="img-fluid" src="Img/barcode.gif" height="100px" alt="products"/>
                            </div>
                            <h1>Orders</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
