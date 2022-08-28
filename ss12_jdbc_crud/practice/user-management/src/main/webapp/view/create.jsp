<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 26/08/2022
  Time: 11:14 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<h3>Create New User</h3>
<a href="/user?action=user" tabindex="0" class="btn btn-sm btn-danger" role="button" data-bs-toggle="popover" data-bs-trigger="focus" title="Dismissible popover" data-bs-content="Click to return Home">Home</a>
<form>
<%--    <div class="mb-3">--%>
<%--        <label  class="form-label">ID (Id Người dùng):</label>--%>
<%--        <input name="id" id="id" class="form-control form-control-sm" type="number" placeholder=".nhập vào id" aria-label=".form-control-sm example">--%>
<%--    </div>--%>
    <div class="mb-3">
        <label  class="form-label">Your Name (Tên Người dùng):</label>
        <input name="name" id="name" class="form-control form-control-sm" type="text" placeholder=".nhập vào tên" aria-label=".form-control-sm example">
    </div>
    <div class="mb-3">
        <label class="form-label">Email (Địa chỉ Email)</label>
        <input name="gmail" id="gmail" type="text" class="form-control form-control-sm"  placeholder="name@example.com">
    </div>

    <div class="mb-3">
        <label  class="form-label">Country (Quê quán):</label>
        <input name="country" id="country" class="form-control form-control-sm" list="datalistOptions"  placeholder=".search here...">
        <datalist id="datalistOptions">
            <option value="San Francisco">
            <option value="New York">
            <option value="Seattle">
            <option value="Los Angeles">
            <option value="Chicago">
        </datalist>
    </div>
    <button type="submit" class="btn btn-primary" value="Create"></button>
</form>
</body>
</html>
