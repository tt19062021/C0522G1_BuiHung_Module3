<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 30/08/2022
  Time: 10:02 SA
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
<h2 style="text-align: center">Danh Sách Khách Hàng</h2>

<form action="/customer">
    <input type="text" name="countrySearch" placeholder="Tìm kím địa chỉ">
    <input type="submit" name="action" value="search">
</form>
<a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a>
<table class="table table-striped">
    <tr>
        <%--        <th>Mã sản phẩm</th>--%>
        <th>#</th>
        <th>Customer Type Id</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Date Of Birth</th>
        <th>Id Card</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Update</th>
        <th>Delete</th>

    </tr>
    <c:forEach items="${customerList}" var="customer" varStatus="status">
        <tr>
                <%--            <td>${product.getId()}</td>--%>
            <td>${status.count}</td>
            <td>${customer.customerType}</td>
            <td>${customer.name}</td>

            <c:if test="${customer.gender == 1}">
                <td>Male</td>
            </c:if>
            <c:if test="${customer.gender == 0}">
                <td>Female</td>
            </c:if>


            <td>${customer.dateOfBirth}</td>
            <td>${customer.idCard}</td>
            <td>${customer.phone}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td>
                <a href="/user?action=update&id=${user.getId()} " class="btn btn-primary" role="button">Edit</a>
            </td>
            <td>
                <a href="/user?action=delete&id=${user.getId()}" class="btn btn-primary" role="button">Delete</a>
            </td>
        </tr>

    </c:forEach>

</table>

</body>
<script>
    // function objdelete(id, name) {
    //     document.getElementById("idDelete").value = id;
    //     document.getElementById("nameDelete").innerText = name;
    // }
</script>
</html>
