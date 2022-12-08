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
<h2 style="text-align: center">Danh Sách Dịch Vụ</h2>

<form action="/facility">
    <input type="text" name="countrySearch" placeholder="Tìm kím địa chỉ">
    <input type="submit" name="action" value="search">
</form>
<a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a>
<table class="table table-striped">
    <tr>
        <%--        <th>Mã sản phẩm</th>--%>
        <th>#</th>
        <th>Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>Max People</th>
        <th>Rent</th>
        <th>Facility Type</th>
        <th>Standard Room</th>
        <th>Description</th>
        <th>Pool Area</th>
        <th>Floors</th>
        <th>Facility Free</th>
        <th>Edit</th>
        <th>Delete</th>

    </tr>
    <c:forEach items="${facilityList}" var="facility" varStatus="status">
        <tr>
                <%--            <td>${product.getId()}</td>--%>
            <td>${status.count}</td>
            <td>${facility.name}</td>
            <td>${facility.area}</td>
            <td>${facility.cost}</td>
            <td>${facility.maxPeople}</td>
            <td>${facility.rentType}</td>
            <td>${facility.facilityType}</td>
            <td>${facility.standardRoom}</td>
            <td>${facility.descriptionOtherConvenience}</td>
            <td>${facility.poolArea}</td>
            <td>${facility.numberOfFloors}</td>
            <td>${facility.facilityFree}</td>
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
