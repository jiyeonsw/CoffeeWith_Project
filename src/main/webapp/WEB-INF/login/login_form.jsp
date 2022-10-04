<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LoginForm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style>
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        #page-title {
            font-size: 25px;
        }

        body * {
            font-family: 'GangwonEdu_OTFBoldA';
            font-size: 20px;
            color: #664400;
        }

        #main {
            text-align: center;
            padding-top: 30px;
        }
    </style>
</head>

<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<main id="main" class="main">
    <div class="page-title">로그인 하시고<br>즐거운 커윗해요</div>
    <br>
    <!--
      <input type="hidden" id="bookType" value="">
          <form id="frm" action="/member/auth/loginAction.do" method="post">
              <input type="hidden" name="apiRequestType" id="apiRequestType">
              <input type="hidden" name="targetUrl" id="targetUrl" value="">
              <input type="hidden" name="nonTargetUrl" id="nonTargetUrl" value="">
              <input type="hidden" name="security" id="security" value="">
              <input type="hidden" name="snsType" id="snsType">
              <input type="hidden" name="snsId" id="snsId">
              -->

    <div class="login-input-area">
        <div class="input-row">
            <div id="idAreaForm" data-element="form" class="input">
                <input type="text" data-element="input" id="userId" name="userId" class="input-text"
                       tabindex="1" placeholder="아이디" style="width: 200px;">
            </div>
            <br>
            <div class="input-row input-row--password">
                <div id="pwAreaForm" data-element="form" class="input ">
                    <input type="password" data-element="input" id="userPwd" name="userPwd" class="input-text"
                           tabindex="1" placeholder="비밀번호" style="width: 200px;">
                </div>
                <!-- 등록되지 않은 아이디 or 아이디/비밀번호 불일치 시 -->
                <p tabindex="0" id="pwErrorArea" class="input-error"></p>
            </div>
        </div>
        <div class="button-login">
            <button type="button" class="btn btn-secondary" style="width: 200px;">로그인</button><br>
            <br>
            <button type="button" class="button button--option" data-action="snsNaverLogin"><span class="button-text">네이버 간편로그인</span>
            </button>
            <br>
            <button type="button" class="button button--option" data-action="snsKakaoLogin"><span class="button-text">카카오 간편로그인</span>
            </button>
        </div>
    </div>
    <br>

    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <div class="link-wrap">
        <!--하단에 회원가입 및 아이디 비밀번호 찾기 -->
        <a href="user_form">회원가입하기</a><br>
        <a href="${root}/user/find_id">아이디 찾기</a><br> <!-- Find ID  -->
        <a href="${root}/user/find_pw">비밀번호 찾기</a> <!-- Find PW  -->
    </div>
</main>


</body>
</html>
