
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

    <title>Product and Inventory</title>

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
            <h1 class="mt-4">Update product and inventory</h1>
            <hr>
            <div class="update-product mb-3">
                <h4 class="mt-4">Add new product</h4>
                <c:choose>
                    <c:when test="${productUploadSuccess}">
                        <small class="text-success">New product added!</small>
                    </c:when>
                    <c:when test="${productUploadSuccess == false}">
                        <small class="text-danger">New product add failed!</small>
                    </c:when>
                </c:choose>
                <form action="/product/addProduct" method="post" enctype="multipart/form-data">
                    <div class="custom-control custom-control-inline">
                        <label for="productFile">Choose product csv file to upload</label>
                        <input class="form-control m-2" type="file" name="productFile" id="productFile" accept="text/csv" required>
                        <input class="btn btn-primary m-2" type="submit" value="Upload">
                    </div>
                </form>
            </div>
            <hr>
            <div class="update-inventory mb-3">
                <h4 class="mt-4">Update inventory</h4>
                <c:choose>
                    <c:when test="${inventoryUploadSuccess}">
                        <small class="text-success">Inventory updated!</small>
                    </c:when>
                    <c:when test="${inventoryUploadSuccess == false}">
                        <small class="text-danger">Inventory update failed!</small>
                    </c:when>
                </c:choose>
                <form action="/inventory/updateInventory" method="post" enctype="multipart/form-data">
                    <div class="custom-control custom-control-inline">
                        <label for="inventoryFile">Choose inventory csv file to upload</label>
                        <input class="form-control m-2" type="file" name="inventoryFile" id="inventoryFile" accept="text/csv" required>
                        <input class="btn btn-primary m-2" type="submit" value="Upload">
                    </div>
                </form>
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
