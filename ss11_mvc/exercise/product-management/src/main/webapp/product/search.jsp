<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 25/08/2022
  Time: 6:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>

    </style>
</head>
<body>

<h1>Products</h1>
<a href="/product">
    Back to Home
</a>
<table class="table table-striped">
    <tr>
        <td>Product Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Producer</td>
        <td>Edit</td>
        <td>Delete</td>
        <td>View</td>
    </tr>
    <c:forEach items='${productList}' var="product">
        <tr>
            <td>${product.getProductName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>

            <td><a href="/product?action=update&id=${product.getId()} " class="btn btn-primary" role="button">Edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}" class="btn btn-primary" role="button">Delete</a></td>
            <td><a href="/product?action=view&id=${product.getId()}" class="btn btn-primary" role="button">View</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
