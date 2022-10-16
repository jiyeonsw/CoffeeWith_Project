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

<%--<form action="  " method="post" onsubmit="return check()">--%>

<form name="mForm" method="post" action="submit_find_pw">
    <div id="container" class="container">
        <p class="titid">비밀번호 찾기</p>
        <p>회원정보에 등록된 정보로 비밀번호를 찾을 수 있습니다.</p>
        <br>
        <fieldset>
            <div class="inp-frm">
                <label for="inp_email" class="titLab">이메일</label>
                <div class="inpA">
                    <input type="email" id="inp_email" placeholder="ex) coffeewith@gmail.com" class="form-control"
                           required="required" name="email_id">
                </div>
            </div>
        </fieldset>
        <br>
        <div class="inp-frm">
            <button type="submit" id="btn-id-chk" class="btn btn-outline-success">
                비밀번호 앞자리 확인</button>
        </div>
        <br><br>
        <c:if test="${not empty param.pw}">
            <div>
                비밀번호를 찾았습니다:
                <div class="alert alert-success" role="alert">
                        ${param.pw}
                </div>
            </div>
        </c:if>
    </div>
    </div>
</form>

</body>
</html>