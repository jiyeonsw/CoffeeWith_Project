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

<form name="mForm" method="post" action="submit_find_id">
    <div id="container" class="container">
        <p class="titid">아이디 찾기</p>
        <p>회원정보에 등록된 정보로 아이디를 찾을 수 있습니다.</p>
        <br>
        <fieldset>
            <div class="inp-frm">
                <label for="ur_nm" class="titLab">이름을 입력해주세요</label>
                <div class="inpA">
                    <input id="ur_nm" placeholder="ex) 홍길동" class="form-control"
                           required="required" name="ur_nm">
                </div>
                <div class="id-success"></div>
            </div>
            <br>
            <%--        인증번호 입력폼 1--%>
            <div class="inp-frm">
                <button type="submit" id="btn-submit" class="btn btn-outline-info">
                    아이디 찾기</button>
            </div>
            <br><br>
            <c:if test="${not empty param.email}">
                <div>
                    이메일 아이디를 찾았습니다:
                    <div class="alert alert-info" role="alert">
                            ${param.email}
                    </div>
                </div>
            </c:if>
        </fieldset>
    </div>
    </div>
</form>
</body>
</html>
