<%--
  Created by IntelliJ IDEA.
  User: kkngai
  Date: 2/7/2020
  Time: 2:01 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Search</title>

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
            <h1 class="mt-4">Search inventory</h1>
            <hr>
            <div class="update-product mb-3">
                <form action="/search/findInventory" method="post">
                    <div class="form">
                        <label for="productCode">Product code</label>
                        <input class="form-control" type="text" name="productCode" id="productCode" required>
                        <input class="btn btn-primary mt-2" type="submit" value="Search">
                    </div>
                </form>
            </div>
            <hr>
            <c:if test="${inventories.isEmpty() == true}">
                No record
            </c:if>
            <c:if test="${inventories.isEmpty() == false}">
                <div class="inventory">
                    <h4>Inventory Table</h4>
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
                </div>
            </c:if>
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
