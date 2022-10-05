<%--
  Created by IntelliJ IDEA.
  User: ian
  Date: 2022-10-03
  Time: 오후 5:36
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
        .bk_container div, .bk_container img {
            border: 1px solid gray;
        }

        .bk_container {
            display: grid;
            padding: 40px 20px 20px;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            gap: 20px 0px;
            justify-items: center;
        }

        .bk-card {
            width: 150px;
            overflow: hidden;
        }

        .bk-ci-nm {
            width: 100%;
            height: 194px;
            border-radius: 4px;
            background: 50% 50% no-repeat;
            background-size: cover;
            object-fit: cover;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
            margin-bottom: 10px;

        }

        .bk_container h5 {
            margin-bottom: 0rem;
        }

        .bk-cf-addr {
            font-size: 13px;
        }

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<%--bookmark == bk--%>
<div class="bk_container">
    <c:forEach var="dto" items="${list}">
        <div class="bk-card">
            <div class="bk-ci-nm" style="background-image:url('${root}/images/cafeimg/2카페_1.jpg')">
            </div>
            <div class="bk-txt-area">
                <h5 class="bk-cf-nm">${dto.cf_nm}</h5>
                <span class="bk-cf-addr">${dto.loc_addr}</span>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
