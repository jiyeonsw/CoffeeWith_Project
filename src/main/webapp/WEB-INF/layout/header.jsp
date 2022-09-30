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
    <style type="text/css">
        body * {
            font-family: 'Jua';
            color: #664400;
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
        }

        li.main > a:hover {
            cursor: pointer;
        }

        ul.submenu {
            margin-left: 0px;
            font-size: 14px;
            font-family: 'Jua';
            padding-left: 0px;
            margin-top: 15px;
        }

        ul.submenu > li > a {
            display: block;
            width: 180px;
            height: 20px;
        }

        ul.submenu > li:hover {
            cursor: pointer;
        }

        div.menu {
            color: #1a0d00;
            background-color: #cccccc
        }

        div.submenu {
            color: #1a0d00;
        }

    </style>
</head>
<body>
<!-- 로고 버튼 누르면 홈으로 -->
<c:set var="root" value="<%=request.getContextPath()%>"/>
<a href="${root}/" class="logo" style="font-size: 30px;">
    <img src="${root}/images/logo1.png" class="rounded-circle" width="40" height="40" align="top">
    <b> Coffee With </b></a>

<!-- 메뉴 구성 -->
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="menu">
    <ul>
        <!-- 1번째 메뉴 -->
        <li class="main">
            <a>메인페이지</a>
            <ul class="submenu">
                <li><a href="${root}/">홈페이지</a></li>
            </ul>
        </li>

        <!-- 2번째 메뉴 -->
        <li class="main">
            <a href="${root}/map/mainmap">카페지도</a>
            <ul class="submenu">
                <li>전체 카페 지도</li>
                <li>찜한 카페 지도</li>
            </ul>
        </li>

        <!-- 3번째 메뉴 -->
        <li class="main">
            <a>투어모집글</a>
            <ul class="submenu">
                <li>모임글 쓰기</li>
                <li>모임글 목록</li>
            </ul>
        </li>

        <!--4번째 메뉴 -->
        <li class="main">
            <a>정보공유글</a>
            <ul class="submenu">
                <li>정보글 쓰기</li>
                <li>정보글 목록</li>
            </ul>
        </li>
    </ul>
</div>


<!-- 로그인 로그아웃 -->
<span id="loginstate" style="text-align: right;">
    <c:if test="${sessionScope.loginok==null}">
        <button type="button" class="btn btn-secondary btn-sm" id="btnlogin"
                data-bs-toggle="modal" data-bs-target="#myModal">Login</button>
        <button type="button" class="btn btn-secondary btn-sm" id="signup-btn"
                onclick="location.href='user_form'">Sign Up</button>
    </c:if>

    <c:if test="${sessionScope.loginok!=null}">
        <b>${sessionScope.loginname}님</b> &nbsp;
        <button type="button" class="btn btn-info btn-sm" id="btnlogout">Logout</button>
    </c:if>
</span>


<!-- 로그인창 -->
<div class="modal" id="myModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">회원 로그인 해주세요</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>

            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="input-group mb-3 input-group-sm">
                    <span class="input-group-text">LoginId</span> <input type="text"
                                                                         class="form-control" id="loginid">
                </div>
                <div class="input-group mb-3 input-group-sm">
                    <span class="input-group-text">LoginPass</span> <input
                        type="password" class="form-control" id="loginpass">
                </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-success"
                        data-bs-dismiss="modal" id="btnloginok">Login
                </button>
                <button type="button" class="btn btn-danger"
                        data-bs-dismiss="modal">Close
                </button>
            </div>
        </div>
    </div>
</div>

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