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
    </style>
</head>
<body>
<div class="cmt-container">
    <c:forEach var="dto" items="${list}">
        <c:set var="i" value="0"/>
        <c:if test="${i<dto.star}">
            <div>
                    <span class="cm-star" style="color: yellow">
            <c:forEach var="starfor" begin="${i+1}" end="${dto.star}">
                ★
            </c:forEach>
                    </span>
            </div>
        </c:if>
        <c:if test="${dto.star==0}">
            <div>
                <span class="cm-star" style="color: lightgray">
                    ★ ★ ★ ★ ★
                </span>
            </div>
        </c:if>
    </c:forEach>
</div>
<script>

</script>
</body>
</html>
