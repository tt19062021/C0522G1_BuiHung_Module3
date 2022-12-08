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
<%--    phan trang--%>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
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
<h2 style="text-align: center">Employee Lists</h2>

<%--<form action="/employee">--%>
<%--    <input type="text" name="countrySearch" placeholder="Tìm kím địa chỉ">--%>
<%--    <input type="submit" name="action" value="search">--%>
<%--</form>--%>

<nav class="navbar navbar-expand-lg py-0 my-0">
    <form class="d-flex my-2" role="search" action="/employee">
        <input class="form-control me-2" type="text" placeholder="Input search Name" aria-label="Search"
               name="nameSearch">
        <input class="form-control me-2" type="text" placeholder="Input search Address" aria-label="Search"
               name="addressSearch">
        <input class="form-control me-2" type="text" placeholder="Input search Phone" aria-label="Search"
               name="phoneSearch">
        <input class="btn btn-outline-success" type="submit" name="action" value="Search">
        <i class="fa-solid fa-magnifying-glass"></i></input>
    </form>
</nav>

<nav class="navbar navbar-expand-lg py-0 my-0">
    <a href="/">
        <button class="btn btn-danger btn-outline-secondary btn-sm">
            <span class="fa-solid fa-person-circle-plus text-light h5 my-auto me-1"></span>
            <span class="text-light">
               Home
            </span>



<%--    <i class="fa-solid fa-house-heart"></i>--%>
        </button>
    </a>

    <a href="/employee?action=create">
        <button class="btn btn-success btn-outline-secondary btn-sm">
            <span class="fa-solid fa-person-circle-plus text-light h5 my-auto me-1"></span>
            <span class="text-light"> Add new Eployee</span>
        </button>
    </a>
</nav>
<table class="table table-striped" id="customerTable">
    <thead>
    <tr>
        <%--        <th>Mã sản phẩm</th>--%>
        <th>#</th>
        <th>Name</th>
        <th>BirthDay</th>
        <th>Id Card</th>
        <%--        <th>Salary</th>--%>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Positon</th>
        <%--        <th>Education ID</th>--%>
        <%--        <th>Division ID</th>--%>
        <th>View</th>
        <th>Update</th>
        <th>Delete</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${employeeList}" var="employee" varStatus="status">
        <tr>
                <%--            <td>${product.getId()}</td>--%>
            <td>${status.count}</td>
            <td>${employee.name}</td>
            <td>${employee.dateOfBirth}</td>
            <td>${employee.idCard}</td>
                <%--            <td>${employee.salary}</td>--%>
            <td>${employee.phone}</td>
            <td>${employee.email}</td>
            <td>${employee.address}</td>
                <%--            <td>${employee.positionId}</td>--%>
                <%--                    <td>${employee.educationDegree}</td>--%>
                <%--                    <td>${employee.divisionId}</td>--%>
            <c:forEach var="position" items="${positionList}">
                <c:if test="${position.id == employee.positionId}">
                    <td>${position.name}</td>
                </c:if>
            </c:forEach>
                <%--                    <c:forEach var="educationDegree" items="${educationDegreeList}">--%>
                <%--                        <c:if test="${educationDegree.id == employee.educationDegree}">--%>
                <%--                            <td>${educationDegree.name}</td>--%>
                <%--                        </c:if>--%>
                <%--                    </c:forEach>--%>
                <%--                    <c:forEach var="division" items="${divisionList}">--%>
                <%--                        <c:if test="${division.id == employee.positionId}">--%>
                <%--                            <td>${division.name}</td>--%>
                <%--                        </c:if>--%>
                <%--                    </c:forEach>--%>

                <%--            <td>${employee.userName}</td>--%>

            <td>
                <a href="/employee?action=display&id=${employee.getId()} " class="btn btn-primary"
                   role="button"><i class="fa-solid fa-street-view"></i></a>
            </td>
            <td>
                <a href="/employee?action=edit&id=${employee.getId()} " class="btn btn-primary" role="button">


                    <i class="fa-solid fa-pen-to-square"></i></a>
            </td>
            <td class="text-center">
                <a href="/employee?action=delete&id=${employee.getId()}" data-bs-toggle="modal"
                   data-bs-target="#exampleModal" class="btn btn-danger" role="button"
                   onclick="deleteEmployee('${employee.getId()}','${employee.getName()}')">

                    <i class="fa-solid fa-trash"></i>
                </a>

            </td>
        </tr>

    </c:forEach>
    </tbody>
</table>



<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/employee" method="get">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">You Want To Delete?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" hidden name="idDelete" id="idDelete">
                    <input type="text" hidden name="action" value="delete">
                    <strong>Employee: </strong>
                    <span id="nameDelete" class="text-danger"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
<%-- Phân trang--%>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>

<script>
    $(document).ready(function () {
        $('#customerTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>


<script>
    function deleteEmployee(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
</html>
