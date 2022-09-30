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
    </style>

</head>
<body>
   <div style="margin: 50px 50px;">
       <div class="cf-top">
       <div>
           <img src="../images/noimage.png" width="300" height="300">
       </div>
       <div>
       <div>${dto.cf_nm}</div>
       <div>${dto.cf_txt}</div>
       </div>
       </div>
       <div id="map" style="width:300px;height:400px;"></div>

       <script>
           var mapOptions = {
               center:new naver.maps.LatLng(37.3595704, 127.105399),
               zoom: 1
           };

           var map =new naver.maps.Map('map', mapOptions);
       </script>

   </div>
</body>
</html>
