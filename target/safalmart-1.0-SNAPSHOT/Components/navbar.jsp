
<%@page import="com.company.safalmart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");


%>
<nav class="navbar sticky-top navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="about.jsp" ><img style="max-height: 90px;" class="rounded-circle img-fluid show-logo" src="Img/safalMart.gif" alt="alt"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                
                <form class="form-inline" id="search">
                    <input class="form-control mr-sm-2" style="font-size:25px" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </ul>
            <ul class="navbar-nav mi-auto">
                <%            if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp" title="Login"><img style="max-width: 60px;" class="img-fluid" src="Img/log-in.png" alt="Login"/></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp" title="Register"><img style="max-width: 60px;" class="img-fluid" src="Img/edit.png" alt="register"/></a>
                </li>   

                <%
                } else if (user1.getUserType().equals("admin")) {
                %>
                <li class="nav-item active" id="admin">
                    <a class="nav-link" href="admin.jsp" title="<%=user1.getUserName()%>"><%=user1.getUserName().charAt(0)%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogOutServlet" title="LogOut"><img style="max-width: 60px;" class="img-fluid" src="Img/logout.png" alt="LogOut"/></a>
                </li>   
                <%
                } else {
                %>
                <li class="nav-item active" id="user">
                    <a class="nav-link" href="normal.jsp" title="<%=user1.getUserName()%>"><%=user1.getUserName().charAt(0)%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogOutServlet" title="LogOut"><img style="max-width: 60px;" class="img-fluid" src="Img/logout.png" alt="LogOut"/></a>
                </li>
                <%
                    }

                %>

                <li class="nav-item active">
                    <a title="Cart" class="nav-link" href="#" data-toggle="modal" data-target="#cart"><img style="max-width: 60px;" class="img-fluid mb-3" src="Img/shopping-cart.png" alt="shopping-cart"/> <span class="cart-items" style="font-size: 15px;color: blanchedalmond;">( 4 )</span></a>
                </li>
            </ul>

        </div>
    </div>
</nav>