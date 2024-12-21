<%@ page import="com.example.ecommerceprojectjsp.connection.DbCon" %>
<%@ page import="com.example.ecommerceprojectjsp.models.User" %>
<%@ page import="com.example.ecommerceprojectjsp.dao.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ecommerceprojectjsp.models.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth == null) {
        response.sendRedirect("login.jsp");
    }

    ProductDao productDao = new ProductDao(DbCon.getConnection());
    List<Product> products = productDao.getAllProducts();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp" %>
    <title>Welcome | E-Commerce Shopping Cart</title>
</head>
<body>
<%@include file="includes/navbar.jsp" %>

<div class="container">
    <div class="card-header my-3">All Products</div>
    <div class="row">
        <%
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
        <div class="col-md-3">
            <div class="card w-100 mb-3" style="width: 18rem;">
                <img class="card-img-top" src="product-image/<%= product.getImage() %>" alt="<%= product.getName() %>">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <h6 class="price">Price: $<%= product.getPrice() %></h6>
                    <h6 class="category">Category: <%= product.getCategory() %></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="add-to-cart?id=<%=product.getId()%>" class="btn btn-dark">Add to Cart</a>
                        <a href="#" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <p>No products available.</p>
        <%
            }
        %>
    </div>
</div>

<%@include file="includes/footer.jsp" %>
</body>
</html>
