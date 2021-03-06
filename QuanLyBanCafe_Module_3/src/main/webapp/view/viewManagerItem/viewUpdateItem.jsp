<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/03/2022
  Time: 3:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, Tahoma;
            font-size: 12px;

        }

        #main {
            width: 1300px;
            padding: 0;
            margin-left: auto;
            margin-right: auto;
        }

        #head {
            height: 100px;
            background-color: #F5F5F5;
            border: 1px solid #CDCDCD;
            margin-bottom: 5px;
        }

        #head-link {
            height: 20px;
            line-height: 30px;
            padding-left: 10px;
            padding-right: 10px;
            border: 1px solid #CDCDCD;
            background-color: #F5F5F5;
            margin-bottom: 5px;
            clear: both;
        }

        #left {
            width: 10%;
            min-height: 400px;
            border: 1px solid #CDCDCD;
            float: left;
            background-color: #85cac4;
            margin-bottom: 5px;
        }

        #content {
            width: 73%;
            min-height: 400px;
            border: 1px solid #CDCDCD;
            float: left;
            margin-left: 5px;
            background-color: #85cac4;
            margin-right: 5px;
            margin-bottom: 5px;
        }

        #right {
            width: 15%;
            min-height: 400px;
            border: 1px solid #CDCDCD;
            background-color: #85cac4;
            float: right;
            margin-bottom: 5px;
        }

        #footer {
            height: 50px;
            clear: both;
            border: 1px solid #CDCDCD;
            background-color: #747d7d;
        }
    </style>
    <title>Update Item</title>
</head>
<body>
<div id="main">
    <div id="head">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">COKE COLE</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                        aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/servletController">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Link
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                                <li><a class="dropdown-item" href="/servletController?action=showProductLock">Product Lock</a></li>
                                <li><a class="dropdown-item" href="/servletController?action=showOrder">Order</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <div id="head-link">
        <div><h2>Update form</h2></div>
    </div>
    <div id="left">
    </div>
    <div id="content">
        <%
            int idItem = Integer.parseInt(request.getParameter("idItem"));
            String messErrorName = (String) request.getAttribute("messErrorName");
            String messErrorPrice = (String) request.getAttribute("messErrorPrice");
            if (messErrorName == null) {
                messErrorName = "";
            }
            if (messErrorPrice == null) {
                messErrorPrice = "";
            }
        %>
        <form class="row g-3 needs-validation" novalidate action="/servletController?action=update&idItem=<%=idItem%>" method="post">
            <div class="col-md-4 position-relative">
                <label for="validationTooltip01" class="form-label">Name Product</label>
                <input type="text" class="form-control" id="validationTooltip01" name="nameItem" value="${nameItem}"
                       required>
                <div>
                    <%=messErrorName%>
                </div>
            </div>
            <div class="col-md-4 position-relative">
                <label for="validationTooltip02" class="form-label">Price</label>
                <input type="text" class="form-control" id="validationTooltip02" value="${price}"
                       oninput="validatePrice()" name="price"
                       required>
                <div>
                    <%=messErrorPrice%>
                </div>
            </div>
            <div class="col-md-6 position-relative">
                <label for="validationTooltip03" class="form-label">Description</label>
                <input type="text" class="form-control" name="description" value="${description}"
                       id="validationTooltip03">
            </div>
            <div class="col-md-3 position-relative">
                <label class="form-label">Status</label>
                <input type="text" class="form-control" name="status" value="${status}" readonly/>
            </div>
            <div class="col-12">
                <button class="btn btn-primary"  type="submit">Update</button>
            </div>
        </form>

    </div>
    <div id="right">
    </div>
    <div id="footer">
    </div>
</div>
<%--<script>--%>
<%--    // Example starter JavaScript for disabling form submissions if there are invalid fields--%>
<%--    (function () {--%>
<%--        'use strict'--%>

<%--        // Fetch all the forms we want to apply custom Bootstrap validation styles to--%>
<%--        var forms = document.querySelectorAll('.needs-validation')--%>

<%--        // Loop over them and prevent submission--%>
<%--        Array.prototype.slice.call(forms)--%>
<%--            .forEach(function (form) {--%>
<%--                form.addEventListener('submit', function (event) {--%>
<%--                    if (!form.checkValidity()) {--%>
<%--                        event.preventDefault()--%>
<%--                        event.stopPropagation()--%>
<%--                    }--%>

<%--                    form.classList.add('was-validated')--%>
<%--                }, false)--%>
<%--            })--%>
<%--    })()--%>
<%--</script>--%>
<script>

    // let price = 0;
    //
    // function validatePrice() {
    //     price = Number.parseInt(document.getElementById("validationTooltip02").value);
    //     if (Number.isNaN(price)) {
    //         alert("Ph???i nh???p s??? v??o");
    //         document.getElementById("validationTooltip02").value = "";
    //     } else if (price < 0) {
    //         alert("Gi?? ph???i l???n h??n 0?");
    //
    //         document.getElementById("validationTooltip02").value = "";
    //     }
    // }

    // function checkCreate() {
    //     let idItem = Number.parseInt(document.getElementById("idItem").value);
    //     let nameItem = document.getElementById("validationTooltip01").value;
    //     let price = Number.parseInt(document.getElementById("validationTooltip02").value);
    //     let status = document.getElementById("validationTooltip04").value;
    //     if (idItem != null) {
    //         alert("Th??m th??nh c??ng!!!!");
    //     } else if (nameItem == null || price == NaN || status == null) {
    //         alert("Th??m kh??ng th??nh c??ng");
    //     }
    // }
</script>
</body>
</html>
