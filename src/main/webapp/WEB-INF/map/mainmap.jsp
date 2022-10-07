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
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <style>
        body{
            overflow: hidden;
        }


        #container{
            display: flex;
            height: 100%;
        }

        #map{
            float:right;
            width:80%;
            height: 590px;
        }

        #sidebar{
            width:20%;
            background-color: white;
            height: 590px;
        }

        button.btnmaketour{
            float: right;
        }

        div.paging{
            display: flex;
            flex-direction: row;
        }

        .mapicon{
            float: right;
            margin-right: 10px;
            margin-top: 10px;
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

        #maketour{
            display: none;
            position: fixed;
            opacity: 80%;
            background-color: white;
            width: 300px;
            height: 590px;
            right: 0;
            z-index: 1;
        }

        .tour_input_title{
            text-align: center;
        }

        #tourdatewords{
            text-align: center;
        }

        #tourdate{
            width:300px;
        }

        div.tourdetail{
            overflow-y: scroll;
            height: 300px;
            -ms-overflow-style: none;
        }

        div.tourdetail::-webkit-scrollbar{
            display:none;
        }

        div.detailbar{
            background-color: aqua;
            opacity: 80%;
        }

        .touriconset{
            margin-left: 30px;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="sidebar">
        <button type="button" class="btnmaketour">투어 만들기</button>
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
    <div id="maketour">
        <form action="maketour">
            <div class="tour_input">
                <div for="tourname" class="tour_input_title">투어명</div>
                <input type="text" id="tourname" placeholder="투어명" class="form-control"
                       required="required" name="tourname">
            </div>
            <hr>
            <div class="tour_input">
                <div for="tourinfo" class="tour_input_title">투어소개</div>
                <input type="text" id="tourinfo" placeholder="간단한투어소개" class="form-control"
                       required="required" name="tourinfo">
            </div>
            <hr>
            <div class="tour_input">
                <div for="tourdate" class="tour_input_title">투어일정</div>
                <input type="text" id="tourdate" name="tourdate"/>
                <br>
                <div id="tourdatewords"></div>
            </div>
            <hr>
            <div class="tourdetail">
                1oierf;ljg;iㅈ루ㅑㅕ누파ㅓㄴㅅ구히ㅏㅓㅜㄷㅈㅁ;래ㅑ[ㄷ재ㅑ루;ㅐㅑ듛;ㅕㄱㄴ;햐;ㄹ웊미ㅏㅓ깋라ㅓ듄;패ㅑ뮹;ㅐㅑㄷㅈㄹ;ㅏㅓㅠㅁ;나ㅓ윺;ㅕㄷㄱㅁ['ㅎ몰개ㅑㅈㅂ;ㄻㄱ;힐야ㅠ히ㅑㅅㄱ녀ㅗ햐ㅗ;ㅐ랴;ㅈ둘;ㅓ:ㅇㄴ러ㅠ;ㅁ냥ㄹ;ㅐㅑ뮫개ㅑ루;ㄷㅈ버ㅠ;라ㅓㅜㅇㄴ;ㅓㅠㅍ;ㅐㅑㄷ개ㅑㄼ;ㄷ개ㅑㄹ;ㅈ듁;ㄷㅈ뷱;ㅏㅓㅠㅇㄴ.프ㅜ날두;ㄷ쟈ㅗㄱ'ㅐㅑㅗㅇㄴ매ㅑ롣재'ㅑㅗ개ㅑㅈㅄ;ㄷ거ㅜㄹ;<ㅣㅏㅇㄴ머ㅠ라ㅓㅇ뉴ㅏ류>ㅣㅏㅓ규;ㅑㅗㅊ['ㅑㅇ놀'매ㅑㅈ것;ㅣㅏ부ㅠ라ㅓㅠㄷㅈ ㅓㅇ;냐ㅗㄹ'ㅑㄴㄱ' ㅏㅜㄱ/ㅣㅏㄷ주ㅠㄹ/ㅣㅏㅠ러ㅠ                 1oierf;ljg;iㅈ루ㅑㅕ누파ㅓㄴㅅ구히ㅏㅓㅜㄷㅈㅁ;래ㅑ[ㄷ재ㅑ루;ㅐㅑ듛;ㅕㄱㄴ;햐;ㄹ웊미ㅏㅓ깋라ㅓ듄;패ㅑ뮹;ㅐㅑㄷㅈㄹ;ㅏㅓㅠㅁ;나ㅓ윺;ㅕㄷㄱㅁ['ㅎ몰개ㅑㅈㅂ;ㄻㄱ;힐야ㅠ히ㅑㅅㄱ녀ㅗ햐ㅗ;ㅐ랴;ㅈ둘;ㅓ:ㅇㄴ러ㅠ;ㅁ냥ㄹ;ㅐㅑ뮫개ㅑ루;ㄷㅈ버ㅠ;라ㅓㅜㅇㄴ;ㅓㅠㅍ;ㅐㅑㄷ개ㅑㄼ;ㄷ개ㅑㄹ;ㅈ듁;ㄷㅈ뷱;ㅏㅓㅠㅇㄴ.프ㅜ날두;ㄷ쟈ㅗㄱ'ㅐㅑㅗㅇㄴ매ㅑ롣재'ㅑㅗ개ㅑㅈㅄ;ㄷ거ㅜㄹ;<ㅣㅏㅇㄴ머ㅠ라ㅓㅇ뉴ㅏ류>ㅣㅏㅓ규;ㅑㅗㅊ['ㅑㅇ놀'매ㅑㅈ것;ㅣㅏ부ㅠ라ㅓㅠㄷㅈ ㅓㅇ;냐ㅗㄹ'ㅑㄴㄱ' ㅏㅜㄱ/ㅣㅏㄷ주ㅠㄹ/ㅣㅏㅠ러ㅠ    ㅇ'ㅗㄹ'ㅇㄴㄹ'ㅏㅣㄷ</ㅣㅏㅇㄴ머ㅠ라ㅓㅇ뉴ㅏ류>
                ㅇ'ㅗㄹ'ㅇㄴㄹ'ㅏㅣㄷ</ㅣㅏㅇㄴ머ㅠ라ㅓㅇ뉴ㅏ류>
            </div>
        </form>
    </div>
</div>
<script>
    //전역변수 선언
    var isMakingTour= false;
    var currentPage = parseInt(1);
    var perPage = parseInt(4);
    var perBlock= parseInt(5);
    var startDate="";
    var endDate="";
    var tourDays="";

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
                console.log(res);
                //검색 결과가 있을때
                if (res.list.length != 0) {
                    $.each(res.list, function (i, ele) {
                        s += "<div class='searchresult'>";
                        s += "<div class='result_name'><a href='../cafe/detail?cf_id=" + ele.cf_id + "'>" + ele.cf_nm +"</a>";
                        s += "<span class='touriconset' style='";
                        if(isMakingTour==true){
                            s += "display: '';'>";
                        }else{
                            s += "display: none;'>";
                        }
                        s += "<i class='fa-solid fa-plus addtouricon'></i>&nbsp;<i class='fa-solid fa-xmark rmtouricon'></i></span>";
                        s += "<i class='fa-solid fa-location-dot mapicon' cf_id='" + ele.cf_id + "'></i></div>";
                        s += "<div class='result_cnt'>리뷰 수: " + ele.cm_cnt + " &nbsp;&nbsp; 좋아요 수: " + ele.ck_cnt + " ★ " + ele.cm_star + "</div>";
                        //사진 없으면
                        if (ele.img.length == 0) {
                            s += "<img src='../images/noimage.png' style='width:70px;height:70px;'>";
                        } else {
                            $.each(ele.img, function (j, elet) {
                                //보여질 사진 갯수
                                if (j < 4) {
                                    s += "<img src='../images/cafeimg/" + elet.ci_nm + "' style='width:70px;height:70px;'>";
                                }
                            });
                        }
                        s += "</div>";
                    });

                    //페이징 시작
                    //이전버튼
                    if (res.startPage > 1) {
                        p += "<button type='button' id='btnback' class=‘page-link’>이전</button>";
                    }
                    //중간 숫자 버튼
                    for (var idx = res.startPage; idx <= res.endPage; idx++) {
                        p += "<button type='button' class='page-link btnnum'>" + idx + "</button>";
                    }
                    //다음버튼
                    if (res.endPage < res.totalPage) {
                        p += "<button type='button' id='btnnext' class=‘page-link’>다음</button>";
                    }
                    moveMap(res.list[0].cf_id);
                }else{
                    //검색어 검색결과가 없을때
                    s += searchword + "에 대한 검색 결과가 없습니다";
                    p = "";
                }
                $("div.paging").html(p);
                $("div.searchlist").html(s);
            }//success
        });//$ajax"searchword"
    });//검색버튼

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

    //검색결과 옆 지도아이콘 클릭시 해당 카페를 지도에 표시
    $(document).on('click','.mapicon',function(){
        moveMap($(this).attr("cf_id"));
    });

    //투어 만들기 버튼
    $(document).on('click','button.btnmaketour',function (){
        isMakingTour = !isMakingTour;
        console.log(isMakingTour);
        if(isMakingTour==true)
        {
            //열려있는 정보창 닫기
            //for (var i=0, ii=infoWindowList.length; i<ii; i++){infoWindowList[i].close()}
            $(this).text("투어닫기");
            $("#maketour").show();
            $(".touriconset").show();
        }else {
            //열려있는 정보창 닫기
            //for (var i=0, ii=newIWList.length; i<ii; i++){newIWList[i].close()}
            $(this).text("투어만들기");
            $("#maketour").hide();
            $(".touriconset").hide();
        }
    });

    //datepicker 함수
    $('#tourdate').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        },
        "minDate": moment(),
        "startDate": moment(),
        "endDate": moment().add(2,"d"),
        "maxSpan": { "days": 2 },
        "drops": "auto"
    },function (start, end, label) {
        //날짜를 고르면 밑에 며칠인지 표시하기
        startDate=start.format('YYYY-MM-DD');
        endDate=end.format('YYYY-MM-DD');
        tourDays=end.diff(start,"days") + 1;
        $("#tourdatewords").text(tourDays + " DAYS");

        //디테일에 일정바 추가
        var d="";
        for(var i=0; i<parseInt(tourDays); i++ ) {
            var nowdate=start;
            d += "<div class='detaildiv"+i+"'><div class='detailbar'>"+nowdate.add(parseInt(i),"days").format('YYYY-MM-DD')+"</div></div>";
            nowdate.subtract(parseInt(i),"days");
        }
        $("div.tourdetail").html(d);
    });

    $(document).on('click','.addtouricon',function(){
        var id = $(this).parent().parent().find('.mapicon').attr('cf_id');
        console.log(id);
        $.ajax({
            type: "get",
            url: "search",
            dataType: "json",
            data: {"cf_id":id},
            success: function(res){

            }
        });
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
    //마커 정보창 배열 생성
    var infoWindowList = [];
    //var newIWList = [];

    //좌표 마커 스타일
    var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');

    //좌표 마커를 찍어서 배열에 저장
    //map.getPanes().floatPane.appendChild(menuLayer[0]);

    //줌 이벤트 리스터 생성
   /* naver.maps.Event.addListener(map, 'zoom_changed', function(zoom) {
       // console.log(zoom);
    });
    //바운드 이벤트 리스터 생성
    naver.maps.Event.addListener(map, 'bounds_changed', function(bounds) {
       // console.log('Center: ' + map.getCenter().toString() + ', Bounds: ' + bounds.toString());
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

        //정보창 생성
        //평시
        var infoWindow = new naver.maps.InfoWindow({
            content: `<div class="infowindow">
                         <span style="display:none">${dto.cf_id}</span>
                         <div>${dto.cf_nm}</div>
                         <div>★</div>
                      </div>`
        });
        //투어만들기중 정보창
        /*var newIW = new naver.maps.InfoWindow({
            content: `<div class="infowindow">
                         <span style="display:none">${dto.cf_id}</span>
                         <div>${dto.cf_nm}</div>
                         <button type="button" class="btnaddtour"><i class="fa-solid fa-plus"></i></button>
                         <button type="button" class="btnrmtour"><i class="fa-solid fa-xmark"></i></button>
                      </div>`
        });*/

        //마커를 마커 배열에 넣기
        markerList.push(marker);
        //정보창을 정보창 배열에 넣기
        infoWindowList.push(infoWindow);
        //newIWList.push(newIW);
    </c:forEach>

    // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
    function getClickHandler(seq) {
        return function(e) {
            var marker = markerList[seq],
                infoWindow = infoWindowList[seq];
            //    newIW = newIWList[seq];
            //투어만들기중 일때
            /*if(isMakingTour == true)
            {
                if (newIW.getMap()) {
                    newIW.close();
                } else {
                    newIW.open(map, marker);
                }
            //평시
            }else{*/
                if (infoWindow.getMap()) {
                    infoWindow.close();
                } else {
                    infoWindow.open(map, marker);
                }
            //}
        }
    }

    //맵에 어떠한 변화가 있을때
    naver.maps.Event.addListener(map, 'idle', function() {
        updateMarkers(map, markerList);
    });

    //마커가 맵 밖에 있으면 숨기기
    function updateMarkers(map, markers) {

        var mapBounds = map.getBounds();
        var marker, position;

        for (var i = 0; i < markers.length; i++) {

            marker = markers[i]
            position = marker.getPosition();

            if (mapBounds.hasLatLng(position)) {
                showMarker(map, marker);
            } else {
                hideMarker(map, marker);
            }
        }
    }

    //마커배열의 길이 만큼 클릭 이벤트 생성
    for (var i=0, ii=markerList.length; i<ii; i++) {
        naver.maps.Event.addListener(markerList[i], 'click', getClickHandler(i));
    }

    //지도 이동 일반함수 해당 카페 아이디로
    function moveMap(cf_id)
    {
        map.setZoom(18);
        map.setCenter(markerList[cf_id-1].getPosition());
    }

    //마커보이기
    function showMarker(map, marker) {

        if (marker.getMap()) return;
        marker.setMap(map);
    }

    //마커숨기기
    function hideMarker(map, marker) {

        if (!marker.getMap()) return;
        marker.setMap(null);
    }
</script>
</body>
</html>