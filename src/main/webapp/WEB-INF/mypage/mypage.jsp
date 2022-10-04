<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
          rel="stylesheet">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <title>CofeeWith</title>

    <style type="text/css">
        body * {
            font-family: 'Jua';
        }

        .main-mypage {
            display: grid;
            width: 1136px;
            grid-template-columns: 0.4fr 1.6fr;
            grid-auto-rows: 0.3fr 1.7fr;
            grid-template-areas:
                    "  sub   top  "
                    "  sub  cmain ";
            margin: 0 auto;
            text-align: left;
            overflow: hidden;
            min-height: 100vh;
            padding-bottom: 164px;
        }

        #header {
            height: 90px;
            text-align: center;
            grid-area: header;
        }

        #sub {
            grid-area: sub;
        }

        #top {
            grid-area: top;
        }

        #cmain {
            grid-area: cmain;
        }

        a:link, a:visited {
            text-decoration: none;
        }

        a:hover {
            cursor: pointer;
        }


        .main-mypage > div {
            border: 1px solid gray;
        }
    </style>
</head>
<body>
<div>
    <div class="header" id="header">
        <tiles:insertAttribute name="header"/>
    </div>
    <hr>
    <div class="main-mypage">
        <div class="main" id="sub">
            <tiles:insertAttribute name="sub"/>
        </div>
        <div class="main" id="top">
            <tiles:insertAttribute name="top"/>
        </div>
        <div class="main" id="cmain">
            <tiles:insertAttribute name="cmain"/>
        </div>
    </div>
</div>
</body>
</html>