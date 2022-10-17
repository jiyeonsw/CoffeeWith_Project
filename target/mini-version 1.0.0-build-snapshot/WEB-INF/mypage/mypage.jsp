<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <%--jquery script--%>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <%--bootstrap 5 css,script--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <%--google font --%>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
          rel="stylesheet">
    <%--icon--%>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <title>Coffee With</title>
    <style>
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body * {
            font-family: 'GangwonEdu_OTFBoldA';
            color: #664400;
        }

        .main-mypage {
            display: grid;
            width: 950px;
            grid-auto-rows: 0fr 1fr;
            grid-template-areas:
                    "top"
                    "cmain";
            margin: 0 auto;
            text-align: left;
            overflow: hidden;
            padding-bottom: 164px;
        }

        #header {
            height: 120px;
            text-align: center;
            grid-area: header;
            z-index: 101;
            box-shadow: 0 8px 8px rgb(0 0 0 / 5%);
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

        /*   .main-mypage > div {
               border: 1px solid gray;
           }*/

    </style>
</head>
<body>
<div>
    <div class="header" id="header">
        <tiles:insertAttribute name="header"/>
    </div>
    <div class="main-mypage">
        <div class="main" id="top">
            <tiles:insertAttribute name="top"/>
        </div>
        <%--contents main--%>
        <div class="main" id="cmain">
            <tiles:insertAttribute name="cmain"/>
        </div>
    </div>
</div>
</body>
</html>