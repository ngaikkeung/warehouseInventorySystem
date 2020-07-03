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
            <h1 class="mt-4">Transfer inventory</h1>
            <hr>
            <div class="update-product mb-3">
                <form action="/inventory/transferInventory" method="post" onsubmit="return isDifferentLocation()">
                    <div class="form">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="from">From</label>
                                <select class="form-control" name="from" id="from" required>
                                    <option disabled value="" selected hidden>Choose...</option>
                                    <option value="TKO">TKO</option>
                                    <option value="CWB">CWB</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="to">To</label>
                                <select class="form-control" name="to" id="to" required>
                                    <option disabled value="" selected hidden>Choose...</option>
                                    <option value="TKO">TKO</option>
                                    <option value="CWB">CWB</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="productCode">Product code</label>
                                <input class="form-control" type="text" name="productCode" id="productCode" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="quantity">Quantity</label>
                                <input class="form-control" type="number" name="quantity" id="quantity" min="1" step="1" required>
                            </div>
                        </div>
                        <input class="btn btn-primary mt-2" type="submit" value="Transfer">
                        <small   id="is-invalid" class="text-danger"></small>
                        <c:if test="${not empty transferFailed}">
                            <small class="text-danger">
                                Transfer failed. ${transferFailed}
                            </small>
                        </c:if>
                        <c:if test="${not empty transferSuccess}">
                            <small class="text-success">
                                ${transferSuccess}
                            </small>
                        </c:if>
                    </div>
                </form>
            </div>
            <hr>
            <c:if test="${inventories.isEmpty() == true}">
                No record
            </c:if>

        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Bootstrap core JavaScript -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script>
    // Check from and to selection value
    (function(){

        // $("#from").change(function (event) {
        //     if(isSameLocation($("#from :selected").val(), $("#to :selected").val())){
        //         event.preventDefault();
        //         alert("Location cannot same");
        //     }
        // })
        // $("#to").change(function (event) {
        //     if(isSameLocation($("#from :selected").val(), $("#to :selected").val())){
        //         event.preventDefault();
        //         alert("Location cannot same");
        //     }
        // })
    })();

    function isDifferentLocation(){
        let from = $("#from :selected").val();
        let to = $("#to :selected").val();

        if(from == to){
            $("#is-invalid").text("Transfer location cannot same as destination.");
        }else{
            $("#is-invalid").text("");
        }
        return from != to;
    }
</script>

</body>

</html>
