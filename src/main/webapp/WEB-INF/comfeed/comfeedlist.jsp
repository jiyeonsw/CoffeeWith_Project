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
            border: 1px solid #f1f1f1;
            border-radius: 25px;
        }

        .ctg{
            width: 60%;
            margin: 15px 20% 0 20%;
            display: flex;
            flex-direction: column;
        }

        .ctg .ctg1{
            margin: auto;
            margin-bottom: 10px;
        }

        .ctg .ctg2{
            margin: auto;
        }

        .ctg .ctg-box{
            border: 1px solid #f1f1f1;
            padding: 5px;
            border-radius: 25px;
            font-size: 15px;
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
    <div class="ctg">
        <div class="ctg1">
            <button class="ctg-box" value="디저트카페">#디저트카페</button>
            <button class="ctg-box" value="서울카페">#서울카페</button>
            <button class="ctg-box" value="감성카페">#감성카페</button>
            <button class="ctg-box" value="브런치카페">#브런치카페</button>
            <button class="ctg-box" value="인천카페">#인천카페</button>
            <button class="ctg-box" value="오션뷰카페">#오션뷰카페</button>
        </div>
        <div class="ctg2">
            <button class="ctg-box" value="차맛집">#차맛집</button>
            <button class="ctg-box" value="부산카페">#부산카페</button>
            <button class="ctg-box" value="한강카페">#한강카페</button>
            <button class="ctg-box" value="공항근처카페">#공항근처카페</button>
            <button class="ctg-box" value="대구카페">#대구카페</button>
            <button class="ctg-box" value="베이커리카페">#베이커리카페</button>
            <button class="ctg-box" value="제주카페">#제주카페</button>
        </div>
    </div>
    <div class="suggestions-cap"></div>
    <div class="suggestions-container">
        <ul class="suggestions-list"></ul>
    </div>
</div>
<div class="feedmenu">
    <a type="button" class="btn" id="btnrank"><i class="bi bi-trophy"></i></a>
    <a type="button" class="btn" id="btnform"><i class="bi bi-plus-square"></i></a>
    <a type="button" class="btn" id="btnmain" onclick="location.reload()"><i class="bi bi-house-door"></i></a>
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

    $("#btnrank").click(function (){

        $.ajax({
            type:"get",
            url:"toplist",
            dataType:"json",
            success: function (res){
                $(".feed").empty();
                var s="<div class='row'>";

                $.each(res, function(i, item){
                    s+="<div class='idv'>";
                    s+="<img src='${root}/images/upload/"+item.fd_photo.split(",")[0]+"' value='"+item.fd_id+"'>";
                    s+="<div class='textcenter'><i class='fas fa-heart'></i>&nbsp;&nbsp;"+item.likes;
                    s+="</div></div>";
                    if(i%4==3){
                        s+="</div><div class='row'>";
                    }
                })
                s+="</div>"

                $(".feed").append(s);
            }
        })
    })
    $(document).on('click','.idv img', function (){
        var fd_id = $(this).attr("value");
        $("#modaltmp").modal("show");
        $("#modaltmp .modal-content").load("detail?fd_id=" + fd_id);
    })

    $(document).on('mouseover','.idv img', function (){
        imgsrc = $(this).attr("src");
        $(this).css("opacity","0.5");
        $(this).parent().find(".textcenter").css("display","initial")
    })

    $(document).on('mouseout','.idv img', function (){
        $(this).css("opacity","1");
        $(this).parent().find(".textcenter").css("display","none")
    })

    $(".ctg-box").click(function (){
        $(this).parents().find(".ctg-box").css({"background-color":"buttonface","color":"#664400"})
        $(this).css({"background-color":"#664400","color":"white"})

        cg_nm = $(this).attr("value");

        $.ajax({
            type: "get",
            data: {"cg_nm":cg_nm},
            url: "feedctg",
            dataType: "json",
            success: function (res){
                $(".feed").empty();

                if(res==""){
                    $(".feed").html("<h2 style='text-align: center'>찾으시는 게시물이 없습니다</h2>")
                }

                var s="<div class='row'>";

                $.each(res, function(i, item){
                    s+="<div class='idv'>";
                    s+="<img src='${root}/images/upload/"+item.fd_photo.split(",")[0]+"' value='"+item.fd_id+"'>";
                    s+="<div class='textcenter'><i class='fas fa-heart'></i>&nbsp;&nbsp;"+item.likes;
                    s+="</div></div>";
                    if(i%4==3){
                        s+="</div><div class='row'>";
                    }
                })
                s+="</div>"

                $(".feed").append(s);
            }
        })
    })

</script>
</body>
</html>
