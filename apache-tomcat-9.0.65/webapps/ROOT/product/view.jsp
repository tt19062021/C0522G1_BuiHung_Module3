<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 25/08/2022
  Time: 9:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Xem sản phẩm</title>


    <style>
        body {
            background-color: #e3e3ff;
            font-family: Arial, sans-serif
        }
        a {
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
            color: blue;
        }
    </style>
</head>
<body>
<h3>Thông tin chi tiết sản phẩm</h3>
<p>
    <a href="/product">Về trang quản lý sản phẩm</a>
</p>
<fieldset>
    <legend>Thông tin sản phẩm</legend>
    <table>
        <tr>
            <td>Mã sản phẩm:</td>
            <td><input type="number" name="id" id="id" value="${product.getId()}"></td>
        </tr>
        <tr>
            <td>Tên sản phẩm:</td>
            <td><input type="text" name="productName" id="productName" value="${product.getProductName()}"></td>
        </tr>
        <tr>
            <td>Giá tiền:</td>
            <td><input type="number" name="price" id="price" value="${product.getPrice()}"></td>
        </tr>
        <tr>
            <td>Mô tả:</td>
            <td><input type="text" name="description" id="description" value="${product.getDescription()}"></td>
        </tr>
        <tr>
            <td>Hãng sản xuất:</td>
            <td><input type="text" name="producer" id="producer" value="${product.getProducer()}"></td>
        </tr>
    </table>
</fieldset>
</body>
</html>
