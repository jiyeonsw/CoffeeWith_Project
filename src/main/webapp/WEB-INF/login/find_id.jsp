<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <title>Find ID</title>

    <style>
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .container {
            width: 450px;
            margin: 0 auto;
            padding-top: 64px;
            text-align: left;
        }
        .titid {
            margin-bottom: 32px;
            font-size: 2.6rem;
            line-height: 1.3;
            font-weight: 900;
            text-align: center;
        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<div id="container" class="container">
    <p class="titid">아이디 찾기</p>
    <p>회원정보에 등록된 정보로 아이디를 찾을 수 있습니다.</p>
    <br>
    <fieldset>
        <div class="inp-frm">
            <label for="inp-name" class="titLab">이름</label>
            <div class="inpA">
                <input type="email" id="inp-name" placeholder="특수문자 없이 입력해주세요" class="form-control"
                       required="required" name="email_id">
            </div>
            <div class="id-success"></div>
        </div>
        <br>
        <div class="inp-frm">
            <label for="inp-pass" class="titLab">비밀번호</label>
            <div class="inpB">
                <input type="password" id="inp-pass" placeholder="영문,숫자,특수문자 8~16자이내" class="form-control"
                       required="required" name="ur_pw">
            </div>
            <div class="pass-success"></div>
        </div>
        <br>
        <div class="inp-frm">
            <label for="inp-repass" class="titLab">비밀번호 확인</label>
            <div class="inpB">
                <input type="password" id="inp-repass" placeholder="확인을 위해 한번 더 입력해주세요" class="form-control"
                       required="required">
            </div>
            <div class="repass-success"></div>
        </div>
        <br>

        <div class="inp-frm">
            <label for="inp-email" class="titLab">이메일</label>
            <div class="inpA">
                <input type="email" id="inp-email" placeholder="example@coffewith.com" class="form-control"
                       required="required" name="email_id">
            </div>
            <div class="id-success"></div>
        </div>
        <br>
<%--        인증번호 입력폼 1--%>
        <div class="inp-frm">
            <button type="button" id="btn-id-chk" class="btn btn-outline-info">
                본인 확인 이메일 전송</button>

                <input type="password" id="oknum" placeholder="이메일에 전송된 인증번호를 5분 이내로 입력해주세요" class="form-control"
                       required="required">
        </div>
        <br>
        <button type="submit" id="inp-btn" class="btn btn-primary btnB">본인 인증이 완료되었습니다</button>
    </fieldset>
</div>
</div>

</body>
</html>
