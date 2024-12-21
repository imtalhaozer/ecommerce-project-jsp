<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.ecommerceprojectjsp.models.User" %>
<%
    User auth= (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="includes/head.jsp" %>
    <title>Cart Pages</title>
    <style type="text/css">

        .table tbody td{
            vertical-align: middle;
        }
        .btn-incre, .btn-decre{
            box-shadow: none;
            font-size: 25px;
        }
        .form-control.text-center {
            width: 50px; /* Girdi genişliği */
            font-size: 14px; /* Yazı boyutu */
            padding: 5px;
            text-align: center; /* Yazıyı ortala */
        }
    </style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="d-flex py-3">
        <h3> Total Price: $452 </h3>
        <a class="mx-3 btn btn-primary" href="#">Check Out</a>
    </div>
        <table class="table table-light">
            <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col">Price</th>
                <th scope="col">Buy Now</th>
                <th scope="col">Cancel</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Product 1</td>
                <td>shoes</td>
                <td>45$</td>
                <td>
                    <form action="" method="post" class="from-inline">
                        <input type="hidden" name="id" value="1" class="form-input">
                        <div class="form-group d-flex  w-10 h-5 ">
                            <a class="btn btn-sm btn-incre"><i class="fas fa-plus-square" ></i></a>
                            <input type="text" name="quantity"  class="form-control text-center" value="1" readonly>
                            <a class="btn btn-sm btn-decre"><i class="fas fa-minus-square" ></i></a>
                        </div>
                    </form>
                </td>
                <td><a href="#" class="btn btn-danger">Remove</a></td>
            </tr>
            </tbody>
        </table>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>