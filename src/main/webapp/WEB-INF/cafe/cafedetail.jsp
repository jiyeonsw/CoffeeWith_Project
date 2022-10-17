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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <style type="text/css">
        .btn-submit {
            width: 100px;
            margin: 0 4px;
            color: #404040;
            background: #fff;
            min-width: 72px;
            height: 60px;
            padding: 0 15px;
            font-size: 1rem;
            border-radius: 8px;
            border: 1px solid #664400;
            line-height: 33px;
            overflow: hidden;
            position: relative;
            display: inline-block;
            font-weight: 600;
            text-align: center;
        }
        .btn-submit:hover{
            background: #664400;
            color: #fff;
            box-shadow: 2px 2px 2px 2px lightgray;
        }

        div.cafe-main-box{
            width: 900px;
            margin-top:30px;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }
        div.cafe-main-content{
            display: inline-block;
            text-align: left;
        }
        a{
            color: #664400;
        }
        div.cf-top{
            display: flex;
        }

        .ctg-box{
            border: 1px solid #664400;
            border-radius: 25px;
            margin: 0 4px;
            color: #404040;
            background: #fff;
            min-width: 72px;
            height: 35px;
            font-size: 1rem;
            line-height: 35px;
            overflow: hidden;
            position: relative;
            display: inline-block;
            font-weight: 600;
            text-align: center;
            padding-left: 10px;
            padding-right: 10px;
        }
        .ctg-box:hover{
            background: #664400;
            color: #fff;
            box-shadow: 2px 2px 2px 2px lightgray;
        }
        div.cf-txt{
            height:120px;
            word-wrap:break-word;
            display: -webkit-box;
            -webkit-line-clamp:5;
            -webkit-box-orient:vertical;
            overflow: hidden;
        }
        div.cf-txt:hover{
            cursor: pointer;
        }
        div.cf-txt:active{
            overflow: visible;
            display: block;
            height: auto;
            min-height: 120px;
        }

        div.cm-box{
            width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        div.cf-middle{
            display: grid;
            grid-template-columns:  300px 300px 300px ;
            text-align: center;
            padding-top: 5px;
            margin-left: 2px;

        }
        div.cf-middle div.btn-cf-mid{
            font-size: 1.5rem;
            text-align: center;
            cursor: pointer;
            height: 60px;
            padding-bottom: 10px;
            padding-top: 15px;
            border: 2px solid white;
            border-bottom-color: lightgray ;
        }

        div.cf-bottom{
            padding-top: 30px;
            display: flex;
            margin-left: auto;
            margin-right: auto;
            flex-wrap: wrap;
            margin-bottom: 100px;
        }
        div.ci-container{
            display: grid;
            grid-template-rows: 40px auto;
        }
        .btn-ci-card{
            border: 1px solid #664400;
            border-radius: 25px;
            margin: 0 4px;
            color: #404040;
            background: #fff;
            min-width: 72px;
            font-size: 1rem;
            overflow: hidden;
            position: relative;
            display: inline-block;
            font-weight: 600;
            text-align: left;
            padding: 3px 7px 3px 3px;
        }
        .btn-ci-card:hover{
            background: #664400;
            color: #fff;
            box-shadow: 2px 2px 2px 2px lightgray;
        }
        img.img-ci-btn{
            width: 30px;
            height: 30px;
            border-radius: 30px;
            margin-right: 5px;
        }

        div.cf-btm-ci-card-box{
            padding-top: 30px;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            margin-left: auto;
            margin-right: auto;
            flex-wrap: wrap;
        }
        div.carousel-inner{
            border-radius: 10px;
        }
        div.ci-card {
            width: 350px;
            overflow: hidden;
            border-radius: 10px;
        }

        div.ci-st {
            width: 100%;
            height: 350px;
            background: 50% 100% no-repeat;
            background-size: cover;
            object-fit: cover;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        div.ci-mini-card {
            height: 225px;
            overflow: hidden;
            cursor: pointer;
        }
        .ci-mini-card-inr {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.6s;
            transform-style: preserve-3d;
        }

        div.ci-mini-st {
            width: 225px;
            height: 100%;
            border-radius: 10px;
            background: 50% 100% no-repeat;
            background-size: cover;
            object-fit: cover;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
            margin-bottom: 10px;
        }
        div.ci-mini-st-bk{
            width: 225px;
            height: 100%;
            border-radius: 10px;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
            margin-bottom: 10px;
        }
        div.ci-mini-bk-img{
            width: 225px;
            height: 100px;
            border-radius: 10px;
            background: 50% 100% no-repeat;
            background-size: cover;
            object-fit: cover;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
        }

        div.mform{
            width: 700px;
            margin-bottom: 15px;
        }
        #mform fieldset{
            display: flex;
            flex-direction: row-reverse;
            font-size: 30px;
            line-height: 2.5rem;
            justify-content: space-around;
            padding: 0 0.2em;
            text-align: center;
            width: 5em;
        }
        #mform fieldset legend{
            text-align: right;
        }
        #mform input[type=radio]{
            display: none;
        }
        #mform label{
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 1.5px;
            -webkit-text-stroke-color: #2b2a29;
            cursor: pointer;
        }
        #mform label:hover{
            -webkit-text-fill-color: #fff58c;
        }
        #mform label:hover ~ label{
            -webkit-text-fill-color: #fff58c;
        }
        #mform input[type=radio]:checked ~ label{
            -webkit-text-fill-color: gold;
        }
        span.cm-star{
            color: rgba(250, 208, 0, 0.99);
        }
        span.cm-star-n{
            color: lightgray;
        }
        div#btn-ck{cursor: pointer; width: 70px;}
        span.cm-edit-del{
            float:right;
            cursor: pointer;
        }
        pre{
            color: inherit;
            font-family: inherit;
            font-size:inherit ;
        }
        #cm-i-box{
            margin-top: 5px;
            vertical-align: top;
        }
        #btn-img{
            width: 60px;
            color: #404040;
            background: #fff;
            min-width: 72px;
            height: 60px;
            padding: 0 10px;
            font-size: 20px;
            border-radius: 8px;
            border: 1px solid #664400;
            line-height: 33px;
            overflow: hidden;
            position: relative;
            display: inline-block;
            font-weight: 600;
            text-align: center;
        }
        #btn-img:hover{
             background: #664400;
             color: #fff;
             box-shadow: 2px 2px 2px 2px lightgray;
         }
        #btn-img-cmt{
            margin-top: -5px;
            font-size: 15px;
        }
        #btn-img:hover div#btn-img-cmt {
            color: #fff;
        }
        #btn-img:hover #img-icon{
            color: #fff;
        }
        img.cmt-img{
            border-radius: 4px;
            height: 60px;
            border: 1px solid gray;
            margin-right: 4px;
            margin-top: 20px;
        }
        div.cm-order-box{
            display: grid;
            grid-template-columns: 100px 600px;
        }
        #cm-order{
            width: 600px;
            text-align: right;
        }

        div.cm-box-each{
            padding: 10px 10px 10px 10px;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            margin-bottom: 10px;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
        }
        div#cf-img-car{
            width: 350px;
            background-size: cover;
            border-radius: 15px;
        }
        div.cf-info{
            padding-top: 20px;
            width: 500px;
            overflow: clip;
        }
        span.cf-info-key{
            color: darkgray;
            display: inline-block;
            width: 65px;
        }
        span.cf-info-key i{
            color: darkgray;
        }
        div.cm-list-box{
            display: flex;
        }
        div.cm-cm-list{
            margin-top: 10px;
        }
        #map{
            margin-left: 20px;
            border: 1px solid #664400;
            border-radius: 20px;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
        }
        div.cmt-show-hide{
            display: none;
        }
        /*modal*/
        #ciModal{
            background-color: rgba(0,0,0,0.5);
        }
        #ciModal-content{
            width: 500px;
            position:absolute;
            top:50%;
            left:50%;
            margin-left:-275px;
            margin-top: 50px;
            border: 0px;
            border-radius: 0.5rem 0.5rem 0.5rem 0.5rem;
        }
        div.modal-img img{
            border-radius: 0.5rem 0.5rem 0.5rem 0.5rem;
        }
        button.modal-close{
            position: absolute;
            top: 20px;
            left: 460px;
            background-color: lightgray;
            border-radius: 50px;
            opacity: 0.5;
        }
        div.modal-header{
            padding: 0px 0px 0px 0px;
            border: 0px;
        }
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <script>
        $(function () {
            cf_id=${dto.cf_id};
            login_ok='${sessionScope.login_ok}';
            ur_id="${sessionScope.login_id }";
            on_error_cf="this.src='${root}/images/logo1.png'";
            on_error_prf="this.src='${root}/images/noprofile.jpg'";
            $("#btn-cf-info").css("border-bottom-color","Sienna");
            cfMap(cf_id);

            $("div.btn-cf-mid").mouseover(function (){
                $(this).siblings().css("border-bottom-color","lightgray");
                $(this).css("border-bottom-color","Sienna");
            });
        });//fun

    </script>

</head>
<body>


<div class="cafe-main-box">
<div class="cafe-main-content">

    <div>&nbsp<a class="back" href="javascript:back();"><i class="fa-solid fa-map-location-dot"></i>&nbsp;맵으로 돌아가기</a></div><br>
    <div class="cf-top">
        <!-- Carousel -->
        <div id="cf-img-car" class="carousel slide" data-bs-ride="carousel" style="width: 350px; height: 350px; background-image:url('${root}/images/logo1.png');">
            <!-- Indicators/dots -->
            <div class="carousel-indicators" >
                <c:forEach items="${list}" var="dtoi" varStatus="i">
                    <button type="button" data-bs-target="#cf-img-car" data-bs-slide-to="${i.index}"
                            <c:if test="${i.index==0}"> class="active"</c:if>
                    ></button>
                </c:forEach>
            </div>
            <!-- The slideshow/carousel -->
            <div class="carousel-inner" style="width: 350px;">

                <c:forEach items="${list}" var="dtoi" varStatus="i">
                    <div class="carousel-item ${i.count==1?'active':''}" >
                        <div class="ci-card">
                            <c:set var="ci_path" value="url('${root}${dtoi.ci_path}${dtoi.ci_nm}')"/>
                            <div class="ci-st" style="background-image:${ci_path}">
                            </div></div>
                    </div>
                </c:forEach>
            </div> <!--carousel-inner-->

            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#cf-img-car" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#cf-img-car" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <!--메인정보-->
        <div style="margin-left: 30px;">
            <div><h1>${dto.cf_nm}</h1></div>
            <div style="margin-bottom: 15px;">
                <c:forEach items="${listctg}" var="ctg">
                    <button class="ctg-box">#${ctg.cg_nm}</button>&nbsp;
                </c:forEach>
            </div>
            <div class="cf-txt">${dto.cf_txt}</div>
            <br>
            <div class="loc-cm-lk">
            <div><span class="cf-info-key">위치<i class="bi bi-geo-alt"></i></span>&nbsp;<span>${dto.loc_addr} </span></div>
            <div><span class="cf-info-key">리뷰<i class="bi bi-chat-dots"></i></span>&nbsp;<span><span class="cm-cnt">${dto.cm_cnt}</span>
                   <c:if test="${dto.cm_star==-1}">
                       (<span class="cm-star" style="color: gray">★</span><span class="cm-star-avg">-</span>)
                   </c:if>
                   <c:if test="${dto.cm_star>-1}">
                       (<span class="cm-star">★</span><span class="cm-star-avg">${dto.cm_star}</span>)
                   </c:if>
               </span></div>
            <hr>
            <div id="btn-ck">
                <c:if test="${dto.ck_cnt==0}"><i class="fa-regular fa-heart"></i>&nbsp;</c:if>
                <c:if test="${dto.ck_cnt>0}"><i class="fa-solid fa-heart"></i>&nbsp;</c:if>
                <span id="ck-cnt">${dto.ck_cnt}</span></div>
            </div>
        </div>
    </div> <!--cf_top-->
    <br>
        <div class="cf-middle">
            <div class="btn-cf-mid" id="btn-cf-info">카페정보</div><div id="btn-cm-link" class="btn-cf-mid" >리뷰(<span class="cm-cnt">${dto.cm_cnt}</span>)</div><div id="btn-ci-link" class="btn-cf-mid" >사진</div>
        </div>
        <div class="cf-bottom">
            <div id="map" y="${dto.loc_y}" x="${dto.loc_x}" style="width:320px;height:320px;"></div>
            <div style="margin-left: 30px;" class="cf-info">
                <div><span class="cf-info-key">영업시간</span> <span class="cf-info-val">${dto.open_time}</span></div>
                <div><span class="cf-info-key">휴무일</span> <span class="cf-info-val">${dto.off_day}</span></div>
                <div><span class="cf-info-key">전화번호</span> <span class="cf-info-val">${dto.cf_tel}</span></div>
                <div><span class="cf-info-key">주소</span> <span class="cf-info-val">${dto.loc_addr}</span></div>
                <div><span class="cf-info-key">대표메뉴</span> <span class="cf-info-val">${dto.menu}</span></div>
            </div>
        </div>
    <script>
        ////////////////////////////////////////////////////////////////// 카페메인정보 관련 함수 //////////////////////////////////////////////////////////////////

        //하트클릭
        $("div#btn-ck").click(function (){

            if(ur_id==""){alert("로그인이 필요합니다");}
            else {
                $.ajax({
                    type: "get",
                    url: "select_like",
                    dataType: "json",
                    data: {"ur_id": ur_id, "cf_id": cf_id},
                    success: function (res) {
                        var ck_chk = res.ck_chk;
                        if (ck_chk == 0) {
                            $.ajax({
                                type: "get",
                                url: "insert_like",
                                dataType: "json",
                                data: {"ur_id": ur_id, "cf_id": cf_id},
                                success: function (res) {
                                    var ck_cnt= res.ck_cnt;
                                    //console.log(ck_cnt);
                                    var pre_ck_cnt=$("#ck-cnt").text();
                                    if (pre_ck_cnt==0){
                                        $("#btn-ck").find("svg").removeClass("fa-regular");
                                        $("#btn-ck").find("svg").addClass("fa-solid");
                                    }
                                    $("#ck-cnt").html(ck_cnt);
                                }//suc
                            });//ajax insert
                        } else {
                            $.ajax({
                                type: "get",
                                url: "delete_like",
                                dataType: "json",
                                data: {"ur_id": ur_id, "cf_id": cf_id},
                                success: function (res) {
                                    var ck_cnt= res.ck_cnt;
                                    var pre_ck_cnt=$("#ck-cnt").text();
                                    if (pre_ck_cnt==1){
                                        $("#btn-ck").find("svg").removeClass("fa-solid");
                                        $("#btn-ck").find("svg").addClass("fa-regular");
                                    }
                                    $("#ck-cnt").text(ck_cnt);
                                }//suc
                            });//aj del
                        }
                    }//suc
                });//ajax
            }//else
        });//하트클릭

        ////////////////////////////////////////////////////////////////// 카페상세정보 관련 함수 //////////////////////////////////////////////////////////////////
        //카페정보 클릭
        $("div#btn-cf-info").click(function (){
            $("div#btn-cf-info").css("border-bottom-color","Sienna");
            $("div#btn-cm-link").css("border-bottom-color","lightgray");
            $("div#btn-ci-link").css("border-bottom-color","lightgray");

            var s="";
            $.ajax({
                type: "get",
                url: "info",
                dataType: "json",
                data: {"cf_id": cf_id},
                success: function (res) {
                    //console.log(res.loc_y);
                    s+='<div id="map" y="'+res.loc_y+'" x="'+res.loc_x+'" style="width:300px;height:300px;"></div>';
                    s+='<div style="margin-left: 30px;">';
                    s+='<div><span class="cf-info-key">영업시간</span> <span>'+ res.open_time+'</span></div>';
                    s+= '<div><span class="cf-info-key">휴무일</span> <span>'+res.off_day+'</span></div>';
                    s+='<div><span class="cf-info-key">전화번호</span> <span>'+res.cf_tel+'</span></div>';
                    s+='<div><span class="cf-info-key">주소</span> <span>'+res.loc_addr+'</span></div>';
                    s+='<div><span class="cf-info-key">대표메뉴</span> <span>'+res.menu+'</span></div>';
                    s+='</div>';
                    $("div.cf-bottom").html(s);
                    cfMap(cf_id);
                }//succ

            });//ajax
        });//cafeinfo

        ////////////////////////////////////////////////////////////////// 카페리뷰 관련 함수 //////////////////////////////////////////////////////////////////
        //리뷰클릭
        $("div#btn-cm-link").click(function (){
            //console.log(cf_id);
            $("div#btn-cf-info").css("border-bottom-color","lightgray");
            $("div#btn-cm-link").css("border-bottom-color","Sienna");
            $("div#btn-ci-link").css("border-bottom-color","lightgray");
            cmList();
        });//리뷰
        //리뷰사진만
        $(document).on("click","#only-img-review",function (){
            if($("#only-img-review").is(":checked")){
                $("div.null_id_1").hide();
            }else {
                $("div.null_id_1").show();
            }
        })//리뷰사진만

        //리뷰 정렬
        $(document).on("click","a.cm-order",function (){
                var cm_order=$(this).attr("cm_order");
                //console.log(cm_order);
                cmListOnly(cm_order);
        });//정렬each

        //리뷰 사진 클릭
        $(document).on("click","#btn-img",function (){
            $("#cm-i-upload").trigger("click");
        });///on 리뷰사진클릭

        //file 선택
        $(document).on("change","#cm-i-upload",function (e){
            //console.log("사진클릭함");
            var files=e.target.files;
            var arr=Array.prototype.slice.call(files);

            for(var i=0;i<files.length;i++){
                if(!checkExtension(files[i].name,files[i].size)){
                    return false;
                }
            }
            $("#cm-i-preview").empty();
            preview(arr);

        }); //on file 선택

        //리뷰 등록
        $(document).on("click","#btnmsave",function (){
            //multifile formdate에 넣기
            var formData=new FormData();
            var inputFile=$('#cm-i-upload');
            var files=inputFile[0].files;
            //console.log(files.length);
            for(var i = 0; i < files.length; i++){
                //console.log(files[i]);
                formData.append("uploadFiles", files[i]);
            };//for

            //나머지 정보 formdata에 넣기
            var fdata=$("#mform").serializeArray();
            //console.log(fdata);
            fdata.forEach(function(data) {
                formData.append(data["name"], data["value"]);
            });

            $.ajax({
                type: "post",
                url: "insert_cmt",
                data: formData,
                processData:false,
                contentType:false,
                dataType: "json",
                success: function (res) {
                    cmList();
                    var cm_cnt = res.cm_cnt;
                    var cm_star=res.cm_star;
                    $("span.cm-cnt").text(cm_cnt);
                    var pre_star = $("span.cm-star-avg").text();
                    //console.log(pre_star);
                    if (pre_star=="-" && cm_star!=-1){
                        $("span.cm-star").css("color",'rgba(250, 208, 0, 0.99)');
                    }
                    if(cm_star==-1){ $("span.cm-star-avg").text('-'); }
                    else{$("span.cm-star-avg").text(cm_star);}
                }//succ
            });//ajax
        });//리뷰등록

        // 리뷰삭제
        $(document).on("click",".cm-del",function (){
            var cm_id=$(this).attr("cm_id");
            var cf_id=$(this).attr("cf_id");
            if (confirm("정말 삭제하실 건가요? ")) {
                //console.log(cm_id);
                $.ajax({
                    type: "get",
                    url: "delete_cmt",
                    data: {"cm_id": cm_id, "cf_id": cf_id},
                    dataType: "json",
                    success: function (res) {
                        $("div#btn-cm-link").trigger('click');
                        var cm_cnt = res.cm_cnt;
                        var cm_star = res.cm_star;
                        console.log(cm_star);
                        $("span.cm-cnt").text(cm_cnt);
                        var pre_star = $("span.cm-star-avg").text();
                        console.log(pre_star);
                        if (cm_star == -1) {
                            $("span.cm-star").css("color", 'gray');
                            $("span.cm-star-avg").text("-");
                        } else {
                            $("span.cm-star-avg").text(cm_star);
                        }
                    }//succ
                });//ajax
            }
        });//리뷰삭제

        // 리뷰수정클릭시 내용 넣기
        $(document).on("click",".cm-edit",function (){
            var cm_id=$(this).attr("cm_id");
            //console.log(cm_id);
            $.ajax({
                type: "get",
                url: "select_cmt_by_cmid",
                data: {"cm_id": cm_id},
                dataType: "json",
                success: function (res) {
                    var cm_txt=res.cm_txt;
                    var star=6-res.star;
                    $("#cm_txt").val(cm_txt);
                    var cm_input='<input type="hidden" name="cm_id" value="'+cm_id+'">';
                    $("#cm_txt").after(cm_input);
                    $("#btnmsave").text("리뷰수정");
                    $("#btnmsave").attr("id","btnmedit");
                    $("#rate"+star).trigger("click");
                }//succ
            });//ajax
        });//리뷰수정클릭시 내용 넣기

        //리뷰수정버튼클릭
        $(document).on("click","#btnmedit",function (){

            var udata=$("#mform").serialize();
            //console.log(cm_id);
            $.ajax({
                type: "post",
                url: "update_cmt",
                data: udata,
                dataType: "text",
                success: function (res) {
                    cmList();
                }//succ
            });//ajax
        });//리뷰수정버튼클릭

        //리뷰댓글보기
        $(document).on("click","a.view-cm-cm",function (){
            var ccf='';
            var rg=$(this).attr("rg");
            var rs=$(this).attr("rs");
            var rl=$(this).attr("rl");
            $(this).parent().find("a").attr("id","other-cmt");
            $(this).attr("id","this-cmt");

            var comment='댓글 로딩 중 &nbsp;<i class="fa-solid fa-spinner"></i>';
            $("div.cm-cm-list").html(comment);
            if(login_ok=="yes"){
                ccf+='<div class="ccform-div">';
                ccf+='<form class="ccform">';
                ccf+='<input type="hidden" name="cf_id" value="${dto.cf_id }">';
                ccf+='<input type="hidden" name="ur_id" value="${sessionScope.login_id }">';
                ccf+='<input type="hidden" name="rg" value='+rg+'>';
                ccf+='<input type="hidden" name="rs" value='+rs+'>';
                ccf+='<input type="hidden" name="rl" value='+rl+'>';
                ccf+='<input type="hidden" name="star" value="0">';
                ccf+='<input type="file" class="cc_upload" style="display: none" multiple="multiple">';
                ccf+='<br><div class="input-group">';
                ccf+='<textarea name="cm_txt" style=" height: 60px;" class="form-control cm-cm-txt"></textarea>';
                ccf+='<button type="button" class="btn-cc-save btn-submit" rg='+rg+' cf_id="${dto.cf_id }">댓글등록</button>';
                ccf+='</form></div>';
            }
            $(this).next().find("div.cm-cm-form").html(ccf);
            $(this).parent().siblings("div.cm-box-each").find("div.cmt-show-hide").hide();
            $(this).parent().siblings("div.cm-box-each").find("i.view-cmt").addClass("bi-caret-down-fill");
            $(this).parent().siblings("div.cm-box-each").find("i.view-cmt").removeClass("bi-caret-up-fill");
            $(this).parent().siblings("div.cm-box-each").find("form").removeClass("ccform");
            $(this).next().find("form").addClass("ccform");
            if($("div").hasClass("ccform-div")){
                $('.ccform')[0].reset();}
            ccList(${dto.cf_id},rg);
            $(this).next().slideToggle(1000);
            $(this).find("i.view-cmt").toggleClass("bi-caret-down-fill");
            $(this).find("i.view-cmt").toggleClass("bi-caret-up-fill");
        });//리뷰댓글보기

        //리뷰댓글등록
        $(document).on("click",".btn-cc-save",function (){
            var cmcm_cnt = Number($("#this-cmt").find("span.cmcm-cnt").text());

            var rg=$(this).attr("rg");
            //console.log(rg);
            var cf_id=$(this).attr("cf_id");
            //console.log(cf_id);
            var formData =new FormData();
            formData.append("uploadFiles",$(".cc_upload")[0].files[0]);
            var ccdata=$(".ccform").serializeArray();
           //console.log(ccdata);
            ccdata.forEach(function(data) {
                formData.append(data["name"], data["value"]);
            });
            $(".cm-cm-txt").val('');

            $.ajax({
                type: "post",
                url: "insert_cmt",
                processData:false,
                contentType:false,
                data: formData,
                dataType: "json",
                success: function (res) {
                    ccList(cf_id,rg);
                    var cm_cnt = res.cm_cnt;
                    $("span.cm-cnt").text(cm_cnt);
                    cmcm_cnt = cmcm_cnt+1;
                    console.log(cmcm_cnt);
                    $("#this-cmt").find("span.cmcm-cnt").text(cmcm_cnt);
                }//succ
            });//ajax
        });//리뷰댓글등록

        // 리뷰댓글수정클릭시 내용 넣기
        $(document).on("click",".cc-edit",function (){
            var cm_id=$(this).attr("cm_id");
            var rg=$(this).attr("rg");
            //console.log(cm_id);
            $.ajax({
                type: "get",
                url: "select_cmt_by_cmid",
                data: {"cm_id": cm_id},
                dataType: "json",
                success: function (res) {
                    var cm_txt=res.cm_txt;
                    $(".cm-cm-txt").val(cm_txt);
                    var cm_input='<input type="hidden" name="cm_id" value="'+cm_id+'">';
                    $(".cm-cm-txt").after(cm_input);
                    $(".btn-cc-save").text("댓글수정");
                    $(".btn-cc-save").attr("rg",rg);
                    $(".btn-cc-save").addClass("btn-cc-edit");
                    $(".btn-cc-edit").removeClass("btn-cc-save");
                }//succ
            });//ajax
        });//리뷰댓글수정클릭시 내용 넣기

        //리뷰댓글수정버튼클릭
        $(document).on("click",".btn-cc-edit",function (){
            var rg=$(this).attr("rg");
            var cudata=$(".ccform").serialize();
            console.log(cudata);
            //console.log(cm_id);
            $.ajax({
                type: "post",
                url: "update_cmt",
                data: cudata,
                dataType: "text",
                success: function (res) {
                    ccList(cf_id,rg);
                    $(".btn-cc-edit").addClass("btn-cc-save");
                    $(".btn-cc-save").removeClass("btn-cc-edit");
                    $(".cm-cm-txt").val('');
                    $(".btn-cc-save").text("댓글등록");
                }//succ
            });//ajax
        });//리뷰댓글수정버튼클릭

        ////////////////////////////////////////////////////////////////// 카페사진모음 관련 함수 //////////////////////////////////////////////////////////////////
        //사진클릭
        $("div#btn-ci-link").click(function (){
            $("div#btn-cf-info").css("border-bottom-color","lightgray");
            $("div#btn-cm-link").css("border-bottom-color","lightgray");
            $("div#btn-ci-link").css("border-bottom-color","Sienna");
            //console.log(cf_id);
            $.ajax({
                type: "get",
                url: "img",
                dataType: "json",
                data: {"cf_id": cf_id},
                success: function (res) {
                    var s='<div class="ci-container">';
                    s+='<div class="ci-ctg"><button class="btn-ci-card" ctg="all"><img class="img-ci-btn" src="${root}'+res.ci_path+res.cf_img+'" onError="'+on_error_cf+'" >' +
                        '전체사진</button>';
                    s+='<button class="btn-ci-card" ctg="cf"><img class="img-ci-btn" src="${root}'+res.ci_path+res.cf_img+'" onError="'+on_error_cf+'" >' +
                        '카페사진</button>';
                    s+='<button class="btn-ci-card" ctg="cm"><img class="img-ci-btn" src="${root}'+res.cmi_path+res.cm_img+'" onError="'+on_error_cf+'" >' +
                        '리뷰사진</button>';
                    s+='<button class="btn-ci-card" ctg="fd"><img class="img-ci-btn" src="${root}'+res.fdi_path+res.fd_img+'" onError="'+on_error_cf+'" >' +
                        '커뮤니티사진</button></div><div class="cf-btm-ci-card-box">';
                    $.each(res.all_img_list, function (i, elt) {
                        s+='<div class="ci-mini-card">';
                        var ci_path = '${root}'+elt.ci_path + elt.ci_nm ;
                        var ci_path_url="url('"+ci_path+"')";
                        s+='<div class="ci-mini-card-inr">';
                        s+='<div class="ci-mini-st" style="background-image:'+ci_path_url+'" ';
                        s+='data-bs-toggle="modal" data-bs-target="#ciModal" ';
                        s+='modal-cm-txt="'+elt.cm_txt+'" modal-fd-txt="'+elt.fd_txt+'"';
                        s+='modal-ur-nk="'+elt.ur_nk+'" modal-ur-img="'+elt.ur_img+'">';
                        s+='</div>';
                        s+='</div></div>';
                    });//each
                    s+='</div></div>';
                    $("div.cf-bottom").html(s);
                }//succ
            });//ajax
        });//사진 클릭div.ci-mini-st-bk


        //사진각각클릭
        $(document).on("click",".ci-mini-st",function (){
            var modal_img=$(this).css("background-image").replace(/^url\(['"](.+)['"]\)/, '$1');
            //console.log(modal_img);
            var modal_img_tag='<img src="'+modal_img+'" width="500px;">';
           $(".modal-img").html(modal_img_tag);
            var modal_cm_txt=$(this).attr("modal-cm-txt");
            var modal_fd_txt= $(this).attr("modal-fd-txt");
            var ur_nk=$(this).attr("modal-ur-nk");
            var ur_img=$(this).attr("modal-ur-img");
            var s="";
            //console.log(modal_txt);
            if(modal_cm_txt!='null') {
                s+='<img src="${root}/res/prfimg/'+ur_img+'" onError="'+on_error_prf+'" style="width: 30px; height: 30px; border-radius: 100px;">&nbsp;'+ur_nk;
                s+='<div style="text-align: center; margin-top: 20px" >'+modal_cm_txt+'</div>';
                $(".modal-body").html(s);
                $(".modal-body").css("height","100px");
                $(".modal-body").css("padding","10px");
            }else if(modal_fd_txt!='null' ){
                s+='<img src="${root}/res/prfimg/'+ur_img+'" onError="'+on_error_prf+'" style="width: 30px; height: 30px; border-radius: 100px;">&nbsp;'+ur_nk;
                s+='<div style="text-align: center; margin-top: 20px" >'+modal_fd_txt+'</div>';
                $(".modal-body").html(s);
                $(".modal-body").css("height","100px");
                $(".modal-body").css("padding","10px");
            }
            else {
                $(".modal-body").html("");
                $(".modal-body").css("height","0px");
                $(".modal-body").css("padding","0px");
            }
        });//사진각각클릭

        //사진카테고리클릭
        $(document).on("click",".btn-ci-card",function (){
            var ctg=$(this).attr("ctg");
            //console.log(ctg);

            var s="";
            $.ajax({
                type: "get",
                url: "img_ctg",
                dataType: "json",
                data: {"cf_id": cf_id,"ctg": ctg},
                success: function (res) {
                    $.each(res, function (i, elt) {
                        s+='<div class="ci-mini-card">';
                        var ci_path = '${root}'+elt.ci_path + elt.ci_nm ;
                        var ci_path_url="url('"+ci_path+"')";
                        s+='<div class="ci-mini-card-inr">';
                        s+='<div class="ci-mini-st" style="background-image:'+ci_path_url+'" ';
                        s+='data-bs-toggle="modal" data-bs-target="#ciModal" ';
                        s+='modal-cm-txt="'+elt.cm_txt+'" modal-fd-txt="'+elt.fd_txt+'"';
                        s+='modal-ur-nk="'+elt.ur_nk+'" modal-ur-img="'+elt.ur_img+'">';
                        s+='</div>';
                        s+='</div></div>';
                    });//each
                    s+='</div>';
                    $("div.cf-btm-ci-card-box").html(s);
                }//su
            })//aj
        });//사진카테고리클릭

        ////////////////////////////////////////////////////////////////// 일반 함수 //////////////////////////////////////////////////////////////////
        //파일 사진 확인
        function checkExtension(fileName,fileSize){
            var regex = new RegExp("(.*?)\.(jpg|png|jpeg)$");
            var maxSize = 20971520;  //20MB

            if(fileSize >= maxSize){
                alert('파일 사이즈 초과');
                $("input[type='file']").val("");  //파일 초기화
                return false;
            }

            if(!regex.test(fileName)){
                alert('업로드 불가능한 파일이 있습니다.');
                $("input[type='file']").val("");  //파일 초기화
                return false;
            }
            return true;
        }
        //리뷰사진미리보기
        function preview(arr){
            arr.forEach(function(f, i){
                //이미지 파일 미리보기
                var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                    var str = '<img src="'+e.target.result+'" class="cmt-img" >';
                    $(str).appendTo("#cm-i-preview");
                }
                reader.readAsDataURL(f);
            });//each;
        }//미리보기

        // 리뷰리스트
        function cmList(){
            var s='<div class="cm-box">';
            var cm_cnt=${dto.cm_cnt};
            if(cm_cnt==0){s+='<div>아직 리뷰가 없습니다. 첫번째 리뷰를 남겨주세요!</div><br>';}
            if(login_ok=="yes"){
                s+='<div class="mform">';
                s+='<div> &nbsp;${sessionScope.login_nick}님, 리뷰를 남겨주세요!</div>';
                s+='<form id="mform" enctype="multipart/form-data">';
                s+='<input type="hidden" name="cf_id" value="${dto.cf_id }">';
                s+='<input type="hidden" name="ur_id" value="${sessionScope.login_id }">';
                s+='<input type="hidden" name="rg" value="-1">';
                s+='<input type="hidden" name="rs" value="0">';
                s+='<input type="hidden" name="rl" value="0">';
                s+='<fieldset>';
                s+='<input type="radio" name="star" value="5" id="rate1"><label for="rate1">★</label>';
                s+='<input type="radio" name="star" value="4" id="rate2"><label for="rate2">★</label>';
                s+='<input type="radio" name="star" value="3" id="rate3"><label for="rate3">★</label>';
                s+='<input type="radio" name="star" value="2" id="rate4"><label for="rate4">★</label>';
                s+='<input type="radio" name="star" value="1" id="rate5"><label for="rate5">★</label>';
                s+='</fieldset>';
                s+='<input type="file" id="cm-i-upload" style="display: none" multiple="multiple">';
                s+='<div class="input-group">';
                s+='<textarea name="cm_txt" id="cm_txt" style="height: 60px;" class="form-control"></textarea>';
                s+='<button type="button" id="btnmsave" class="btn-submit">리뷰등록</button>';
                s+='</div> <div id="cm-i-box"><button type="button" id="btn-img">';
                s+='<i class="bi bi-images" id="img-icon"></i><div id="btn-img-cmt">사진선택</div></button>';
                s+='&nbsp;&nbsp;<span id="cm-i-preview"></span></div>'
                s+='</form></div>';
            }else {
                s+='<div>';
            }
            s+='<div class="cf-bottom-cmlist"></div></div>';
            $("div.cf-bottom").html(s);

            cmListOnly("date_desc");
        }//리뷰리스트

        //리뷰리스트출력
        function cmListOnly(cm_order){
            var cl='';
            $.ajax({
                type: "get",
                url: "select_cmt_order",
                dataType: "json",
                data: {"cf_id": cf_id,"cm_order":cm_order,"rl":0},
                success: function (res) {
                    cl+='<div class="cm-order-box"><label><input type="checkbox" id="only-img-review">&nbsp;사진리뷰만</input></label><span id="cm-order" ><a class="cm-order" href="#cm-order" cm_order="date_desc">최신순</a>&nbsp;|&nbsp;<a class="cm-order" href="#cm-order" cm_order="star_desc">별점높은순</a>';
                    cl+='&nbsp;|&nbsp;<a class="cm-order" href="#cm-order" cm_order="star_asc">별점낮은순</a></span></div><br><div id="cm-list_more">';
                    $.each(res, function (i, elt) {
                        if(elt.rl==0){
                            cl+='<div class="cm-box-each null_id_'+elt.img_null_id+'"><div style="width: 660px;">';
                            if (elt.ur_img==null){ elt.ur_img='noprofile.jpg';}
                            cl+='<img src="${root}/res/prfimg/'+elt.ur_img+'" onError="'+on_error_prf+'" style="width: 30px; height: 30px; border-radius: 100px;">&nbsp;'+elt.ur_nk;
                            if(elt.ur_id=='${sessionScope.login_id }'){
                                cl+='<span class="cm-edit-del"><i class="fa-solid fa-pen-to-square cm-edit" cm_id="'+elt.cm_id+'" ></i>&nbsp;&nbsp;';
                                cl+='<i class="fa-solid fa-trash cm-del" cm_id="'+elt.cm_id+'" cf_id="'+cf_id+'"></i></span>';}
                            cl+='</div>';
                            cl+='<div><span class="cm-star">';
                            var i=0;
                            while(i<elt.star){cl+='★'; i++;}
                            cl+='</span>';
                            if(elt.star==0){cl+="-"}
                            else{
                                cl+='<span class="cm-star-n">';
                                var i=0;
                                while(i<5-elt.star){cl+='★'; i++;}
                                cl+='</span>';}
                            cl+='&nbsp;&nbsp;&nbsp;<span>'+elt.w_date+'</span></div>';
                            if(!(elt.img.length==0)){
                                <!-- Carousel -->
                                cl+='<div id="cmt-img-car" class="carousel slide" data-bs-ride="carousel" style="width: 350px; height: 350px;">';
                                <!-- The slideshow/carousel -->
                                cl+='<div class="carousel-inner">';
                                $.each(elt.img, function (idx, eimg) {
                                    cl+='<div class="carousel-item '+(idx==0?"active":"")+'">';
                                    cl+='<div class="ci-card">';
                                    var cmi_path ="url('${root}"+eimg.ci_path+eimg.ci_nm+"'), url('${root}/images/loading.gif')";
                                    cl+='<div class="ci-st" style="background-image:'+cmi_path+'">';
                                    cl+='</div></div></div>';
                                })//img each
                                cl+='</div>';
                                <!-- Left and right controls/icons -->
                                cl+='<button class="carousel-control-prev" type="button" data-bs-target="#cmt-img-car" data-bs-slide="prev">';
                                cl+='<span class="carousel-control-prev-icon"></span></button>';
                                cl+='<button class="carousel-control-next" type="button" data-bs-target="#cmt-img-car" data-bs-slide="next">';
                                cl+='<span class="carousel-control-next-icon"></span></button></div>';
                            }
                            cl+='<pre>'+elt.cm_txt+'</pre>';
                            cl+='<a href="javascript:;" class="view-cm-cm" rg='+elt.rg+' rs='+elt.rs+' rl='+elt.rl+'><span class="view-cmt-txt"> 댓글보기 (<span class="cmcm-cnt">'+ (elt.cm_cnt-1)+'</span>)</span> <i class="bi bi-caret-down-fill view-cmt"></i> </a>';
                            cl+='<div class="cmt-show-hide"><div class="cm-cm-form" ></div>';
                            cl+='<div class="cm-list-box"><i class="bi bi-arrow-return-right" style="margin-top: 10px;"></i>&nbsp;&nbsp;';
                            cl+='<div class="cm-cm-list">댓글 로딩 중&nbsp;<i class="fa-solid fa-spinner"></i></div></div></div></div>';
                        }
                    });//each
                    cl+='</div></div>';
                    $("div.cf-bottom-cmlist").html(cl);
                }//succ
            });//ajax
        }

        //리뷰댓글리스트
        function ccList(cf_id,rg){
            //console.log(cf_id);
            //console.log(rg);
            $.ajax({
                type: "get",
                url: "select_cmt_order",
                dataType: "json",
                data: {"cf_id": cf_id,"cm_order":"date_asc","rl":1},
                success: function (res) {
                    var ccl='';
                    var cnt=0;
                    $.each(res, function (i, elt) {
                        if(elt.rg==rg){

                            cnt++;
                            ccl+='<div style="width: 620px; ">';
                            ccl+='<img src="${root}/res/prfimg/'+elt.ur_img+'" onError="'+on_error_prf+'"  style="width: 30px; height: 30px; border-radius: 100px;">&nbsp;'+elt.ur_nk;
                            if(elt.ur_id=='${sessionScope.login_id }'){
                                ccl+='<span class="cm-edit-del"><i class="fa-solid fa-pen-to-square cc-edit" rg='+elt.rg+' cm_id="'+elt.cm_id+'" ></i>&nbsp;&nbsp;';
                                ccl+='<i class="fa-solid fa-trash cm-del" cm_id="'+elt.cm_id+'" cf_id="'+cf_id+'"></i></span>';}
                            ccl+='</div>';
                            ccl+='<div><span>'+elt.w_date+'</span></div>';
                            ccl+='<pre>'+elt.cm_txt+'</pre><hr>';
                        }
                    });//each
                    if(cnt===0){
                        ccl+='댓글이 없어요 &nbsp;<i class="fa-regular fa-face-sad-tear"></i>';
                    }
                    $("div.cm-cm-list").html(ccl);
                }
            });//ajax
        }//리뷰댓글리스트

        //지도 그리기
        function cfMap(cf_id){
            y= $("div#map").attr("y");
            x=$("div#map").attr("x");
            //console.log(y);
            position = new naver.maps.LatLng(y, x);
            //console.log(position);
            var mapOptions = {
                center:position,
                zoom: 18
            };
            var map =new naver.maps.Map('map', mapOptions);
            //console.log(map);
            var markerOptions = {
                position: position,
                map: map,
                icon: {
                    content: '<img src="${root}/res/images/pin.png" '+
                        'style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; ' +
                        '-webkit-user-select: none; position: absolute; width: 30px; height: 30px; left: 0px; top: 0px;">',
                    size: new naver.maps.Size(22, 35),
                    anchor: new naver.maps.Point(11, 35),
                },
                animation: naver.maps.Animation.BOUNCE
            };
            var marker = new naver.maps.Marker(markerOptions);
        }//cfMap

        //돌아가기
        function back(){
            var pre_url= document.referrer;
            pre_url=pre_url.substring(pre_url.length-7, pre_url.length);
            //console.log(pre_url);
            if(pre_url=="mainmap"){
                history.back();
            }else{
                location.href  ="${root}/map/mainmap";
            }
        }
    </script>

</div>

<!-- The Modal -->
<div class="modal" id="ciModal"  >
    <div class="modal-dialog modal-xl" id="ciModal-dialog">
        <div class="modal-content" id="ciModal-content">
            <div class="modal-header">
                <div class="modal-img"></div>
                <button type="button" class="btn-close modal-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body" style="text-align: center">
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>