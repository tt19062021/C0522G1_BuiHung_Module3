<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 27/08/2022
  Time: 7:40 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Employee list</title>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <style>
        body {
            background-image: url("https://i.pinimg.com/originals/86/41/6d/86416d71cbd1e608a5304bb92fc235ea.png");
        }

        table {
            border: solid 3px;
        }

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="p-3">
    <h2 class="text-center fw-bold">EMPLOYEE LIST</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <c:if test="${mess!=null}">
        <c:if test="${check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-success alert-dismissible fade show w-50 text-center">
                    <strong>${mess}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>

        <c:if test="${!check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-danger alert-dismissible fade show w-50 text-center">
                    <strong>${mess}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>
    </c:if>

    <nav class="navbar navbar-expand-lg py-0 my-0">
        <div class="container-fluid">
            <a href="/employee?action=create">
                <button class="btn btn-success btn-outline-secondary btn-sm">
                    <span class="fa-solid fa-person-circle-plus text-light h5 my-auto me-1"></span>
                    <span class="text-light"> Add new Eployee</span>
                </button>
            </a>

            <form class="d-flex my-2" role="search" action="/employee">
                <input class="form-control me-2" type="text" placeholder="Input search Name" aria-label="Search"
                       name="nameSearch">
                <input class="form-control me-2" type="text" placeholder="Input search Address" aria-label="Search"
                       name="addressSearch">
                <input class="form-control me-2" type="text" placeholder="Input search Phone" aria-label="Search"
                       name="phoneSearch">
                <button class="btn btn-outline-success" type="submit" name="action" value="search">
                    <i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </nav>

    <table id="employeeTable" class="table table-light table-striped table-bordered">
        <thead>
        <tr class="table-dark text-light">
            <th class="text-center"><i class="fa-solid fa-dog"></i></th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Id card</th>
            <th>Salary</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Position</th>
            <th>Education Degree</th>
            <th>Division</th>
            <th class="text-center">Edit</th>
            <th class="text-center">Delete</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach varStatus="status" var="employee" items="${employeeList}">
            <tr>
                <td class="text-center">${status.count}</td>
                <td>${employee.employeeName}</td>
                <td>${employee.employeeBirthday}</td>
                <td>${employee.employeeIdCard}</td>
                <td>₫${String.format("%.0f", employee.employeeSalary)}</td>
                <td>${employee.employeePhone}</td>
                <td>${employee.employeeEmail}</td>
                <td>${employee.employeeAddress}</td>
                <c:forEach var="position" items="${positionList}">
                    <c:if test="${position.positionId == employee.positionId}">
                        <td>${position.positionName}</td>
                    </c:if>
                </c:forEach>
                <c:forEach var="educationDegree" items="${educationDegreeList}">
                    <c:if test="${educationDegree.educationDegreeId == employee.educationDegreeId}">
                        <td>${educationDegree.educationDegreeName}</td>
                    </c:if>
                </c:forEach>
                <c:forEach var="division" items="${divisionList}">
                    <c:if test="${division.divisionId == employee.divisionId}">
                        <td>${division.divisionName}</td>
                    </c:if>
                </c:forEach>
                <td class="text-center">
                    <a href="/employee?action=edit&id=${employee.employeeId}">
                        <button class="btn btn-primary btn-outline-secondary btn-sm">
                            <span class="fa-solid fa-user-pen text-light h6 m-auto px-2"></span>
                        </button>
                    </a>
                </td>
                <td class="text-center">
                    <a href="/employee?action=delete&id=${employee.employeeId}" data-bs-toggle="modal"
                       data-bs-target="#exampleModal"
                       onclick="deleteEmployee('${employee.getEmployeeId()}','${employee.getEmployeeName()}')">
                        <button class="btn btn-danger btn-outline-secondary btn-sm">
                            <span class="fa-solid fa-person-circle-minus text-light h6 m-auto px-2"></span>
                        </button>
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
</div>

<script>
    function deleteEmployee(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#employeeTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 7
        });
    });
</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous">
</script>
</html>