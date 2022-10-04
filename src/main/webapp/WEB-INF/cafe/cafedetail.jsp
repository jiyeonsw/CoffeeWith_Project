<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Coffeewith</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8mlhxamjq5"></script>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <style type="text/css">
        div.cf-top{
            display: flex;
        }
        div.cf-bottom{
            display: flex;
        }
        div.cf-middle{
            display: flex;
            text-align: center;
        }
        div.cf-middle a{
            font-size: 30px;
            width: 300px;
            text-align: center;
            cursor: pointer;
        }
    </style>

</head>
<body>
   <div style="margin: 50px 50px;">
       <div class="cf-top">
           <!-- Carousel -->
           <div id="demo" class="carousel slide" data-bs-ride="carousel">
               <!-- Indicators/dots -->
               <div class="carousel-indicators">
                   <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                    <c:forEach items="${list}" var="dtoi" varStatus="i">
                   <button type="button" data-bs-target="#demo" data-bs-slide-to="${i.index+1}"></button>
                    </c:forEach>
               </div>
               <!-- The slideshow/carousel -->
               <div class="carousel-inner">

               <c:forEach items="${list}" var="dtoi" varStatus="i">
                   <c:if test="${i.count==1}"><div class="carousel-item active"></c:if>
                   <c:if test="${i.count>1}"><div class="carousel-item"> </c:if>
                       <img src="../images/cafeimg/${dtoi.ci_nm}"  class="d-block" style="width:300px">
                   </div>
               </c:forEach>
               </div> <!--carousel-inner-->

               <!-- Left and right controls/icons -->
               <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                   <span class="carousel-control-prev-icon"></span>
               </button>
               <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                   <span class="carousel-control-next-icon"></span>
               </button>

           </div>

           <!--메인정보-->
           <div style="margin-left: 30px;">
               <div><h1>${dto.cf_nm}</h1></div>
               <div>${dto.cf_txt}</div>
               <br>
               <div><span>위치</span>  <span>나중에 </span></div>
               <div><span>리뷰</span>  <span>${dto.cm_cnt}</span></div>
               <hr>
                <div><i class="fa-regular fa-heart"></i>${dto.ck_cnt}</div>
           </div>
       </div> <!--cf_top-->
           <br>
       <div class="cf-middle">
           <a>카페정보</a><a>리뷰(${dto.ck_cnt})</a><a>사진</a>
       </div>
       <hr>
       <br>
        <div class="cf-bottom">
       <div id="map" style="width:300px;height:400px;"></div>
        <div style="margin-left: 30px;">
            <div><span>영업시간</span> <span>${dto.open_time}</span></div>
            <div><span>휴무일</span> <span>${dto.off_day}</span></div>
            <div><span>전화번호</span> <span>${dto.cf_tel}</span></div>
            <div><span>주소</span> <span>${dto.loc_addr}</span></div>
            <div><span>대표메뉴</span> <span>${dto.menu}</span></div>
        </div>
        </div>
       <script>
           var position = new naver.maps.LatLng(${dto.loc_y}, ${dto.loc_x});
           var mapOptions = {
               center:position,
               zoom: 18
           };
           var map =new naver.maps.Map('map', mapOptions);

           var markerOptions = {
               position: position,
               map: map,
               icon: {
                   url: '../images/cafemarker.png',
                   size: new naver.maps.Size(22, 35),
                   origin: new naver.maps.Point(0, 0),
                   anchor: new naver.maps.Point(11, 35)
               }
           };
           var marker = new naver.maps.Marker({
               position: position,
               map: map,
               markerOptions : markerOptions
           });
       </script>

   </div>
</body>
</html>
