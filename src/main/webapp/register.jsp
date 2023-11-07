
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="Components/common_CSS_Js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class="container-fluid">

            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">

                    <div class="card">

                        <div class="card-header custom-bg text-white text-center">
                            <img src="Img/customer-service.png" height="170px" width="180px" alt="Register Here !!!"/>
                        </div>
                        <div class="card-body px-5">
                            <%@include file="Components/message.jsp" %>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Somil kumar">
                                </div>

                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Somil234@gmail.com">
                                </div>

                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="enter password">
                                </div>

                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="7361912958">
                                </div>

                                <div class="form-group">
                                    <label for="userType">User Type</label>
                                    <select class="form-control" id="userType" name="user_type">
                                        <option>---select user type---</option>
                                        <option>user</option>
                                        <option>admin</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea name="user_address" style="height: 120px;" class="form-control" id="address" placeholder="enter address"></textarea>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="check" required>
                                    <label class="form-check-label" for="check">I Agree, all the above information are correct. &#128077;</label>
                                </div>
                                <div class="mt-3">
                                    <a href="login.jsp" class="text-center d-block mb-4 alert alert-warning">If Registered click here !!!</a>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success" submit>Register</button>
                                    <button type="reset" class="btn btn-outline-warning" reset>Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </div>    
    </body>
</html>
