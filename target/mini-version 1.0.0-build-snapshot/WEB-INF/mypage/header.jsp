<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CoffeeWithHeader</title>
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
            font-weight: bold;
            font-size: 30px;
        }

        #btnlogin {
            margin-left: 200px;
        }

        #loginstate {
            font-size: 15px;
            text-align: right;
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
            font-size: 20px;
        }

        li.main > a:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 로고 버튼 누르면 홈으로 -->
<c:set var="root" value="<%=request.getContextPath()%>"/>
<a href="${root}/" class="logotitle">
    <img src="${root}/images/logosimple.png" class="rounded-circle" width="40" height="40">
    <b> Coffee With </b></a>

<!-- 메뉴 구성 -->
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="menu">
    <ul>
        <!-- 1번째 메뉴 -->
        <li class="main"><a>홈페이지</a></li>
        <!-- 2번째 메뉴 -->
        <li class="main"><a href="${root}/map/mainmap">카페지도</a></li>
        <!-- 3번째 메뉴 -->
        <li class="main"><a href="${root}/comtour/list">투어모집</a></li>
        <!--4번째 메뉴 -->
        <li class="main"><a href="${root}/comfeed/main">커뮤니티</a></li>
    </ul>
</div>

<span id="loginstate" style="text-align: right;">

    <!-- 비로그인 상태일 때 -->
    <c:if test="${sessionScope.login_ok==null}">
        <!-- 로그인 폼 이동 -->
        <button type="button" class="btn btn-secondary btn-sm" id="btnlogin"
                onclick="location.href='${root}/user/login_main'">Login</button>
        <!-- 회원가입 폼 이동 -->
        <button type="button" class="btn btn-secondary btn-sm" id="signup-btn"
                onclick="location.href='${root}/user_form'">Sign Up</button>
        <%--        <!-- [임시] 세션주기 -->--%>
        <%--        <button type="button" class="btn btn-primary btn-sm" id="call-session-btn">세션주기</button>--%>
    </c:if>

    <!-- 로그인 실패한 상태일 때 -->
     <c:if test="${sessionScope.login_ok=='no'}">
         <!-- 로그인 폼 이동 -->
         <button type="button" class="btn btn-secondary btn-sm" id="btnlogin"
                 onclick="location.href='${root}/user/login_main'">Login</button>
         <!-- 회원가입 폼 이동 -->
         <button type="button" class="btn btn-secondary btn-sm" id="signup-btn"
                 onclick="location.href='${root}/user_form'">Sign Up</button>
         <%--         <!-- [임시] 세션주기 -->--%>
         <%--         <button type="button" class="btn btn-primary btn-sm" id="call-session-btn">세션주기</button>--%>
     </c:if>

    <!-- 로그인 성공한 상태일 때 -->
    <c:if test="${sessionScope.login_ok=='yes'}">
        <!-- 마이페이지 폼 이동 -->
        <button type="button" class="btn btn-secondary btn-sm" id="mypage-btn"
                onclick="location.href='${root}/mypage/bookmarks'">My Page</button>
        <!-- 로그아웃 -->
        <button type="button" class="btn btn-dark btn-sm" id="btnlogout"
                onclick="location.href='${root}/user/logout'">Logout</button>
        <%--        <!-- [임시] 세션제거 -->--%>
        <%--        <button type="button" class="btn btn-danger btn-sm" id="del-session-btn">세션제거</button>--%>
    </c:if>
</span>
<script>
    //세션주기
    $("#call-session-btn").click(function () {
        var root = '${root}';

        $.ajax({
            type: "get",
            url: root + "/user/call_session",
            dataType: "text",
            success: function (res) {
                location.reload();
            }
        })
    })

    //세션제거(루트)
    $("#del-session-btn").click(function () {
        var root = '${root}';
        $.ajax({
            type: "get",
            url: root + "/user/del_session",
            dataType: "text",
            success: function (res) {
                location.href = root;
            }
        })
    })
</script>
</body>
</html>