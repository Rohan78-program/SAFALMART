
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="Components/common_CSS_Js.jsp" %>
        
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class="container-fluid">
             
            <div class="row mt-5">
                <div class="col-md-5 offset-md-4">
                
                    <div class="card">
                        <div class="card-header custom-bg text-white text-center">
                            <img class="rounded-circle" src="Img/login-.gif" height="170px" width="180px" alt="Login Here !!!"/>
                        </div>
                        
                        <div class="card-body px-7">
                            <%@include file="Components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input name="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" type="password" class="form-control" id="password" placeholder="Password">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-4 alert alert-warning">If not Registered click here !!!</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary border-0">Login</button>
                                    <button type="reset" class="btn btn-primary border-0">Reset</button>
                                </div>
                            </form>
                        </div>
                
                </div>
            </div>
    
        </div>    
    </body>
</html>
