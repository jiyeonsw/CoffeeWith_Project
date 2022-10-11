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
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
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

        .loginbutton {
            width: 450px;
            text-align: center;
        }

        .findlink {
            text-align: center;
            font-size: 18px;
        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!-- Form 연결 -->

    <div id="loginmain" class="loginmain">
    <p class="titlogin">로그인</p>
    <p>♥ 로그인 하시고 카페지도부터 투어모집까지 커피위드를 즐겨보세요 ♥</p>
    <br>
    <fieldset>
        <div class="inp-frm">
            <label for="email_id" class="titLab">아이디</label>
            <div class="inpA">
                <input type="email" id="email_id" placeholder="공백 없이 입력해주세요" class="form-control"
                       required="required" name="email_id">
            </div>
            <div class="id-success"></div>
        </div>
        <br>
        <div class="inp-frm">
            <label for="ur_pw" class="titLab">비밀번호</label>
            <div class="inpB">
                <input type="password" id="ur_pw" placeholder="비밀번호를 입력해주세요" class="form-control"
                       required="required" name="ur_pw">
            </div>
            <div class="pass-success"></div>
                  <!-- 등록되지 않은 아이디 or 아이디/비밀번호 불일치 시 -->
                  <p tabindex="0" id="pwErrorArea" class="input-error"></p>
        </div>
        <br>
        <!-- 로그인 및 간편로그인 -->
        <div class="loginbutton">
            <button id="loginbutton" type="submit" class="btn btn-secondary">로그인</button> <br><br>
<%--            로그인에 실패하면, 로그인 페이지 제자리 --%>
<%--            로그인에 성공하면, 메인 페이지로 이동--%>

<%--            <a href="${root}/" id="kakaoLogin">--%>
<%--                <img src="${root}/images/kakao_login.png" alt="카카오계정 로그인"/></a>--%>
            <br>
<%--            <button type="button" class="loginnaver" data-action="snsNaverLogin"><span class="button-text">네이버 간편로그인 버튼</span>--%>
<%--            </button>--%>
            <br><br>
        </div>
    </fieldset>

    <hr>
    <!-- 회원가입 및 아이디 비밀번호 찾기 -->
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <div class="findlink">
        <a href="user_form">회원가입하기</a><br>
        <a href="${root}/user/find_id">아이디 찾기</a><br> <!-- Find ID page -->
        <a href="${root}/user/find_pw">비밀번호 찾기</a> <!-- Find PW page -->
    </div>
    </div>


<!-- 로그인 스크립트 이벤트 -->
<script type="text/javascript">
    console.log('hit1')
    // 팝업창에 있는 로그인 버튼
    $("#loginbutton").click(function(){
        // 아이디와 비번 읽기
        console.log("hit");
        var id=$("#email_id").val();
        var pass=$("#ur_pw").val();
        var root='${root}';
        console.log("root"+root);
        console.log(id,pass);

        $.ajax({
            type:"post",
            url:root+"/user/login",
            dataType:"json",
            data:{"email_id":id, "ur_pw":pass},
            success:function(res){
                if(res.result=='fail'){
                    alert("아이디나 비번이 맞지 않습니다");
                }else{
                    location.reload();
                }
            }
        });
    });

    // 로그아웃
    $("#logoutbutton").click(function(){
        var root='${root}';

        $.ajax({
            type:"get",
            url:root+"/user/logout",
            dataType:"text",

            success:function(res){
                location.reload();
            }
        });
    });
</script>
</body>
</html>
