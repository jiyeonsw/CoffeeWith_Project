<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffeewith</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <style type="text/css">
    </style>
</head>
<body>
<c:set var="root"></c:set>
<div style="margin: 30px;width:1000px;">
    <div class="input-group">

        <input type="text" class="form-control" style="width: 750px;">
        <input type="text" class="form-control" style="width: 150px;">
        <button type="button" class="btn btn-warning" id="btn1">검색</button>

        <i class='fas fa-plus addform' style='font-size:38px;color:red;margin-left: 10px;'></i>
    </div>

    <div id="result" style="margin-top: 30px;">
        <table>
            <tr>
                <td><img src="${root}/images/logo1.png"></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

        </table>

    </div>
</div>

</body>
</html>