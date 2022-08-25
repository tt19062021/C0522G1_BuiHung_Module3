<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 25/08/2022
  Time: 9:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Chỉnh sửa</title>

    <style>
        body {
            background-color: #e3e3ff;
            font-family: Arial, sans-serif
        }
        a{
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
            color: blue;
        }
    </style>
</head>
<body>
<h3>Chỉnh sửa sản phẩm</h3>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product" >Về trang quản lí sản phẩm</a>
</p>
<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Mã sản phẩm: </td>
                <td><input type="number" name="id" id="id" value="${product.getId()}"></td>
            </tr>
            <tr>
                <td>Tên sản phẩm: </td>
                <td><input type="text" name="productName" id="productName" value="${product.getProductName()}"></td>
            </tr>
            <tr>
                <td>Giá tiền: </td>
                <td><input type="number" name="price" id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Mô tả: </td>
                <td><input type="text" name="description" id="description" value="${product.getDescription()}"></td>
            </tr>
            <tr>
                <td>Hãng sản xuất: </td>
                <td><input type="text" name="producer" id="producer" value="${product.getProducer()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Cập nhập"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
