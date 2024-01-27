<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
  Created by IntelliJ IDEA.
  User: shashikala
  Date: 1/24/24
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Banking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Pacifico&family=Roboto:wght@100;300;400;500;700&family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header class="border-bottom">
    <div id="logo-container">
        <h1 class="m-0">
            <i class="bi bi-bag-check text-primary pe-2"></i>
            ABC BANKING SYSTEM
        </h1>
    </div>
    <div id="bread-crumb-container">
        <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Manage Customers</li>
            </ol>
        </nav>
    </div>
</header>



<div class="card text-center">
    <form id="form-container" action="#" method="POST">
        <div class="d-flex align-items-center justify-content-between mb-2">
            <h2>Customer Details</h2>
            <button id="btn-new-customer" type="button" class="btn btn-primary">
                + NEW <span>CUSTOMER</span>
            </button>
        </div>

<%--        ${pageContext.request.contextPath}/customer/--%>
        <form action="${pageContext.request.contextPath}/customer/" method="post">

            <div class="mb-3">
                <label for="txt-nic" class="form-label">Customer NIC</label>
                <input type="text" class="form-control" name="id" id="txt-nic" placeholder="Eg. 965390120V" value="${Customer.nic}">
            </div>
            <div class="mb-3">
                <label for="txt-name" class="form-label">Customer Name</label>
                <input type="text" class="form-control" name="name" id="txt-name" placeholder="Eg. Shashikala Chandrasekara" value="${Customer.name}">
            </div>
            <div class="mb-3">
                <label for="txt-address" class="form-label">Customer Address</label>
                <input type="text" class="form-control" name="address" id="txt-address" placeholder="Eg. Katubedda, Moratuwa", value="${Customer.address}">
            </div>
            <div class="mb-3">
                <label for="txt-mobile" class="form-label">Customer Mobile Number</label>
                <input type="text" class="form-control" name="address" id="txt-mobile" placeholder="Eg. 077-1234567", value="${Customer.mobileNumber}">
            </div>


                <button type="submit" class="btn btn-success">SAVE</button>

        </form>
    </form>

    <form method="get" action="view-customer.jsp">
        <input type="text" class="form-control" id="txt-search" placeholder="Enter Nic to search Customer"/>
        <label for="txt-search">Enter Your Query to Search Customers</label>
    </form>

    <div id="table-container">
<%--        <div class="form-floating mb-3">--%>
<%--            <input type="text" class="form-control" id="txt-search" placeholder="Enter Nic to search Customer" >--%>
<%--            <label for="txt-search">Enter Your Query to Search Customers</label>--%>
<%--        </div>--%>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>NIC</th>
                <th>NAME</th>
                <th>ADDRESS</th>
                <th>MOBILE NUMBER</th>
                <th>ACTIONS</th>
            </tr>
            </thead>
            <tbody>

<%--            <c:forEach var="customer" items="${studentList}">--%>


            <tr>
                <td>123</td>
                <td>Kasun</td>
                <td>Grace Pieris Road, Panadura</td>
                <td>
                    <i title="Edit" class="bi bi-pen me-2"></i>
                    <i title="Delete" class="bi bi-trash"></i>
                </td>
            </tr>


            </tbody>

        </table>

</body>
</html>
