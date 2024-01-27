<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Pacifico&family=Roboto:wght@100;300;400;500;700&family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="index.jsp">

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
    <form action="/saveCustomer" method="get">
        <div class="d-flex align-items-center justify-content-between mb-2">
            <h2>Customer Details</h2>
            <button id="btn-new-customer" type="submit" class="btn btn-primary">
                + NEW <span>CUSTOMER</span>
            </button>
        </div>
    </form>


<%--    <div class="gap-2">--%>

<%--        <form action="/customer/viewCustomer/${nic}", method="get" >--%>
<%--            <div class="gap-2">--%>
<%--                <button type="submit" class="btn btn-success">View Customer</button>--%>
<%--                <input type="text" id="nic" class="form-control" required name="nic" value="${customer.nic}" />--%>
<%--            </div>--%>
<%--        </form>--%>

<%--        <form>--%>
<%--            <div>--%>
<%--                <button type="submit" class="btn btn-success">Update Customer</button>--%>
<%--                <input type="text" id="nic-update" class="form-control" required name="nic" value="${customer.nic}" />--%>
<%--            </div>--%>


<%--        </form>--%>

<%--        <form>--%>
<%--            <button type="submit" class="btn btn-success">Delete Customer</button>--%>
<%--            <input type="text" id="nic-delete" class="form-control" required name="nic" value="${customer.nic}" />--%>
<%--        </form>--%>


<%--    </div>--%>



    <div id="table-container">


    <table class="table table-bordered table-hover">
        <tr>
            <th>NIC</th>
            <th>Name</th>
            <th>Address</th>
            <th>Mobile No</th>
<%--            <th>Action</th>--%>
        </tr>
        <c:forEach items="${customers}" var="customer">
            <tr>
                <td>${customer.nic}</td>
                <td>${customer.name}</td>
                <td>${customer.address}</td>
                <td>${customer.mobileNumber}</td>
                <td>
                    <a href="/customer/viewCustomer/${customer.nic}">View</a>
                    <a href="/customer/updateCustomer/${customer.nic}">Update</a>
                    <a href="/customer/deleteCustomer/${customer.nic}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="d-flex justify-content-center" id="pagination-container">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
    </div>

    </div>

</div>





</body>
</html>