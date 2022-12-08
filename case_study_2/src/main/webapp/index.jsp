<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 29/08/2022
  Time: 3:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Home</title>
    <style>
        .myCSS {
            background-color: #8b9fb2;
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

<%--Header--%>
<div class="container-fluid bg-gray-500 d-flex myCSS" style="height: 100px">
    <img class="h-100 p-4" src="https://www.furama.com/images/LOGOFurama_4C_Normal.png" alt="">
    <img class="ms-5 ps-5" src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png"
         alt="">

    <div class="container-fluid text-end my-4 me-4">
        <div class="login-container">
            <form action="/action_page.php">
                <input type="text" placeholder="Username" name="username">
                <input type="text" placeholder="Password" name="psw">
                <button type="submit">Login</button>
            </form>
        </div>
    </div>
</div>

<%--menu-bar--%>

<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid mx-5">
        <a class="navbar-brand" href="/">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Employee</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/employee?action=view">Employee list</a></li>
                        <li><a class="dropdown-item" href="/employee?action=create">Add new Employee</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Customer</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/customer?action=view">Customer list</a></li>
                        <li><a class="dropdown-item" href="/customer?action=create">Add new Customer</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Service</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/facility?action=view">Facility list</a></li>
                        <li><a class="dropdown-item" href="/facility?action=view">Add new Facility</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Contract</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/contract?action=view">Contract list</a></li>
                        <li><a class="dropdown-item" href="/contract?action=view">Add new Contract</a></li>
                    </ul>
                </li>
            </ul>

            <form class="d-flex my-2" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </div>
</nav>
<%--body--%>
<div class="container-fluid" style="height: 520px">
    <div class="row mx-3">
        <div class="col-2">
            <p class="ms-3 mt-3">Item One</p>
            <p class="ms-3 mt-3">Item Two</p>
            <p class="ms-3 mt-3">Item Three</p>
        </div>

        <div class="col-10">
            <img width="100%" height="520" id="img" onclick="changeImage()"
                 src="https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-Night.jpg"
                 alt="">
        </div>
        <script>
            var index = 1;
            changeImage = function () {
                var imgs = ["https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-Night.jpg", "https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior-Lobby.jpg", "https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior-Lagoon-Pool.jpg"];
                document.getElementById('img').src = imgs[index];
                index++;
                if (index == 3) {
                    index = 0;
                }
            }
            setInterval(changeImage, 2000);
        </script>
    </div>
</div>
<%--footer--%>
<footer class="text-center text-white" style="background-color: #caced1;">
    <!-- Grid container -->
    <div class="container p-4">
        <!-- Section: Images -->
        <section class="">
            <div class="row">
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbcdn.b-cdn.net/img/new/fluid/city/113.webp"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbcdn.b-cdn.net/img/new/fluid/city/111.webp"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbcdn.b-cdn.net/img/new/fluid/city/112.webp"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbcdn.b-cdn.net/img/new/fluid/city/114.webp"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbcdn.b-cdn.net/img/new/fluid/city/115.webp"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbcdn.b-cdn.net/img/new/fluid/city/116.webp"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Section: Images -->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2020 Copyright:
        <a class="text-white" href="https://mdbootstrap.com/">MDBootstrap.com</a>
    </div>
    <!-- Copyright -->
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>