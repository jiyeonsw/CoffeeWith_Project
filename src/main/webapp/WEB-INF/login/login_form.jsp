<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
<%--    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">--%>
    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Naver API 버전 에러 주의 -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <!-- Kakao API -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <title>Login Page</title>

    <style>
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        .loginmain {
            width: 450px;
            margin: 0 auto;
            padding-top: 64px;
            text-align: left;
        }
        .titlogin {
            margin-bottom: 32px;
            font-size: 2.6rem;
            line-height: 1.3;
            font-weight: 900;
            text-align: center;
        }
        .btn btn-secondary {
            width: 450px;
            text-align: center;
        }
        .findlink {
            text-align: center;
            font-size: 18.5px;
            color: #666699;
        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<div id="loginmain" class="loginmain">
    <p class="titlogin">로그인</p>
    <p>♥ 로그인 하시고 카페지도부터 투어모집까지 커피위드를 즐겨보세요 ♥</p>
    <br>
    <!-- LoginController : user/login_main // header : login -->
    <form name="mForm" method="post" action="login" >

        <label for="email_id" class="titLab">아이디</label>
        <input type="text" name="email_id" id="email_id" placeholder="공백 없이 입력해주세요" class="form-control" required="required">
        <br>
        <label for="ur_pw" class="titLab">비밀번호</label>
        <input type="password" name="ur_pw" id="ur_pw" placeholder="비밀번호를 입력해주세요" class="form-control" required="required">
        <br>
        <!-- 기본형 로그인 버튼 -->
        <button type="submit" class="btn btn-outline-secondary" id="btn-loginok" style="width: 450px;">로그인</button><br>
        <br>
        <label for="email_id" class="titLab">SNS 간편 로그인</label><br>
        <!-- 카카오 로그인 버튼 -->
        <a href="javascript:kakaoLogin();">
            <img src="${root}/images/login_kakao.png" alt="카카오계정 로그인" style="width: 220px; height: 40px;"/></a>&nbsp;
        <!-- 네이버 로그인 버튼 -->
        <a onclick="naverLogin()"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>

        <%-- 등록되지 않은 아이디 or 아이디/비밀번호 불일치 시 --%>
        <%-- <p tabindex="0" id="pwErrorArea" class="input-error"></p>--%>
    </form>
</div>
<br>
<br>
<!-- 회원가입 및 아이디 비밀번호 찾기 -->
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="findlink">
    <i class="fa fa-search" style="font-size:18px;"></i>&nbsp;&nbsp;
    <a href="${root}/user/find_id">아이디 찾기</a><br> <!-- login/findID -->

    <i class="fa fa-search" style="font-size:18px;"></i>&nbsp;&nbsp;
    <a href="${root}/user/find_pw">비밀번호 찾기</a><br> <!-- login/findPW -->

    <i class="fa fa-coffee" style="font-size:18px;"></i>&nbsp;&nbsp;
    <a href="${root}/user/intro">커윗 알아보기</a><br> <!-- layout/introduction -->

    <i class="fa fa-user" style="font-size:20px;"></i>&nbsp;&nbsp;
    <a href="${root}/user_form">회원 가입하기</a><br> <!-- user/userForm -->
</div>
<!-- 기본 로그인 스크립트 이벤트 -->
<script type="text/javascript">
    $(function (){
        var login_ok = "${sessionScope.login_ok}"
        if (login_ok == "yes") {
            alert("로그인 되었습니다");
        }
        <!-- 로그인 페이지 내부에서, 로그인 실패할 경우 -->
        if (login_ok == "no") {
            alert("아이디 또는 비밀번호를 다시 확인해주세요");
        }
    });
</script>
<%--Naver Login 개인정보 노출금지--%>
    <script type="text/javascript">
        function naverLogin() {
            const url = new URL("https://nid.naver.com/oauth2.0/authorize");
            url.searchParams.append("redirect_uri", "https://ff88-221-147-38-46.jp.ngrok.io/mini/user/naver_callback");
            url.searchParams.append("client_id", "4mIUzgdcLi_AnfbYvRiW");
            url.searchParams.append("state", "RANDOM_STATE");
            url.searchParams.append("response_type", "code");
            window.location.href = url.href
        }
</script>
</body>
</html>