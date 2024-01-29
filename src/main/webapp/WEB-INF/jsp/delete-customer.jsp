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
                <li class="breadcrumb-item"><a href="/login">Home</a></li>
                <li class="breadcrumb-item"><a href="/customer/list">Manage Customers</a></li>
                <li class="breadcrumb-item active" aria-current="page">Delete Customer</li>
            </ol>
        </nav>
    </div>
</header>
    <h3 class="align-center">Customer Deleted Successfully!</h3>
<br/>
<form action="/customer/list" >
    <button type="submit" class="btn btn-success">BACK</button>
</form>
</body>
</html>