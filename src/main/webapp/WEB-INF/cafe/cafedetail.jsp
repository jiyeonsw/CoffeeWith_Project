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
        div.cf-middle a{
            font-size: 30px;
            width: 300px;
        }
    </style>

</head>
<body>
   <div style="margin: 50px 50px;">
       <div class="cf-top">
           <div>
               <img src="../images/cwith2022093011603.png" width="300" height="300" style="border-radius: 10px;">
           </div>
           <div style="margin-left: 10px;">
               <div><h1>${dto.cf_nm}</h1></div>
               <div>${dto.cf_txt}</div>
               <br>
               <div><span>위치</span>  <span>나중에 </span></div>
               <div><span>리뷰</span>  <span>${dto.cm_cnt}</span></div>
               <hr>
                <div><i class="fa-regular fa-heart"></i>${dto.ck_cnt}</div>
           </div>
       </div>
       <div class="cf-middle">
           <a>카페정보</a><a>리뷰(${dto.ck_cnt})</a><a>사진</a>
       </div>
        <div class="cf-bottom">
       <div id="map" style="width:300px;height:400px;"></div>
        <div>
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
