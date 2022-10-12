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
            font-weight: bolder;
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
            <a href="${root}/map/mainmap">카페지도</a>
        </li>

        <!-- 3번째 메뉴 -->
        <li class="main">
            <a href="${root}/comtour/list">투어모집</a>
        </li>

        <!--4번째 메뉴 -->
        <li class="main">
            <a href="${root}/comfeed/main">커뮤니티</a>
        </li>
    </ul>
</div>

<span id="loginstate" style="text-align: right;">
    <c:if test="${sessionScope.login_ok==null}">
        <!-- 로그인으로 이동  -->
        <button type="button" class="btn btn-secondary btn-sm" id="btnlogin"
                onclick="location.href='${root}/login_main'">Login</button>

        <!-- 회원가입으로 이동 -->
        <button type="button" class="btn btn-secondary btn-sm" id="signup-btn"
                onclick="location.href='${root}/user_form'">Sign Up</button>

        <!-- [임시] 세션주기 -->
        <button type="button" class="btn btn-primary btn-sm" id="call-session-btn">세션주기</button>
    </c:if>

    <!-- 로그인 값 있을 경우, 닉네임 login_nick 이름 ur_nm 보임 -->
    <c:if test="${sessionScope.login_ok!=null}">

        <b>${sessionScope.login_nick} 님  </b>
        <!-- 마이페이지로 이동 -->
        <button type="button" class="btn btn-secondary btn-sm" id="mypage-btn"
                onclick="location.href='${root}/mypage/bookmarks'">My Page</button>

        <!-- 로그아웃 / 검정버튼 -->
        <button type="button" class="btn btn-dark btn-sm" id="btnlogout"
                onclick="location.href='${root}/login/login_form'">Logout</button>

        <!-- [임시] 세션제거 -->
        <button type="button" class="btn btn-danger btn-sm" id="del-session-btn">세션제거</button>
    </c:if>
</span>

<%--<script>--%>
    <%--$(function (){--%>
    <%--    var login_ok = "${sessionScope.login_ok}"--%>
    <%--    if (login_ok == "yes") {--%>
    <%--        alert("로그인 되었습니다");--%>
    <%--    }--%>
    <%--});--%>
    <%--$(function (){--%>
    <%--    var login_fail = "${sessionScope.login_fail}"--%>
    <%--    if (login_fail == "yes") {--%>
    <%--        alert("아이디 또는 비밀번호를 다시 확인해주세요");--%>
    <%--    }--%>
    <%--});--%>
<%--</script>--%>

<!-- 로그인 스크립트 이벤트 -->
<%--<script type="text/javascript">--%>

<%--    console.log('hit1')--%>
<%--    // 팝업창에 있는 로그인 버튼--%>
<%--    $("#btnlogin").click(function(){--%>
<%--        // 아이디와 비번 읽기--%>
<%--        console.log("hit");--%>
<%--        var id=$("#email_id").val();--%>
<%--        var pass=$("#ur_pw").val();--%>
<%--        var root='${root}';--%>

<%--        console.log("root"+root);--%>
<%--        console.log(id,pass);--%>

<%--        $.ajax({--%>
<%--            type:"post",--%>
<%--            url:root+"/user/login",--%>
<%--            dataType:"json",--%>
<%--            data:{"email_id":id, "ur_pw":pass},--%>
<%--            success:function(res){--%>
<%--                // if(res.result=='fail'){--%>
<%--                if(res.result==null){--%>
<%--                    alert("아이디 또는 비밀번호를 다시 확인해주세요");--%>
<%--                }else{--%>
<%--                    alert("로그인 되었습니다");--%>
<%--                    location.reload();--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>

<%--    // 로그아웃--%>
<%--    $("#btnlogout").click(function(){--%>
<%--        var root='${root}';--%>

<%--        $.ajax({--%>
<%--            type:"get",--%>
<%--            url:root+"/user/logout",--%>
<%--            dataType:"text",--%>

<%--            success:function(res){--%>
<%--                location.reload();--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>

<%--</script>--%>

<%--<script>--%>
<%--    $('#mForm button[type=submit]').click(function(e){--%>
<%--        e.preventDefault();--%>

<%--        let id = $('#email_id').val();--%>
<%--        let pass = $('#ur_pw').val();--%>

<%--        $.ajax({--%>
<%--            url: "../layout/main.jsp",--%>
<%--            data:{"email_id":id, "ur_pw":pass},--%>
<%--            type: "POST",--%>
<%--            dataType: "json",--%>
<%--            success: function(data){--%>
<%--                if(data.succ)--%>
<%--                    alert("로그인 성공");--%>
<%--                else--%>
<%--                    alert("로그인 실패");--%>
<%--            },--%>
<%--            error: function(err){--%>
<%--                alert(err);--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>


<%--$.ajax({--%>
<%--type:"post",--%>
<%--// url:root+"/login",--%>
<%--url:root+"/user/login",--%>
<%--dataType:"json",--%>
<%--data:{"email_id":id, "ur_pw":pass},--%>
<%--success:function(res){--%>
<%--if(res.result=='fail'){--%>
<%--alert("아이디나 비번이 맞지 않습니다");--%>
<%--}else{--%>
<%--location.reload();--%>
<%--}--%>
<%--}--%>

</body>
</html>