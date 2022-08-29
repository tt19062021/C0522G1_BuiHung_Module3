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
<h2 style="text-align: center">Quản Lý User</h2>

<form action="/user?action=search">
    <input type="text" name="countrySearch" placeholder="Tìm kím địa chỉ">
    <input type="submit" name="action" value="search">
</form>
<table class="table table-striped">
    <tr>
        <%--        <th>Mã sản phẩm</th>--%>
        <th>#</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Update</th>
        <th>Delete</th>
        <th>View</th>
    </tr>
    <c:forEach items="${listUser}" var="user" varStatus="status">
        <tr>
                <%--            <td>${product.getId()}</td>--%>
            <td>${status.count}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td>
                <a href="/user?action=update&id=${user.getId()} " class="btn btn-primary" role="button">Edit</a>
            </td>
            <td>
                <a href="/user?action=delete&id=${user.getId()}" class="btn btn-primary" role="button">Delete</a>
            </td>
            <td><a href="/user?action=view&id=${user.getId()}" class="btn btn-primary" role="button">View</a></td>
        </tr>

    </c:forEach>

</table>
<h4><a href="/user?action=create" class="link-success">Add New User</a></h4>
</body>
<script>
    function objdelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
</html>
