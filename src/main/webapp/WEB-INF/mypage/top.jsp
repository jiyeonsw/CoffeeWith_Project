<%--
  Created by IntelliJ IDEA.
  User: ian
  Date: 2022-10-02
  Time: 오후 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffeewith</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <style>

        .user-profill-box {
            display: grid;
            position: relative;
            grid-template-columns: 80px 1.5fr;
            gap: 0px 10px;
            align-items: center;
        }

        .img-area {
            display: block;
            position: relative;
            width: 80px;
            height: 80px;
        }

        .box-type-01 {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            margin: 24px 0;
            padding: 30px 0;
            border-radius: 8px;
            background: #f4f9ff;
            justify-items: center;
        }

        .top-container div {
            border: 1px solid gray;
        }

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="top-container">
    <div class="user-profill-box">
        <%--이미지 클릭하면 회원정보 변경으로 이동(예정)--%>
        <a href="#" class="img-area">
            <img src="" alt>
        </a>
        <div class="txt-area">
            <h2 class="tit-dep2 nick">&nbsp;${sessionScope.login_nick} 님 환영합니다!</h2>
        </div>
    </div>
    <div class="box-type-01">
        <a href="#" class="inner">
            <div class="txt book-marks">
                북마크
                <span class="num">${sessionScope.cfLkCnt}</span>
            </div>
        </a>
        <a href="#" class="inner">
            <div class="txt cf-tr">
                작성한 리뷰
                <span class="num">${sessionScope.cfCmtCnt}</span>
            </div>
        </a>
        <a href="#" class="inner">
            <div class="txt join-tr">
                참여중인 투어
                <span class="num"></span>
            </div>
        </a>
        <a href="#" class="inner">
            <div class="txt before-tr">
                지난 투어내역
                <span class="num"></span>
            </div>
        </a>
    </div>
</div>
</body>
</html>
