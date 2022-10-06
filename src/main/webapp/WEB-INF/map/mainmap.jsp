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
    <title>메인지도</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8mlhxamjq5"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <style>
        #container{
            display: flex;
            height: 50%;
        }

        #map{
            float:right;
            width:80%;
            height: 590px;
        }

        #sidebar{
            width:20%;
            background-color: white;
            hight: 590px;
        }

        button.maketour{
            float: right;
        }

        div.paging{
            display: flex;
            flex-direction: row;
        }

        .mapicon{
            float: right;
            margin-right: 10px;
        }

        .mapicon:hover{
            cursor: pointer;
        }

        .result_name{
            font-size: 20px;
        }

        .result_cnt{
            font-size: 12px;
        }

    </style>
</head>
<body>
<div id="container">
    <div id="sidebar">
        <button type="button" class="maketour">투어 만들기</button>
        <%--검색바--%>
        <div class="input-group">
            <input type="text" class="form-control cafesearchbar" placeholder="검색어를 입력하세요">
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
    var currentPage = parseInt(1);
    var perPage = parseInt(4);
    var perBlock= parseInt(5);
    //검색바 엔터키 입력
    $("input.cafesearchbar").keydown(function(e){
        if(e.keyCode === 13)
        {
            $("button.searchbtn").trigger('click');
        }
    });

    //검색
    $("button.searchbtn").click(function (){
        //검색어
        var searchword=$("input.cafesearchbar").val();
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
                    s+="<div class='searchresult'>";
                    s+="<div class='result_name'><a href='../cafe/detail?cf_id="+ele.cf_id+"'>"+ele.cf_nm+"</a><i class='fa-solid fa-map-pin mapicon' cf_id='"+ele.cf_id+"'></i></div>";
                    s+="<div class='result_cnt'>리뷰 수: "+ele.cm_cnt+" &nbsp;&nbsp; 좋아요 수: "+ele.ck_cnt+"</div>";
                    $.each(ele.img,function (j,elet){
                        //보여질 사진 갯수
                        if(j<4) {
                            s += "<img src='../images/cafeimg/" + elet.ci_nm + "' style='width:70px;height:70px;'>";
                        }
                    });
                    s+="</div>";
                });

                //페이징 시작
                //이전버튼
                if(res.startPage>1) {
                    p += "<button type='button' id='btnback' class=‘page-link’>이전</button>";
                }
                //중간 숫자 버튼
                for(var idx=res.startPage; idx<=res.endPage; idx++){
                    p += "<button type='button' class='page-link btnnum'>"+idx+"</button>";
                }
                //다음버튼
                if(res.endPage<res.totalPage) {
                    p += "<button type='button' id='btnnext' class=‘page-link’>다음</button>";
                }

                $("div.searchlist").html(s);
                $("div.paging").html(p);
                moveMap(res.list[0].cf_id);
            }//success
        });//$ajax"searchword"
    });

    //페이징 버튼 함수
    //페이지이동
    $(document).on('click','.btnnum',function(){
        currentPage=parseInt($(this).text());
        $("button.searchbtn").trigger('click');
    });

    //이전
    $(document).on('click','#btnback',function(){
        currentPage-=parseInt(perBlock);
        $("button.searchbtn").trigger('click');
    });

    //다음
    $(document).on('click','#btnnext',function(){
        currentPage+=parseInt(perBlock);
        $("button.searchbtn").trigger('click');
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

    function moveMap(cf_id)
    {
        map.setZoom(18);
        map.setCenter(markerList[cf_id-1].getPosition());
    };

    //검색결과 옆 지도아이콘 클릭시 해당 카페를 지도에 표시
    $(document).on('click','.mapicon',function(){
        moveMap($(this).attr("cf_id"));
    });

</script>
</body>
</html>