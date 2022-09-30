<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
          rel="stylesheet">
    <style type="text/css">
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body * {
            font-family: 'GangwonEdu_OTFBoldA';
            color: #664400;
        }

        .logotitle {
            font-family: 'GangwonEdu_OTFBoldA';
            font-style: oblique;
            font-weight: bolder;
        }

        #btnlogin {
            margin-left: 200px;
        }

        #loginstate {
            font-size: 15px;
            text-align: right;
        }

        div.menu {
            color: #1a0d00;
            background-color: #cccccc
        }

        ul li {
            list-style: none;
        }

        li.main {
            float: left;
        }

        li.main > a {
            display: block;
            width: 180px;
            font-family: 'Jua';
        }

        li.main > a:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 로고 버튼 누르면 홈으로 -->
<c:set var="root" value="<%=request.getContextPath()%>"/>
<a href="${root}/" class="logotitle" style="font-size: 30px;">
    <img src="${root}/images/logo1.png" class="rounded-circle" width="40" height="40">
    <b> Coffee With </b></a>

<!-- 메뉴 구성 -->
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="menu">
    <ul>
        <!-- 1번째 메뉴 -->
        <li class="main">
            <a>홈페이지</a>
        </li>

        <!-- 2번째 메뉴 -->
        <li class="main">
            <a>카페지도</a>
        </li>

        <!-- 3번째 메뉴 -->
        <li class="main">
            <a>투어모집</a>
        </li>

        <!--4번째 메뉴 -->
        <li class="main">
            <a>커뮤니티</a>
        </li>
    </ul>
</div>

<!-- 로그인 로그아웃 -->
<span id="loginstate" ; style="text-align: right;">
    <c:if test="${sessionScope.loginok==null}">
        <button type="button" class="btn btn-secondary btn-sm" id="btnlogin"
                onclick="location.href='login_main'">Login</button>
        <button type="button" class="btn btn-secondary btn-sm" id="signup-btn"
                onclick="location.href='user_form'">Sign Up</button>
    </c:if>

    <c:if test="${sessionScope.loginok!=null}">
        <b>${sessionScope.loginname}님</b> &nbsp;
        <button type="button" class="btn btn-info btn-sm" id="btnlogout">Logout</button>
    </c:if>
    </span>


<!-- 스크립트 이벤트 -->
<script type="text/javascript">

    // 팝업창에 있는 로그인 버튼
    $("#btnloginok").click(function () {
        // 아이디와 비번 읽기
        var id = $("#loginid").val();
        var pass = $("#loginpass").val();
        var root = '${root}';
        console.log("root" + root);

        $.ajax({
            type: "get",
            url: root + "/member/login",
            dataType: "json",
            data: {"id": id, "pass": pass},
            success: function (res) {
                if (res.result == 'fail') {
                    alert("아이디나 비번이 맞지 않습니다");
                } else {
                    location.reload();
                }
            }
        });
    });

    // 로그아웃
    $("#btnlogout").click(function () {
        var root = '${root}';

        $.ajax({
            type: "get",
            url: root + "/member/logout",
            dataType: "text",

            success: function (res) {
                location.reload();
            }
        });
    });
</script>
</body>
</html>