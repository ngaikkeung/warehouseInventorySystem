<%--
  Created by IntelliJ IDEA.
  User: kkngai
  Date: 2/7/2020
  Time: 2:01 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/simple-sidebar.css" rel="stylesheet">

</head>

<body>

<div class="d-flex" id="wrapper">

    <!-- Common sidebar included-->
    <jsp:include page="sidebar.jsp"></jsp:include>

    <!-- Page Content -->
    <div id="page-content-wrapper">

        <div class="container-fluid">
            <h1 class="mt-4">Dashboard</h1>
            <hr>
            <div class="products">
                <h4>Product Table</h4>
                <c:choose>
                    <c:when test="${products.isEmpty()}">
                        No record
                    </c:when>
                    <c:otherwise>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">Product code</th>
                                <th scope="col">Product name</th>
                                <th scope="col">Product weight</th>
                            </tr>
                            </thead>
                            <c:forEach items="${products}" var="product">
                                <tr>
                                    <td>${product.code}</td>
                                    <td>${product.name}</td>
                                    <td>${product.weight}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>

            </div>
            <div class="inventory">
                <h4>Inventory Table</h4>
                <c:choose>
                    <c:when test="${inventories.isEmpty()}">
                        No record
                    </c:when>
                    <c:otherwise>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">Inventory id</th>
                                <th scope="col">Product code</th>
                                <th scope="col">Inventory quantity</th>
                                <th scope="col">Inventory location</th>
                            </tr>
                            </thead>
                            <c:forEach items="${inventories}" var="inventory">
                                <tr>
                                    <td>${inventory.inventoryId}</td>
                                    <td>${inventory.productCode}</td>
                                    <td>${inventory.quantity}</td>
                                    <td>${inventory.location}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Bootstrap core JavaScript -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>


</body>

</html>
