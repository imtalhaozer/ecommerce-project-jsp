<%@ page import="com.example.ecommerceprojectjsp.connection.DbCon" %>
<%@ page import="com.example.ecommerceprojectjsp.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User auth= (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp" %>
    <title>Welcome | E-Commerce Shopping Cart</title>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<% out.print(DbCon.getConnection()); %>

<!-- Footer -->
<%@include file="includes/footer.jsp" %>
</body>
</html>
