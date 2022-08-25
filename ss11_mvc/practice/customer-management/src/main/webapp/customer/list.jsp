<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 25/08/2022
  Time: 9:00 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        h1{
            text-align: center;
        }
        a{
            color: black;
        }
    </style>
</head>
<body>
<h1>Customers</h1>


<table class="table table-success table-striped">
    <tr>
        <td><b>Name</b></td>
        <td><b>Email</b></td>
        <td><b>Address</b></td>
        <td><b>Edit</b></td>
        <td><b>Delete</b></td>
    </tr>
    <c:forEach items='${requestScope["customers"]}' var="customer">
        <tr>
            <td><a href="/customers?action=view&id=${customer.getId()}">${customer.getName()}</a></td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td><a class="btn btn-primary" href="/customers?action=delete&id=${customer.getId()}" role="button">Edit</a></td>
            <td><a class="btn btn-primary" href="/customers?action=delete&id=${customer.getId()}" role="button">Delete</a></td>
        </tr>
    </c:forEach>
</table>
    <a class="btn btn-primary" href="/customers?action=create" role="button">Create new customer</a>
</body>
</html>
