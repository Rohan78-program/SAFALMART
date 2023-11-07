
<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in !!! Login First to access checkout page.......");
        response.sendRedirect("login.jsp");
        return;
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkOut</title>
        <%@include file="Components/common_CSS_Js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-4">

                <div class="col-md-6">

                    <div class="card">

                        <div class="card-header" style="background-color: infotext">
                            <h2 class="text-center" style="color: whitesmoke">Your selected items</h2>
                        </div>

                        <div class="card-body" >

                            <div class="cart-body"></div>
                        </div>

                    </div>

                </div>

                <div class="col-md-6">

                    <div class="card">

                        <div class="card-header" style="background-color: infotext">
                            <h2 class="text-center" style="color: whitesmoke">Your details for order</h2>
                        </div>
                        <div class="card-body">
                            <form action="#">
                                <div class="form-group">
                                    <label for="email1">Email address</label>
                                    <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="email1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Your Name</label>
                                    <input value="<%=user.getUserName()%>" type="text" class="form-control" id="name" placeholder="Enter your name">
                                </div>
                                <div class="form-group">
                                    <label for="shippingAddress">Example shipping address</label>
                                    <textarea value="<%=user.getUserAddress()%>" class="form-control" id="shippingAddress" placeholder="Entere your address" rows="5"></textarea>
                                </div>

                                <div class="container text-center">

                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button type="button" class="btn btn-outline-primary" onclick="goToHome()">Continue Shopping</button>

                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <%@include file="Components/common_modals.jsp" %>
    </body>
</html>
