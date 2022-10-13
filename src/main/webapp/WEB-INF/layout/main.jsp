<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <title>CoffeeWith</title>
    <link rel="stylesheet" type="text/css" href="main.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.css"
          integrity="sha512-rVfXYRlhHtd3C4PzoBxSaKhI/uYEi0/5K69RwK/cdxQld57PC6mZ7tkutR+KD96WrXZ6E/96qYeY4CVun7a0/w=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"
            integrity="sha512-c0NksyGPH0LUkeV3kgNU6p98oYwacImv508UsTDKqTWpEk1LFDMC8falFf9A2HZ8vt1ZIj3K4TNw2YT4Cid28Q=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
<div class="main-page-container">
    <div class="cf-best-container">
        <h3 class="cf-best-tit-box tit">
            <a>요즘 뜨는 카페</a>
        </h3>
        <div class="test1">
            <ul>
                <li class="cf-card">
                    <div class="cf-img-box">
                        <img src="https://static-file.jejupass.com/download/82148.webp?width=736&height=736">
                    </div>
                    <div class="cf-cont-box">
                        <div class="cf-nm">귤당리</div>
                        <div class="cf-info">
                                <span class="cf-lk-box" title="북마크 개수">
                                    1000
                                </span>
                            <span class="cf-star-box" title="평균평점">
                                    4.3
                                    <i title="리뷰 갯수">(341)</i>
                                </span>
                            <span class="cf-addr" title="위치정보">제주시 한경면</span>
                        </div>
                        <p class="cf-txt">제주 스노클링의 성지 판포포구에 위치한 귤당리에요 이곳의 자랑거리는 푸른 에메랄드 빛 오션뷰를 품은 야외테라스죠. 가슴이 확 트이는
                            바다를
                            바라보며
                            귤청과 우유로 만든 파도빛깔의 바다라떼 한잔 어때요? </p>
                        <p class="cf-tag-box">
                            <span class="tag">#제주카페</span>
                            <span class="tag">#바다뷰카페</span>
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="loc-container">
    <div class="loc-tit-box tit">
    </div>
    <div class="loc-circle-box">
    </div>
</div>
<div class="tr-container">
    <div class="tr-tit-box tit"></div>
    <div class="tr-card">
        <div class="tr-img-box"></div>
        <div class="tr-cont-box">
            <div class="tr-cont-tit"></div>
            <div class="tr-cont-txt"></div>
            <div class="tr-cont-info"></div>
        </div>
    </div>
</div>
<div class="fd-container">
    <div class="fd-tit-box tit">커뮤니티</div>
    <div class="fd-img-box"></div>
    <div class="fd-cont-box">
        <div class="fd-cont-txt"></div>
        <div class="fd-cont-info"></div>
    </div>
</div>
</div>
<script src="main.js"></script>
</body>

</html>