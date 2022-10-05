<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8mlhxamjq5"></script>
    <style>
        #container{
            display: flex;
            flex-wrap: nowrap;
        }

        #map{
            float:right;
            width:80%;
            height:590px;
        }

        #sidebar{
            width:20%;
            height:590px;
            background-color: white;
        }

        button.maketour{
            float: right;
        }

    </style>
</head>
<body>
<div id="container">
    <div id="sidebar">
        <button type="button" class="maketour">투어 만들기</button>
        <%--검색바--%>
        <div class="input-group">
            <input type="text" class="form-control cafesearch" placeholder="검색어를 입력하세요">
            <button type="button" class="btn btn-success searchbtn">검색</button>
        </div>
        <div class="searchlist">
        </div>
        <div class="paging">
        </div>
    </div>
    <div id="map"></div>
</div>
<script>
    var currentPage = 1;
    $("button.searchbtn").click(function (){
        //검색어
        var searchword=$("input.cafesearch").val();
        //검색결과 string
        var s="";
        //paging 버튼 string
        var p="";
        //검색하기
        $.ajax({
            type: "get",
            url: "search",
            dataType: "json",
            data:{"searchword":searchword,"currentPage":currentPage},
            success: function(res) {
                $.each(res.list,function(i,ele){
                    console.log(ele.cf_nm);
                    s+="<div>"+ele.cf_nm+"</div>";
                    s+="<div>리뷰 수: "+ele.cm_cnt+" 좋아요 수: "+ele.ck_cnt+"</div>"
                    $.each(ele.img,function (j,elet){
                        if(j<3) {
                            s += "<img src='../images/cafeimg/" + elet.ci_nm + "' style='width:50px;height:50px;'>";
                        }
                    })
                });

                //페이징 시작
                p+="<ul class=‘pagination’>";
                console.log("paging");
                //이전버튼
                if(res.startPage>1) {
                    console.log("이전버튼");
                    p += "<li class=‘page-item’><button type='button' id='btnback' class=‘page-link’>이전</button></li>";
                }
                //중간 숫자 버튼
                for(var idx=res.startPage; idx<=res.endPage; idx++){
                    console.log(idx);
                    p+="<li class=‘page-item’><button type='button' class='page-link btnnum'>"+idx+"</button></li>";
                }
                //다음버튼
                if(res.endPage<res.totalPage) {
                    p += "<li class=‘page-item’><button type='button' id='btnnext' class=‘page-link’>다음</button></li>";
                    p += "</ul>";
                }

                $("div.searchlist").html(s);
                $("div.paging").html(p);
            }//success
        });//$ajax"searchword"
    });



    //지도 옵션
    var mapOptions = {
        center:new naver.maps.LatLng(37.4993705, 127.0290175),
        zoom: 18
    };
    //지도 초기화
    var map =new naver.maps.Map('map', mapOptions);
    //좌표 마커 배열 생성
    var markerList = [];
    //좌표 마커 스타일
    var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');
    //좌표 마커를 찍어서 배열에 저장
    map.getPanes().floatPane.appendChild(menuLayer[0]);
    //줌 이벤트 리스터 생성
    naver.maps.Event.addListener(map, 'zoom_changed', function(zoom) {
       // console.log(zoom);
    });
    //바운드 이벤트 리스터 생성
    naver.maps.Event.addListener(map, 'bounds_changed', function(bounds) {
       // console.log('Center: ' + map.getCenter().toString() + ', Bounds: ' + bounds.toString());
    });
    /* //마우스 클릭 이벤트시 좌표에 마커찍기
     naver.maps.Event.addListener(map, 'click', function(e) {
         //마커 만들기
         var marker = new naver.maps.Marker({
             position: e.coord,
             map: map
         });
         //마커 찍기
         markerList.push(marker);
     });*/
    //모든 카페 리스트 받기
    <c:forEach items="${list}" var="dto">
    //카페 위치에 마커찍기
    var position = new naver.maps.LatLng(${dto.loc_y}, ${dto.loc_x});
    var marker = new naver.maps.Marker({
        position: position,
        map: map,
        title:"${dto.cf_id}"
    });
    //마커들 마커 배열에 넣기
    markerList.push(marker);
    </c:forEach>
</script>
</body>
</html>