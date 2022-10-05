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
        div.cf-middle div{
            font-size: 30px;
            width: 300px;
            text-align: center;
            cursor: pointer;
        }
        div.ci-card {
            width: 300px;
            overflow: hidden;
        }

        div.ci-st {
            width: 100%;
            height: 300px;
            border-radius: 4px;
            background: 50% 100% no-repeat;
            background-size: cover;
            object-fit: cover;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
            margin-bottom: 10px;
        }
        div.ci-mini-card {
            height: 200px;
            overflow: hidden;
        }

        div.ci-mini-st {
            width: 200px;
            height: 100%;
            border-radius: 4px;
            background: 50% 100% no-repeat;
            background-size: cover;
            object-fit: cover;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
            margin-bottom: 10px;
        }
        #mform fieldset{
            display: inline-block;
            direction: rtl;
            border:0;
        }
        #mform fieldset legend{
            text-align: right;
        }
        #mform input[type=radio]{
            display: none;
        }
        #mform label{
            font-size: 30px;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
        }
        #mform label:hover{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #mform label:hover ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #mform input[type=radio]:checked ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        span.cm-star{
            color: rgba(250, 208, 0, 0.99);
        }
        div#btn-ck{cursor: pointer;}
    </style>
    <script>
        $(function () {
            cf_id=${dto.cf_id};
            cfMap(cf_id);

            $("div#btn-cf-info").click(function (){
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
                        s+='<div><span>영업시간</span> <span>'+ res.open_time+'</span></div>';
                        s+= '<div><span>휴무일</span> <span>'+res.off_day+'</span></div>';
                        s+='<div><span>전화번호</span> <span>'+res.cf_tel+'</span></div>';
                        s+='<div><span>주소</span> <span>'+res.loc_addr+'</span></div>';
                        s+='<div><span>대표메뉴</span> <span>'+res.menu+'</span></div>';
                        s+='</div>';
                        $("div.cf-bottom").html(s);
                        cfMap(cf_id);
                    }//succ

                });//ajax
            });//cafeinfo

            //리뷰 사진 클릭
            $(document).on("click","#btn-img",function (){
                $("#upload").trigger("click");

            });///on 리뷰사진클릭

            //file 변경
            $(document).on("change","#upload",function (){
                var form=new FormData();
                form.append("ci_nm",$("#upload")[0].files[0]);
                $.ajax({
                    type:"post", //file 태그포함되어 있으면 get이 아니라 post 방식이어야함
                    dataType:"json", //return type 없을 때,
                    url:"uploadimg", //매핑주소
                    processData:false,
                    contentType:false,
                    data:form,
                    success:function(res){
                        $("#mphoto").attr("src","../images/"+res.ci_nm);
                        $("#mphoto").css("display","inline-block");
                    }//suc
                });//ajax
            }); //on file 변경

            //리뷰 등록
            $(document).on("click","#btnmsave",function (){
                var fdata=$("#mform").serialize();
                //console.log(fdata);
                $.ajax({
                    type: "post",
                    url: "insert_cmt",
                    data: fdata,
                    dataType: "text",
                    success: function (res) {
                        cmList();
                    }//succ
                });//ajax
            });//리뷰등록


        });//fun

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
           var marker = new naver.maps.Marker({
               position: position,
               map: map
           });
       }//cfMap

        // 댓글리스트
        function cmList(){
            var s="";
            var login_ok='${sessionScope.login_ok}';
            if(login_ok=="yes"){
                s+='<div><div class="mform">';
                s+='<form id="mform">';
                s+='<input type="hidden" name="cf_id" value="${dto.cf_id }">';
                s+='<input type="hidden" name="ur_id" value="${sessionScope.login_id }">';
                s+='<fieldset><span>별점을 선택해주세요</span>';
                s+='<input type="radio" name="star" value="5" id="rate1"><label for="rate1">★</label>';
                s+='<input type="radio" name="star" value="4" id="rate2"><label for="rate2">★</label>';
                s+='<input type="radio" name="star" value="3" id="rate3"><label for="rate3">★</label>';
                s+='<input type="radio" name="star" value="2" id="rate4"><label for="rate4">★</label>';
                s+='<input type="radio" name="star" value="1" id="rate5"><label for="rate5">★</label>';
                s+='</fieldset>';
                s+='<input type="file" id="upload" style="display: none">';
                s+='<button type="button" id="btn-img">';
                s+='<i class="fa-solid fa-camera"></i></button>';
                //s+='<img src="" id="mphoto" width="50" onerror="this.style.display=none">';
                s+='<br><div class="input-group">';
                s+='<textarea name="cm_txt" id="cm_txt" style="width: 400px;height: 60px;" class="form-control"></textarea>';
                s+='<button type="button"  id="btnmsave">리뷰등록</button>';
                s+='</div></form></div>';
            }else {
                s+='<div>';
            }

            $.ajax({
                type: "get",
                url: "select_cmt",
                dataType: "json",
                data: {"cf_id": cf_id},
                success: function (res) {
                    $.each(res, function (i, elt) {
                        //console.dir(elt);
                        s+='<div>'+elt.ur_nk+'</div>';
                        s+='<div><span class="cm-star">';
                        var i=0;
                        while(i<elt.star){s+='★'; i++;}
                        s+='</span>';
                        s+='&nbsp;<span>'+elt.w_date+'</span></div>';
                        s+='<div>'+elt.cm_txt+'</div>';
                    });//each
                    s+='</div>';
                    $("div.cf-bottom").html(s);

                }//succ
            });//ajax
        }//댓글리스트
    </script>

</head>
<body>
   <div style="margin: 50px 50px;">
       <div class="cf-top">
           <!-- Carousel -->
           <div id="demo" class="carousel slide" data-bs-ride="carousel" style="width: 300px; height: 300px;">
               <!-- Indicators/dots -->
               <div class="carousel-indicators">
                    <c:forEach items="${list}" var="dtoi" varStatus="i">
                   <button type="button" data-bs-target="#demo" data-bs-slide-to="${i.index}"
                    <c:if test="${i.index==0}"> class="active"</c:if>
                    ></button>
                    </c:forEach>
               </div>
               <!-- The slideshow/carousel -->
               <div class="carousel-inner">

               <c:forEach items="${list}" var="dtoi" varStatus="i">
                   <c:if test="${i.count==1}"><div class="carousel-item active"></c:if>
                   <c:if test="${i.count>1}"><div class="carousel-item"> </c:if>
                       <div class="ci-card">
                           <c:set var="ci_path" value="url('../images/cafeimg/${dtoi.ci_nm}')"/>
                           <div class="ci-st" style="background-image:${ci_path}">
                           </div></div>
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
                <div id="btn-ck" >
                    <c:if test="${dto.ck_cnt==0}"><i class="fa-regular fa-heart"></i>&nbsp;</c:if>
                    <c:if test="${dto.ck_cnt>0}"><i class="fa-solid fa-heart"></i>&nbsp;</c:if>
                    ${dto.ck_cnt}</div>
           </div>
       </div> <!--cf_top-->
           <br>
       <div class="cf-middle">
           <div id="btn-cf-info">카페정보</div><div id="btn-cm-link">리뷰(${dto.cm_cnt})</div><div id="btn-ci-link">사진</div>
       </div>
       <hr>
       <br>
        <div class="cf-bottom">
       <div id="map" y="${dto.loc_y}" x="${dto.loc_x}" style="width:300px;height:300px;"></div>
            <div style="margin-left: 30px;" class="cf-info">
                <div><span>영업시간</span> <span>${dto.open_time}</span></div>
                <div><span>휴무일</span> <span>${dto.off_day}</span></div>
                <div><span>전화번호</span> <span>${dto.cf_tel}</span></div>
                <div><span>주소</span> <span>${dto.loc_addr}</span></div>
                <div><span>대표메뉴</span> <span>${dto.menu}</span></div>
            </div>
        </div>
        <script>
            $("div#btn-cm-link").click(function (){
                //console.log(cf_id);
                cmList();
            });//리뷰

            $("div#btn-ci-link").click(function (){
                //console.log(cf_id);
                $.ajax({
                    type: "get",
                    url: "img",
                    dataType: "json",
                    data: {"cf_id": cf_id},
                    success: function (res) {
                        var s="";
                        $.each(res, function (i, elt) {
                            s+='<div class="ci-mini-card">';
                            var ci_path="url('../images/cafeimg/" + elt.ci_nm+"')";
                            s+='<div class="ci-mini-st" style="background-image:'+ci_path+'">';
                            s+='</div></div>';
                            //s += '<img src="../images/cafeimg/' + elt.ci_nm + '" style="width: 300px; height: 300px;">';
                        });//each
                        $("div.cf-bottom").html(s);
                    }//succ
                });//ajax
            });//사진 클릭

            //하트클릭
            $("div#btn-ck").click(function (){
                var ur_id='${sessionScope.login_id }';
                $.ajax({
                    type: "get",
                    url: "select_like",
                    dataType: "json",
                    data: {"ur_id":ur_id, "cf_id": cf_id},
                    success: function (res) {
                        var ck_chk=res.ck_chk;
                        if(ck_chk==0) {
                            $.ajax({
                                type: "get",
                                url: "insert_like",
                                dataType: "text",
                                data: {"ur_id": ur_id, "cf_id": cf_id},
                                success: function (res) {
                                    location.reload();
                                }//suc
                            });//ajax insert
                        }else {
                            $.ajax({
                                type: "get",
                                url: "delete_like",
                                dataType: "text",
                                data: {"ur_id": ur_id, "cf_id": cf_id},
                                success: function (res) {
                                    location.reload();
                                }//suc
                            });//aj del
                        }
                    }//suc
                });//ajax
                });//하트클릭
        </script>
   </div>
</body>
</html>
