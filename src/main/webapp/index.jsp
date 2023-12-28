
<%@page import="com.company.safalmart.helper.Helper"%>
<%@page import="com.company.safalmart.entities.Category"%>
<%@page import="com.company.safalmart.dao.CategoryDao"%>
<%@page import="com.company.safalmart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.company.safalmart.dao.ProductDao"%>
<%@page import="com.company.safalmart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>safalMart:Home</title>
        <%@include file="Components/common_CSS_Js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        
        <%                
                String cat = request.getParameter("category");
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;
                if (cat==null || cat.trim().equals("all")) {
                    list = dao.getAllProducts();
                } else {
                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);
                }
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
        %>
        <div class="row mt-3 mx-2">

            <!-- show categories -->
            <div class="col-md-2">

                <div class="list-group text-center mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Categories
                    </a>

                    <%                         
                        for (Category category : clist) {

                    %>
                    
                    <a href="index.jsp?category=<%= category.getcId()%>" class="list-group-item list-group-item-action"><%= category.getcTitle()%></a>

                    <%
                        }
                    %>
                </div>
            </div>

            <!-- show products -->
            <div class="col-md-10">

                <div class="row mt-4">
                    <div class="col-md-12">

                        <div class="card-columns">

                            <%
                                for (Product product : list) {

                            %>
                                        
                            <div class="card product-card">

                                <div class="card-body">

                                    <div class="container text-center" title="<%= product.getpName()%>">

                                        <img class="card-img-top m-2" src="Img/Product/<%= product.getpPic()%>" alt="<%= product.getpPic()%>" style="max-height: 170px; max-width: 100%; width: auto;">

                                    </div>

                                    <h5 class="card-title"><%= product.getpName()%></h5>
                                    <p class="card-text"><%= Helper.get10words(product.getpDesc())%></p>
                                </div>

                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%=product.getpId()%>,'<%=product.getpName()%>',<%=product.getPriceAfterDiscount()%>);">Add to cart</button>
                                    <button class="btn btn-outline-success"> &#8377; <%=product.getPriceAfterDiscount()%> <span class="text-dark actual-price"><%=product.getpPrice()%></span> <span class="text-secondary discount-label"> &#x2212;<%= product.getpDisc()%> &#x25;</span></button>
                                </div>

                            </div>

                            <%}
                              if(list.size()==0){
                                out.println("<h3> There is no items in this category <h3>");
                              }
                            %>

                        </div>

                    </div>
                </div>

            </div>

        </div>
        <%@include file="Components/common_modals.jsp" %>
    </body>

</html>
