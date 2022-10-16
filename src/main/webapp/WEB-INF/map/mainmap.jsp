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
        }
        #sidebar{
            width:20%;
            background-color: white;
        }
        div.category{
            height: 80px;
            margin-top: 5px;
        }
        .categorybtn{
            margin-left: 5px;
            margin-bottom: 5px;
            border-radius: 15px;
            border: 1px solid #664400;
        }
        .categorybtn:hover{
            color: white;
            background-color: #664400;
        }
        button.btn-make-tour, #modalpopbtn, #tour-submit, #tour-cancel{
            border-radius: 5px;
            border: 1px solid #664400;
        }
        button.btn-make-tour:hover, #modalpopbtn:hover, #tour-submit:hover, #tour-cancel:hover{
            color: white;
            background-color: #664400;
        }
        div.search-list{
            height: 470px;
        }
        .results{
            padding-top: 10px;
            padding-bottom: 10px;
            border: 1px solid #dcdcdc;
        }
        div.search-result img{
            margin-left: 7px;
            width: 70px;
            height: 70px;
            border-radius: 3px;
        }
        button.btn-make-tour{
            float: right;
        }
        div.paging{
            display: flex;
            flex-direction: row;
            justify-content : center;
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
            font-size: 25px;
        }
        .result-cnt{
            font-size: 15px;
        }
        #maketour{
            display: none;
            position: fixed;
            opacity: 80%;
            background-color: white;
            width: 300px;
            height: 100%;
            right: 0;
            z-index: 1;
        }
        .tour-input-title{
            text-align: center;
            padding-top: 3px;
        }
        #tourdatewords{
            text-align: center;
        }
        #tourdate{
            width:300px;
        }
        div.tour-detail{
            overflow-y: scroll;
            height: 330px;
            text-align: center;
            -ms-overflow-style: none;
        }
        div.tour-detail::-webkit-scrollbar{
            display:none;
        }
        div.detail-bar-date{
            background-color: #D8CCA3;
            opacity: 80%;
        }
        div.active-bar{
            border: 1px solid #B09B71;
        }
        .tour-icon-set{
            margin-left: 30px;
        }
        .rm-tour-icon{
            float: right;
        }
        .btncontainer{
            width: 100%;
        }
        #maketourmodal{
            position: absolute;
            margin: -350px 0px 0px -500px;
            top: 50%;
            left: 50%;
            width: 1000px;
            height: 700px;
            text-align: center;
        }
        #modalmap{
            width: 100%;
            height: 500px;
        }
        .active-page{
            color: #fff;
            cursor: default;
            background-color: #337ab7;
        }
        #btnmodalday0{
            background-color: red;
            border: none;
            border-radius: 5px;
            display: none;
        }
        #btnmodalday1{
            background-color: orange;
            border: none;
            border-radius: 5px;
            display: none;
        }
        #btnmodalday2{
            background-color: yellow;
            border: none;
            border-radius: 5px;
            display: none;
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
        <div class="category">
            <c:forEach var="dto" items="${ctglist}">
                <button type="button" class="categorybtn" value="${dto.cg_id}">#${dto.cg_nm}</button>
            </c:forEach>
        </div>
        <div class="search-list"></div>
        <div class="paging"></div>
    </div>
    <div id="map"></div>
    <div id="maketourmodal" class="modal">
        <form class="modal-content anime" action="maketour" method="post" onsubmit="return checkData()">
            <input type="text" id="modaltourname" name="tourname" hidden>
            <input type="text" id="modaltourinfo" name="tourinfo" hidden>
            <input type="text" id="modaltourdate" name="tourdate" hidden>
            <input type="text" id="modaltourlist" name="tourlist" hidden>
            <input type="text" id="modalpolylist" hidden>
            <div id="modalinfo"></div>
            <div class="btncontainer">
                <button type="button" id="btnmodalday0" value="">1일차</button>
                <button type="button" id="btnmodalday1" value="">2일차</button>
                <button type="button" id="btnmodalday2" value="">3일차</button>
            </div>
            <div id="modalmap"></div>
            <div class="btncontainer">
                <button type="submit" id="tour-submit">투어 추가</button>
                <button type="button" id="tour-cancel">취소</button>
            </div>
        </form>
    </div>
    <div id="maketour">
        <div class="tour-input">
            <div for="tourname" class="tour-input-title">투어명</div>
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
        <input type="text" id="tourlist" hidden>
        <input type="text" id="polylist" hidden>
        <div class="tour-detail">
            투어일정을 입력해주세요
        </div>
        <button type="button" id="modalpopbtn">경로 확인</button>
    </div>
</div>
</body>
</html>












<script>
    //전역변수 선언
    let isMakingTour= false;
    let currentPage = parseInt(1);
    let perPage = parseInt(3);
    let perBlock= parseInt(5);
    let startDate="";
    let endDate="";
    let tourDays="";
    //좌표 마커 배열 생성
    let markerList = [];
    let polymarkerList = [];
    //마커 정보창 배열 생성
    let infoWindowList = [];
    //좌표 마커 스타일
    let menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');
    //페이지 로딩후 바로 실행
    $(document).ready(function (){
        var lng = ${lng};
        var lat = ${lat};
        var zoom = ${zoom};
        if(lng==127.0290175){
            $("button.search-btn").trigger('click');
        }else{
            var pos = new naver.maps.LatLng(lat, lng);
            map.setZoom(zoom);
            map.setCenter(pos);
            for (var mkr of markerList){
                mkr.setAnimation(null);
                mkr.setVisible(true);
            }
        }
        /*$("input.cafe-search-bar").val("${sw}");
        $("button.search-btn").trigger('click');*/
    })
    //모달 띄우기
    $(document).on('click','#modalpopbtn', function (){
        //경로변수
        var polyTotal = [];
        polymarkerList = [];
        //투어 정보 모으기
        clttourlist();
        if($("#tourlist").val().indexOf('[]')!=-1){
            alert("투어할 카페를 선택해주세요");
            return
        }
        $("#maketourmodal").show();
        //모달 폼에 정보 전달
        $("#modaltourname").val($("#tourname").val());
        $("#modaltourinfo").val($("#tourinfo").val());
        $("#modaltourdate").val($("#tourdate").val());
        $("#modaltourlist").val($("#tourlist").val());
        $("#modalpolylist").val($("#polylist").val());
        var s = "";
        s += "투어명 :" + $("#modaltourname").val() + "<br>투어일정 :" + $("#modaltourdate").val();
        $("#modalinfo").html(s);
        console.log($("#modaltourlist").val());
        console.log($("#modaltourname").val());
        console.log($("#modaltourinfo").val());
        console.log($("#modaltourdate").val());
        console.log($("#modalpolylist").val());
        // //지도 옵션
        // var modalMapOptions = {
        //     center: new naver.maps.LatLng(37.4993705, 127.0290175),
        //     zoom: 18
        // };
        //모달 지도 띄우기
        var modalmap = new naver.maps.Map("modalmap");
        //경로 생성
        //경로를 JSON 으로 바꾸기
        var polyJSON = JSON.parse($("#modalpolylist").val());
        //버튼들 띄우기
        var dayCnt= 0;
        var pos= $("#modaltourlist").val().indexOf('"day"');
        while (pos!=-1){
            dayCnt++;
            pos = $("#modaltourlist").val().indexOf('"day"', pos+1);
        }
        //button에 value값 추가
        if(dayCnt > 0){
            $("#btnmodalday0").show();
            $("#btnmodalday0").attr("value",polyJSON[0].length);
        }
        if(dayCnt > 1){
            $("#btnmodalday1").show();
            $("#btnmodalday1").attr("value",polyJSON[1].length);
        }
        if(dayCnt > 2){
            $("#btnmodalday2").show();
            $("#btnmodalday2").attr("value",polyJSON[2].length);
        }
        if($("#modalpolylist").val().indexOf("[]")!=-1){
            alert("모든 날짜에 투어 일정을 추가해 주세요");
            closeModal();
        }
        var iIdx = 0;
        //배열안 날짜만큼 반복
        for(var i of polyJSON){
            var polypath = [];
            //날짜안의 카페수 만큼 반복
            for (var j of i) {
                //카페 아이디로 위치따기
                polypath.push(markerList[j.cf_id - 1].getPosition());
                var polymarker = new naver.maps.Marker({
                    position: markerList[j.cf_id - 1].getPosition(),
                    map: modalmap,
                    title:markerList[j.cf_id - 1].getTitle()
                });
                polymarkerList.push(polymarker);
            }
            //색상배열
            var rainbow = ["red","orange","yellow","green","blue","indigo","purple"];
            //경로 생성
            var polyline = new naver.maps.Polyline({
                map: modalmap,
                path: polypath,
                strokeColor: rainbow[iIdx],
                strokeOpacity: 0.8,
                strokeWeight: 5,
                zIndex: 2,
                endIcon: naver.maps.PointingIcon.OPEN_ARROW
            });
            //polymarkerList에서 바운드 가져오기
            if(polymarkerList.length>1) {
                var bounds = new naver.maps.LatLngBounds(polymarkerList[0].getPosition(), polymarkerList[1].getPosition());
                for (var i = 0; i < polymarkerList.length; i++) {
                    var latLng = polymarkerList[i].getPosition();
                    bounds.extend(latLng);
                }
                modalmap.fitBounds(bounds);
            }
            polyTotal.push(polyline);
            iIdx++;
        }
        console.log(polyTotal);
    });
    //1일차 버튼
    $(document).on('click', '#btnmodalday0', function() {
        for(var j of polymarkerList) {
            j.setAnimation(null);
        }
        var v = $(this).attr("value");
        for (var i=0;i<v;i++) {
            if (polymarkerList[i].getAnimation() !== null) {
                polymarkerList[i].setAnimation(null);
            } else {
                polymarkerList[i].setAnimation(naver.maps.Animation.BOUNCE);
            }
        }
    });
    //2일차 버튼
    $(document).on('click', '#btnmodalday1', function() {
        for(var j of polymarkerList) {
            j.setAnimation(null);
        }
        var v = parseInt($("#btnmodalday0").attr("value"));
        for (var i=v;i<parseInt($(this).attr("value")) + v;i++) {
            if (polymarkerList[i].getAnimation() !== null) {
                polymarkerList[i].setAnimation(null);
            } else {
                polymarkerList[i].setAnimation(naver.maps.Animation.BOUNCE);
            }
        }
    });
    //3일차 버튼
    $(document).on('click', '#btnmodalday2', function() {
        for(var j of polymarkerList) {
            j.setAnimation(null);
        }
        var v = parseInt($("#btnmodalday1").attr("value")) + parseInt($("#btnmodalday0").attr("value"));
        for (var i=v;i<parseInt($(this).attr("value")) + v;i++) {
            if (polymarkerList[i].getAnimation() !== null) {
                polymarkerList[i].setAnimation(null);
            } else {
                polymarkerList[i].setAnimation(naver.maps.Animation.BOUNCE);
            }
        }
    });
    //모달 닫기
    $(document).on('click','#tour-cancel',function (){
        closeModal();
    });
    //폼 받기전 데이터 확인
    function checkData(){
        if($("#modaltourname").val()==""){
            alert("투어명을 입력해주세요");
            closeModal();
            return false;
        }
        if($("#modaltourinfo").val()==""){
            alert("투어소개을 입력해주세요");
            closeModal();
            return false;
        }
        if($("#modaltourdate").val()==""){
            alert("투어일정을 선택해주세요");
            closeModal();
            return false;
        }
        if($("#modaltourlist").val().indexOf('"tours":[]')!=-1){
            alert("투어할 카페를 선택해주세요");
            closeModal();
            return false;
        }
        if($("#modaltourlist").val().indexOf('"visit_time":""')!=-1){
            alert("투어할 시간를 선택해주세요");
            closeModal();
            return false;
        }
        alert("투어가 생성 되었습니다");
    }
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
        //마커들 초기화
        for (var mkr of markerList){
            mkr.setAnimation(null);
            mkr.setVisible(false);
        }
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
                if (res.slist.length != 0) {
                    $.each(res.slist, function (i, ele) {
                        s += "<div class='search-result results'>";
                        s += "<div class='result-name'><a href='../cafe/detail?cf_id=" + ele.cf_id + "'>";
                        //이름 너무 길면 짜르기
                        var ncf_nm = ele.cf_nm;
                        if(ncf_nm.length>20)
                        {
                            ncf_nm = ele.cf_nm.substring(0,19)+"...";
                        }
                        s += ncf_nm +"</a>";
                        s += "<span class='tour-icon-set' style='";
                        if(isMakingTour==true){
                            s += "display: '';'>";
                        }else{
                            s += "display: none;'>";
                        }
                        s += "<i class='fa-solid fa-plus add-tour-icon'></i></span>";
                        s += "<i class='fa-solid fa-location-dot map-icon' cf_id='" + ele.cf_id + "'></i></div>";
                        s += "<div class='result-cnt'>리뷰 수: " + ele.cm_cnt + " &nbsp;&nbsp; 좋아요 수: " + ele.ck_cnt + "&nbsp;&nbsp;&nbsp;★" + ele.cm_star + "&nbsp;&nbsp;&nbsp;#" + ele.cg_nm +"</div>";
                        //사진 없으면
                        if (ele.img.length == 0) {
                            s += "<img src='../images/noimage.png'>";
                        } else {
                            $.each(ele.img, function (j, elet) {
                                //보여질 사진 갯수
                                if (j < 4) {
                                    s += "<img src='../images/cafeimg/" + elet.ci_nm + "' style='width:70px;height:70px;'>";
                                }
                            });
                        }
                        s += "</div>";
                        markerList[ele.cf_id-1].setAnimation(naver.maps.Animation.BOUNCE);
                    });
                    //페이징 시작
                    //이전버튼
                    if (res.startPage > 1) {
                        p += "<button type='button' id='btnback' class=‘page-link’>이전</button>";
                    }
                    //중간 숫자 버튼
                    for (var idx = res.startPage; idx <= res.endPage; idx++) {
                        p += "<button type='button' class='page-link btn-pagenum ";
                        if(idx==res.rcurrentPage) {
                            p +=" active-page";
                        }
                        p += "'>" + idx + "</button>";
                    }
                    //다음버튼
                    if (res.endPage < res.totalPage) {
                        p += "<button type='button' id='btnnext' class=‘page-link’>다음</button>";
                    }
                    moveMap(res.slist[0].cf_id);
                }else{
                    //검색어 검색결과가 없을때
                    s += searchword + "에 대한 검색 결과가 없습니다";
                    p = "";
                }
                $("div.paging").html(p);
                $("div.search-list").html(s);
                //검색 결과를 제외한 마커 숨기기
                if (res.list.length != 0){
                    $.each(res.list, function (j, aele) {
                        for(var i in markerList){
                            if (aele.cf_id - 1 == i){
                                markerList[i].setVisible(true);
                            }
                        }
                    });
                }
            }//success
        });//$ajax"searchword"
    });//검색버튼
    //카테고리 검색
    $(document).on('click','.categorybtn',function(){
        $("input.cafe-search-bar").val($(this).text().substring(1));
        $("button.search-btn").trigger('click');
    });

    //검색결과 hover시 그림자 추가
    $(document).on('mouseover','.results',function (){
        $(this).css({
            'background-color': '#dcdcdc'
        });
    });
    $(document).on('mouseout','.results',function (){
        $(this).css({
            'background-color': 'white'
        });
    });
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
            $(this).text("투어닫기");
            $("#maketour").show();
            $(".tour-icon-set").show();
        }else {
            //열려있는 정보창 닫기
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
    $(document).on('click','.detail-div',function(){
        $(this).addClass('active-bar');
        $(this).siblings().removeClass('active-bar');
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
                s += "<div class='cafe-in-tour results' value='" + id + "'>" + res.cf_nm;
                s += "<br>방문 시간: &nbsp;<input type='time' class='visit_time' required='required' value='" + moment().format("HH:mm") + "'>"
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
    });
    //경로확인전 일정 정보를 json형태로 변환
    function clttourlist()
    {
        //반환할 배열 변수생성
        var tourList = [];
        var polyList = [];
        //날짜수 만큼 반복
        $(".detail-div").each(function(i,day){
            //하루 날짜에 해당하는 데이터 배열
            var tourPerDay = [];
            var polyPerDay = [];
            //해당 날짜 카페수 만큼 반복
            $(day).children(".detail-bar-cafe").children().each(function (j,cafe){
                //카페 데이터 담을 공간
                var cafeData = {};
                var polyData = {};
                //카페 id
                cafeData.cf_id = $(cafe).attr("value");
                polyData.cf_id = $(cafe).attr("value");
                //poly에 넣기
                polyPerDay.push(polyData);
                //카페 순서(방문시간)
                cafeData.visit_time =$(cafe).children(".visit_time").val();
                tourPerDay.push(cafeData);
            });
            //날짜 데이터 담을 공간
            var dayData = {};
            //날짜
            dayData.day = $(day).children(".detail-bar-date").text();
            //해당 날짜 투어정보
            dayData.tours = tourPerDay;
            tourList.push(dayData);
            polyList.push(polyPerDay);
        });
        //json형태로 바꾸기
        var tourjson = JSON.stringify(tourList);
        var polyjson = JSON.stringify(polyList);
        $("#tourlist").attr("value",tourjson);
        $("#polylist").attr("value",polyjson);
    }
    //지도 옵션
    var mapOptions = {
        center:new naver.maps.LatLng(37.4993705, 127.0290175),
        zoom: 18
    };
    //지도 초기화
    var map =new naver.maps.Map('map', mapOptions);
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
    //모든카페 위치에 마커찍기
    var position = new naver.maps.LatLng(${dto.loc_y}, ${dto.loc_x});
    var marker = new naver.maps.Marker({
        position: position,
        map: map,
        title:"${dto.cf_nm}",
        visible: false
    });
    //정보창 생성
    //평시
    var infoWindow = new naver.maps.InfoWindow({
        content: `<div class="info-window">
                         <span style="display:none">${dto.cf_id}</span>
                         <a href="../cafe/detail?cf_id=${dto.cf_id}">${dto.cf_nm}</a>
                      </div>`
    });
    //마커를 마커 배열에 넣기
    markerList.push(marker);
    //정보창을 정보창 배열에 넣기
    infoWindowList.push(infoWindow);
    </c:forEach>
    // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
    function getClickHandler(seq) {
        return function(e) {
            var marker = markerList[seq],
                infoWindow = infoWindowList[seq];
            if (infoWindow.getMap()) {
                infoWindow.close();
            } else {
                infoWindow.open(map, marker);
            }
        }
    }
    //맵에 어떠한 변화가 있을때
    naver.maps.Event.addListener(map, 'idle', function() {
        updateMarkers(map, markerList);
        console.log(map.getZoom());
        console.log(map.getCenter());

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
    //모달닫기
    function closeModal(){
        $("#maketourmodal").hide();
    }
</script>
