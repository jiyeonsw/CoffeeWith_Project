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

        .search {
            width: 30%;
            float: none;
            margin: auto;
        }

        .input-group-btn .btn{
            border: 1px solid lightgray;
            vertical-align: middle;
        }

        .feed {
            display: flex;
            width: 80%;
            padding-top: 50px;
            margin: auto;
            flex-direction: column;
        }

        .feed .idv{
            width: 25%;
            padding-top: 12px;
            padding-bottom: 12px;
        }

        .feed .idv img{
            width: 100%;
            padding: 5px 5px 5px 5px;
            cursor: pointer;
        }



    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
총 ${totalCount} 개의 게시물이 검색되었습니다

<div>
    <div class="search">
        <form class="input-group">
            <input type="text" class="form-control">
            <span class="input-group-btn">
                <button class="btn" type="button"><i class='fas fa-search' style='font-size:24px'></i></button>
            </span>
            <span class="input-group-btn">
            <a class="btn" id="btnform">
                <i class='far fa-plus-square' style='font-size:24px'></i></a>
            </span>
        </form>
    </div>
    <div class="feed">
        <div class="row">
            <div class="idv">
                <img src="${root}/images/logo1.png">
            </div>
            <div class="idv">
                <img src="${root}/images/logo1.png">
            </div>
            <div class="idv">
                <img src="${root}/images/logo1.png">
            </div>
            <div class="idv">
                <img src="${root}/images/logo1.png">
            </div>
        </div>
        <div class="row">
            <div class="idv">
                <img src="${root}/images/logo1.png">
            </div>
            <div class="idv">
                <img src="${root}/images/logo1.png">
            </div>
            <div class="idv">
                <img src="${root}/images/logo1.png">
            </div>
            <div class="idv">
                <img src="${root}/images/logo1.png">
            </div>
        </div>
    </div>
</div>
<div class="modal" id="modalform">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
        </div>
    </div>
</div>
<div class="modal" id="modaldetail">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
        </div>
    </div>
</div>
<script>
    $(".idv img").click(function (){
        $("#modaldetail").modal("toggle");
        $("#modaldetail .modal-content").load("form");
    })

    $("#btnform").click(function (){
        if(sessionStorage.getItem("loginid")!=null){
            alert("먼저 로그인후 글을 써주세요");
        }
        else {
            $("#modalform").modal("toggle");
            $("#modalform .modal-content").load("form");
        }
    })
</script>
</body>
</html>