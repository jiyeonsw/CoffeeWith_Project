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
    <link rel="stylesheet" href="../res/css/style.css" type="text/css">
    <style type="text/css">

        .table{
            height: 700px;
            margin-bottom: 0px;
        }

        .fddata {
            width: 100%;
            text-align: center;
            margin: auto;
        }

        .table .photo {
            height: 100%;
            width: 70%;
            vertical-align: middle;
            text-align: center;
            padding: 0;
        }

        .table .profile {
            height: 5%;
            text-align: left;
        }

        .table .fdcontent {
            height: 85%;
            vertical-align: top;
        }

        .table .inputtext {
            height: 100%;
            width: 100%;
            padding: 0;
            border: none;
            outline: none;
        }

        .table .fdcafe {
            height: 5%;
        }

        .table .fdtag {
            height: 5%;
        }

        #showimg{
            width: 100%;
            height: 100%;
        }

        #showimg .carousel-inner{
            width: 100%;
            height: 100%;
        }

        #showimg .carousel-item{
            height: 100%;
        }

        #showimg .carousel-item img{
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
        }

    </style>
</head>
<body>
<div class="fddata">
    <table class="table table-bordered">
        <tr>
            <td rowspan="4" class="photo">

                <!-- Carousel -->
                <div id="showimg" class="carousel slide" data-bs-interval="false" style="display: none">

                    <div class="carousel-inner" data-bs-interval="false"></div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#showimg" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#showimg" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>
            </td>
            <td class="profile">
                ${dto.ur_id}
            </td>
        </tr>
        <tr>
            <td class="fdcontent">
                <textarea class="inputtext" required="required" value="${dto.fd_txt}"></textarea>
            </td>
        </tr>
        <tr>
            <td class="fdcafe">
                <input onkeyup="filter()" type="text" class="inputtext" required="required" name="cf_id"
                       placeholder="카페 추가">
            </td>
        </tr>
        <tr>
            <td class="fdtag">
                <input onkeyup="filter()" type="text" class="inputtext" name="fg_nm" placeholder="태그 입력">
            </td>
        </tr>
    </table>
</div>
</body>

</html>