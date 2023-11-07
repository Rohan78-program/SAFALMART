<%@page import="com.company.safalmart.entities.User"%>
<%
    User user2=(User)session.getAttribute("current-user");
    if(user2==null){
        session.setAttribute("message", "You are not logged in !!! Login First...");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user2.getUserType().equals("admin")){
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
        <h1>User panel</h1>
    </body>
</html>
