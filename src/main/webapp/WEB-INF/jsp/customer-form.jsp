<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Form</title>
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
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a href="/customer/list">Manage Customers</a></li>
                <li class="breadcrumb-item active" aria-current="page">Save Customer</li>
            </ol>
        </nav>
    </div>
</header>
<form action="/customer/saveCustomer" method="post" >

    <div class="mb-3">
        <label for="nic" class="form-label">NIC:</label>
        <input type="text" pattern="^[1-9][0-9]{8}[Vv]$" id="nic" class="form-control" name="nic" value="${customer.nic}" required /><br/>
    </div>


    <div class="mb-3">
        <label for="name" class="form-label">Name:</label>
        <input type="text" id="name" pattern="^[A-Za-z ]+$" class="form-control" name="name" value="${customer.name}" required /><br/>
    </div>

    <div class="mb-3">
        <label for="address" class="form-label">Address:</label>
        <input type="text" id="address" class="form-control" name="address" value="${customer.address}" required/><br/>
    </div>

    <div class="mb-3">
        <label for="mobileNumber" class="form-label">Mobile Number:</label>
        <input type="text" pattern="^0[0-9]{9}$" id="mobileNumber" class="form-control" name="mobileNumber" value="${customer.mobileNumber}" /><br/>

    </div>

    <div class="d-flex gap-2 align-items-center">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-success">SAVE</button>


    </div>
</form>
<br/>
<form action="/customer/list" >
    <button type="submit" class="btn btn-success">BACK</button>
</form>
</body>
</html>