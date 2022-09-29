<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Lobster&family=Rubik+Beastly&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style type="text/css">
        body * {
            font-family: 'THE하늘색바람';
        }

        div.mainlayout1 {
            display: block;
            width: 1000px;
            position: relative;
            margin: 0 auto
        }

        #header {
            overflow: hidden;
            width: 1000px;
            height: 300px;
        }

        #main {
            width: 100%;
        }

    </style>
</head>
<body>
<div class="mainlayout1">

    <div class="main" id="header">
        <tiles:insertAttribute name="header"/>
    </div>
    <div class="main" id="menu">
        <tiles:insertAttribute name="menu"/>
    </div>
    <div style="display: flex;">
        <div class="main" id="info" style="width: 280px; height: 600px;align-self: flex-start;">
            <tiles:insertAttribute name="info"/>
        </div>
        <div class="main" id="main">
            <tiles:insertAttribute name="main"/>
        </div>
    </div>
</div>
</body>
</html>