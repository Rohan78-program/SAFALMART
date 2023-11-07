
<%@page import="java.util.Map"%>
<%@page import="com.company.safalmart.helper.Helper"%>
<%@page import="com.company.safalmart.dao.ProductDao"%>
<%@page import="com.company.safalmart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.company.safalmart.helper.FactoryProvider"%>
<%@page import="com.company.safalmart.dao.CategoryDao"%>
<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in !!! Login First...");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user.getUserType().equals("user")){
            session.setAttribute("message", "You are not an admin !!! Do not access this page...");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>

<%
    CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
    List<Category> clist=cDao.getCategories();
    
    Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="Components/common_CSS_Js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <link rel="stylesheet" href="CSS/admin_style.css"/>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="Components/message.jsp" %>
            </div>
            <div class="row">    
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 200px;" class="img-fluid" src="Img/presentation.gif" alt="user"/>
                            </div>
                            
                            <h2><%=m.get("userCount")%></h2>
                            <h1>Users</h1>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 200px;" class="img-fluid" src="Img/list.gif" height="100px" alt="categories"/>
                            </div>
                            <h2><%=clist.size()%></h2>
                            <h1>Categories</h1>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 200px;" class="img-fluid" src="Img/complete.gif" height="100px" alt="products"/>
                            </div>
                            
                            <h2><%=m.get("productCount")%></h2>
                            <h1>Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5 mb-4">
                
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="Img/app.png" alt="add_categories"/>
                            </div><br>
                            <p class="mt-2">click here to add new categories</p>
                            <h1>Add Categories</h1>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="Img/add-product.png" alt="add_products"/>
                            </div>
                            <p class="mt-2">click here to add products</p>
                            <h1>Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- start add category modal -->
        
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            
                            <input type="hidden" name="operation" value="add_category">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="category_title" placeholder="enter category title" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 250px;" class="form-control" placeholder="enter category description" name="category_description" required></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-outline-danger ml-4" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- end add category modal -->
        
        <!-- start add product modal -->
        
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="add_product">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="product_name" placeholder="enter product name" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="enter product description" name="product_description" required></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="product_price" placeholder="enter product price" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="product_discount" placeholder="enter product price discount" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="product_quantity" placeholder="enter product quantity" required/>
                            </div>
                            
                            <!-- Choose Categories -->
                            
                            <div class="form-group">
                                <select name="category_Id" class="form-control">
                                    
                                    <%
                                    
                                        for(Category c:clist){
                                    
                                    %>
                                    
                                    <option value="<%=c.getcId()%>"><%=c.getcTitle()%></option>
                                    
                                    <%
                                    
                                        }
                                    
                                    %>
                                    
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="product_photo">Choose Product Picture </label>
                                <input type="file" id="product_photo" class="form-control" name="product_photo"/>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-outline-danger ml-4" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="Components/common_modals.jsp" %>
        <!-- end add product modal -->
    </body>
</html>
