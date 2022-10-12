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
            height: 550px;
        }

        #map{
            float:right;
            width:80%;
        }

        #sidebar{
            width:20%;
            background-color: white;
        }

        button.btn-make-tour{
            float: right;
        }

        div.paging{
            display: flex;
            flex-direction: row;
        }

        .map-icon{
            float: right;
            margin-right: 10px;
            margin-top: 10px;
        }

        .map-icon:hover{
            cursor: pointer;
        }

        .result-name{
            font-size: 20px;
        }

        .result-cnt{
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

       /* .tour-input-title{
            text-align: center;
        }*/

        #tourdatewords{
            text-align: center;
        }

        #tourdate{
            width:300px;
        }

        #modalpopupbtn{
            float:right;
        }

        div.tour-detail{
            overflow-y: scroll;
            height: 300px;
            -ms-overflow-style: none;
        }

        div.tour-detail::-webkit-scrollbar{
            display:none;
        }

        div.detail-bar-date{
            background-color: aqua;
            opacity: 80%;
        }

        div.active-bar{
            border: 1px solid black;
        }

        .tour-icon-set{
            margin-left: 30px;
        }

        .rm-tour-icon{
            float: right;
        }

        .btncontainer{
            float: right;
        }

    </style>
</head>
<body>
<div id="container">
    <div id="sidebar">
        <button type="button" class="btn-make-tour">투어 만들기</button>
        <%--검색바--%>
        <div class="input-group">
            <input type="text" class="form-control cafe-search-bar" placeholder="검색어를 입력하세요">
            <button type="button" class="btn btn-success search-btn">검색</button>
        </div>
        <div class="search-list">
        </div>
        <div class="paging">
        </div>
    </div>
    <div id="map"></div>
    <div id="maketourmodal" class="modal">
        <form class="modal-content anime" action="maketour" method="post" onsubmit="return checkData()">
            <input type="text" id="modaltourname" name="tourname" hidden>
            <input type="text" id="modaltourinfo" name="tourinfo" hidden>
            <input type="text" id="modaltourdate" name="tourdate" hidden>
            <input type="text" id="modaltourlist" name="tourlist" hidden>
            <div id="modalmap"></div>
            <div class="btncontainer">
                <button type="submit" id="tour-submit">투어 추가</button>
                <button type="button" id="tour-cancel">취소</button>
            </div>
        </form>
    </div>
    <div id="maketour">
        <div class="tour-input">
            <div for="tourname" class="tour-input-title">투어명<button type="button" id="modalpopupbtn">경로 확인</button></div>
            <input type="text" id="tourname" placeholder="투어명" class="form-control" name="tourname">
        </div>
        <hr>
        <div class="tour-input">
            <div for="tourinfo" class="tour-input-title">투어소개</div>
            <input type="textarea" id="tourinfo" placeholder="간단한투어소개" class="form-control" name="tourinfo">
        </div>
        <hr>
        <div class="tour-input">
            <div for="tourdate" class="tour-input-title">투어일정</div>
            <input type="text" id="tourdate" name="tourdate">
            <br>
            <div id="tourdatewords"></div>
        </div>
        <hr>
        <input type="text" name="tourlist" id="tourlist" hidden>
        <div class="tour-detail">
            투어일정을 입력해주세요
        </div>
    </div>
</div>
<script>
    //모달 띄우기
    $(document).on('click','#modalpopupbtn', function (){
        clttourlist();
        $("#maketourmodal").show();
        $("#modaltourname").val($("#tourname").val());
        $("#modaltourinfo").val($("#tourinfo").val());
        $("#modaltourdate").val($("#tourdate").val());
        $("#modaltourlist").val($("#tourlist").val());
        console.log($("#modaltourlist").val());
        console.log($("#modaltourname").val());
        console.log($("#modaltourinfo").val());
        console.log($("#modaltourdate").val());
    });
    //모달 닫기
    $(document).on('click','#tour-cancel',function (){
        $("#maketourmodal").hide();
    });
    //폼 받기전 데이터 확인
    function checkData(){
        if($("#modaltourname").val()==""){
            alert("투어명을 입력해주세요");
            return false;
        }
        if($("#modaltourinfo").val()==""){
            alert("투어소개을 입력해주세요");
            return false;
        }
        if($("#modaltourdate").val()==""){
            alert("투어일정을 선택해주세요");
            return false;
        }
        if($("#modaltourlist").val().indexOf('"tours":[]')!=-1){
            alert("투어할 카페를 선택해주세요");
            return false;
        }
        if($("#modaltourlist").val().indexOf('"visit_time":""')!=-1){
            alert("투어할 시간를 선택해주세요");
            return false;
        }
    }

    /*$(document).ready(function (){
        $("button.search-btn").trigger('click');
    })*/

    //전역변수 선언
    var isMakingTour= false;
    var currentPage = parseInt(1);
    var perPage = parseInt(3);
    var perBlock= parseInt(5);
    var startDate="";
    var endDate="";
    var tourDays="";

    //로그인체크
    function loginCheck()
    {
        if("${sessionScope.login_ok}"!=""){
            return true;
        }else{
            alert("로그인후 이용해주세요");
            return false;
        }
    }

    //검색바 엔터키 입력
    $("input.cafe-search-bar").keydown(function(e){
        if(e.keyCode === 13)
        {
            $("button.search-btn").trigger('click');
        }
    });

    //검색
    $("button.search-btn").click(function (){
        //검색어
        var searchword=$("input.cafe-search-bar").val();
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
                //검색 결과가 있을때
                if (res.list.length != 0) {
                    $.each(res.list, function (i, ele) {
                        s += "<div class='search-result'>";
                        s += "<div class='result-name'><a href='../cafe/detail?cf_id=" + ele.cf_id + "'>" + ele.cf_nm +"</a>";
                        s += "<span class='tour-icon-set' style='";
                        if(isMakingTour==true){
                            s += "display: '';'>";
                        }else{
                            s += "display: none;'>";
                        }
                        s += "<i class='fa-solid fa-plus add-tour-icon'></i></span>";
                        s += "<i class='fa-solid fa-location-dot map-icon' cf_id='" + ele.cf_id + "'></i></div>";
                        s += "<div class='result-cnt'>리뷰 수: " + ele.cm_cnt + " &nbsp;&nbsp; 좋아요 수: " + ele.ck_cnt + " ★ " + ele.cm_star + "</div>";
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
                        p += "<button type='button' class='page-link btn-pagenum'>" + idx + "</button>";
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
                $("div.search-list").html(s);
            }//success
        });//$ajax"searchword"
    });//검색버튼

    //페이징 버튼 함수
    //페이지이동
    $(document).on('click','.btn-pagenum',function(){
        currentPage=parseInt($(this).text());
        $("button.search-btn").trigger('click');
    });

    //이전
    $(document).on('click','#btnback',function(){
        currentPage-=parseInt(perBlock);
        $("button.search-btn").trigger('click');
    });

    //다음
    $(document).on('click','#btnnext',function(){
        currentPage+=parseInt(perBlock);
        $("button.search-btn").trigger('click');
    });

    //검색결과 옆 지도아이콘 클릭시 해당 카페를 지도에 표시
    $(document).on('click','.map-icon',function(){
        moveMap($(this).attr("cf_id"));
    });

    //투어 만들기 버튼
    $(document).on('click','button.btn-make-tour',function (){
        if(loginCheck()==false){
            return;
        };
        isMakingTour = !isMakingTour;
        if(isMakingTour==true)
        {
            //열려있는 정보창 닫기
            //for (var i=0, ii=infoWindowList.length; i<ii; i++){infoWindowList[i].close()}
            $(this).text("투어닫기");
            $("#maketour").show();
            $(".tour-icon-set").show();
        }else {
            //열려있는 정보창 닫기
            //for (var i=0, ii=newIWList.length; i<ii; i++){newIWList[i].close()}
            $(this).text("투어만들기");
            $("#maketour").hide();
            $(".tour-icon-set").hide();
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
        "maxSpan": { "days": 2 },
        "drops": "auto",
        "autoUpdateInput": true
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
            d += "<div class='detail-div " + (i==0?"active-bar":"") + " day" + i +"'>"
            d += "<div class='detail-bar-date'>" + nowdate.add(parseInt(i),"days").format('YYYY-MM-DD') + "</div>"
            d += "<div class='detail-bar-cafe'></div>"
            d += "</div>";
            nowdate.subtract(parseInt(i),"days");
        }
        $("div.tour-detail").html(d);
    });

    //날짜 bar 클릭시 활성화
    $(document).on('click','.detail-bar-date',function(){
       $(this).parent().addClass('active-bar');
       $(this).parent().siblings().removeClass('active-bar');
    });

    //+ 아이콘 클릭시 투어 일정 추가
    $(document).on('click','.add-tour-icon',function(){
        var id = $(this).parent().parent().find('.map-icon').attr('cf_id');
        var s = "";
        $.ajax({
            type: "get",
            url: "getcafedata",
            dataType: "json",
            data: {"cf_id":id},
            success: function(res){
                s += "<div class='cafe-in-tour' value='" + id + "'>" + res.cf_nm;
                s += "<input type='time' class='visit_time' required='required'>"
                s += "<i class='fa-solid fa-xmark rm-tour-icon'></i>";
                s += "</div>";
                $("div.active-bar").children(".detail-bar-cafe").append(s);
            }
        });
    });

    //시간 설정시 시간별로 정렬
    $(document).on('change','input.visit_time',function(){
        $(this).parent().parent().children().each(function (i,day){
            $(day).parent().children().each(function (j,cafes){
                if($(cafes).children("input.visit_time").val()>$(cafes).next().children("input.visit_time").val()){
                    $(cafes).insertAfter($(cafes).next());
                }
            })
        })
    });

    // 아이콘 클릭시 일정에서 삭제
    $(document).on('click','.rm-tour-icon',function(){
        $(this).parent().remove();
        var rmpoly = polyLinePath.find()
        console.log(polyLinePath);
    });

    //경로확인전 일정 정보를 json형태로 변환
    function clttourlist()
    {
        if(loginCheck()==false){
            return false;
        };
        //반환할 배열 변수생성
        var tourList = [];

        //날짜수 만큼 반복
        $(".detail-div").each(function(i,day){
            //하루 날짜에 해당하는 데이터 배열
            var tourPerDay = [];
            //해당 날짜 카페수 만큼 반복
            $(day).children(".detail-bar-cafe").children().each(function (j,cafe){
                //카페 데이터 담을 공간
                var cafeData = {};
                //카페 순서
                cafeData.visit_time =$(cafe).children(".visit_time").val();
                //카페 id
                cafeData.cf_id = $(cafe).attr("value");
                tourPerDay.push(cafeData);
            });
            //날짜 데이터 담을 공간
            var dayData = {};
            //날짜
            dayData.day = $(day).children(".detail-bar-date").text();
            //해당 날짜 투어정보
            dayData.tours = tourPerDay;
            tourList.push(dayData);
        });
        //json형태로 바꾸기
        var tourjson = JSON.stringify(tourList);
        $("#tourlist").attr("value",tourjson);
    }

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
            content: `<div class="info-window">
                         <span style="display:none">${dto.cf_id}</span>
                         <div>${dto.cf_nm}</div>
                      </div>`
        });
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