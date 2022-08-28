<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 28/08/2022
  Time: 8:25 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View User</title>
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
<h3>Infomation User</h3>
<p>
    <a href="/user">Back</a>
</p>
<fieldset>
    <legend>Information User</legend>
    <table>
        <tr>
            <td>ID:</td>
            <td><input type="number" name="id" id="id" value="${user.getId()}"></td>
        </tr>
        <tr>
            <td>Name(ten):</td>
            <td><input type="text" name="name" id="name" value="${user.getName()}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="gmail" id="gmail" value="${user.getEmail()}"></td>
        </tr>
        <tr>
            <td>Country:</td>
            <td><input type="text" name="country" id="country" value="${user.getCountry()}"></td>
        </tr>
<%--        <tr>--%>
<%--            <td>Hãng sản xuất:</td>--%>
<%--            <td><input type="text" name="producer" id="producer" value="${product.getProducer()}"></td>--%>
<%--        </tr>--%>
    </table>
</fieldset>
</body>
</html>
