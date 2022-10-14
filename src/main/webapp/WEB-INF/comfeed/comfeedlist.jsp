<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffeewith</title>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="../res/css/style.css" type="text/css">

    <style type="text/css">

        .search {
            margin-top: 30px;
        }

        .search-bar {
            margin: auto;
            width: 30%;
            vertical-align: middle;
        }

        .search-bar input {
            width: 100%;
            text-align: center;
        }

        .feedmenu {
            width: 90%;
            margin: auto;
        }

        .feedmenu a {
            float: right;
            height: 30px;
        }

        .feedmenu i {
            font-size: 30px;
            padding: 0;
        }

        .feed {
            width: 90%;
            padding-top: 20px;
            margin: auto;
            flex-direction: column;
        }

        .feed .row .idv {
            position: relative;
            text-align: center;
            height: 20vw;
            width: 25%;
            padding-top: 12px;
            padding-bottom: 12px;
        }

        .feed .idv img {
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
            text-align: center;
        }

        .feed .idv .textcenter{
            position: absolute;
            top: 50%;
            left: 45%;
            display: none;
        }

        div .closemodal{
            position: absolute;
            top: 5px;
            right: 5px;
            cursor: pointer;
        }

    </style>
</head>
<body>

<div class="search">
    <div class="search-bar">
        <input type="text" style="font-family: bootstrap-icons" placeholder="&#xF52A;검색">
    </div>
    <div class="suggestions-cap"></div>
    <div class="suggestions-container">
        <ul class="suggestions-list"></ul>
    </div>
    <br>
</div>
<div class="feedmenu">
    <a type="button" class="btn" id="btnrank"><i class="bi bi-trophy"></i></a>
    <a type="button" class="btn" id="btnform"><i class="bi bi-plus-square"></i></a>
</div>
<br>

<c:if test="${totalCount==0}">
    <h4>등록된 글이 없습니다</h4>
</c:if>
<c:if test="${totalCount>0}">
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <div class="feed">
        <div class="row">
            <c:forEach var="dto" varStatus="i" items="${list}">
                <div class="idv">
                    <img src="${root}/images/upload/${dto.fd_photo.split(",")[0]}" value="${dto.fd_id}">
                    <div class="textcenter">
                        <i class='fas fa-heart'></i>&nbsp;&nbsp;${dto.likes}
                    </div>
                </div>
                <c:if test="${i.index%4==3}">
                    </div><div class="row">
                </c:if>
            </c:forEach>
        </div>
    </div>
</c:if>

<div class="modal" id="modaltmp">
    <div class="closemodal" data-bs-dismiss="modal">
        <i class="material-icons" style="font-size:36px">close</i>
    </div>
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
        </div>
    </div>
</div>

<script>
    var login_ok = "<%=(String)session.getAttribute("login_ok")%>"

    $(".idv img").click(function () {
        var fd_id = $(this).attr("value");
        $("#modaltmp").modal("show");
        $("#modaltmp .modal-content").load("detail?fd_id=" + fd_id);
    })

    $("#btnform").click(function () {
        if (login_ok !== "yes") {
            alert("로그인을 먼저 해주세요")
        } else {
            $("#modaltmp").modal("show");
            $("#modaltmp .modal-content").load("form");
        }
    })

    $(".search-bar input").keyup(function (event) {
        if (event.keyCode === 13) {
            $(this).submit();
        }
    })

    var imgsrc="";

    $(".idv img").mouseover(function (){
        imgsrc = $(this).attr("src");
        $(this).css("opacity","0.5");
        $(this).parent().find(".textcenter").css("display","initial")
    })

    $(".idv img").mouseout(function (){
        $(this).css("opacity","1");
        $(this).parent().find(".textcenter").css("display","none")
    })

</script>
</body>
</html>
