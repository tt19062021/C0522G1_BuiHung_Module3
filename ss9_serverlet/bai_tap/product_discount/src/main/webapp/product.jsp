<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 23/08/2022
  Time: 2:44 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h3>Product Discount Calculator</h3>
<form action="/discount" method="post">
    <label>Product Description</label><br>
    <input type="text" name="description" placeholder="DESC" value=""/><br/>
    <label>List Price</label><br>
    <input type="number" name="price" placeholder="PRICE" value=""/><br/>
    <label>Discount Percent</label><br>
    <input type="number" name="discount" placeholder="%" value=""/><br/>
    <input type = "submit" id = "submit" value = "Calculate Discount"/>
</form>
</body>
</html>
