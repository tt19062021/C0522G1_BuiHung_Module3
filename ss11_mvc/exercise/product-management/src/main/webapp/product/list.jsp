<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 25/08/2022
  Time: 2:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>
        h1 {
            text-align: center;
        }

        a {

            color: black;
        }

    </style>
</head>
<body>
<h2 style="text-align: center">Ứng dụng quản lý sản phẩm</h2>
<p style="text-align: center">
    <a href="/product?action=create"><i class="fa-solid fa-plus"></i> Thêm thông tin sản phẩm</a>
</p>
<form class="d-flex justify-content-end" action="/product?action=Search">
    <input type="text" name="nameSearch" placeholder="Nhập tên cần tìm kiếm" style="margin-right: 20px;">
    <input type="submit" name="action" value="Search" style="margin-right: 20px;">
</form>
<table class="table table-striped">
    <tr>
        <%--        <th>Mã sản phẩm</th>--%>
        <th>Tên sản phẩm</th>
        <th>Giá tiền</th>
        <th>Mô tả</th>
        <th>Hãng sản xuất</th>
        <th>Cập nhập</th>
        <th>Xóa</th>
        <th>Xem</th>
    </tr>
    <c:forEach items="${productList}" var="product">
        <tr>
                <%--            <td>${product.getId()}</td>--%>
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
