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
            width: 350px;
            overflow: hidden;
        }

        div.ci-st {
            width: 100%;
            height: 350px;
            border-radius: 10px;
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
        span.cm-star-n{
            color: lightgray;
        }
        div#btn-ck{cursor: pointer;}
        span.cm-edit-del{
            float:right;
        }
        pre{
            color: inherit;
            font-family: inherit;
            font-size:inherit ;
        }
        #cm-i-box{
            margin-top: 5px;
            vertical-align: middle;
        }
        #btn-img{
            width: 60px;
            height: 60px;
            font-size: 30px;
            border: 1px solid gray;
            border-radius: 4px;
            line-height: 60px;

        }

        img.cmt-img{
            border-radius: 4px;
            height: 60px;
            border: 1px solid gray;
            margin-right: 4px;
        }
    </style>
    <script>
        $(function () {
            cf_id=${dto.cf_id};
            login_ok='${sessionScope.login_ok}';
            ur_id="${sessionScope.login_id }";
            cfMap(cf_id);
        });//fun

    </script>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
   <div style="margin: 50px 50px;">
       <div>&nbsp<a class="back" href="javascript:back();"><i class="fa-solid fa-map-location-dot"></i>&nbsp;맵으로 돌아가기</a></div><br>
       <div class="cf-top">
           <!-- Carousel -->
           <div id="demo" class="carousel slide" data-bs-ride="carousel" style="width: 350px; height: 350px;">
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
                           <c:set var="ci_path" value="url('${root}/images/cafeimg/${dtoi.ci_nm}')"/>
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
               <div><span>위치</span>  <span>${dto.loc_addr} </span></div>
               <div><span>리뷰</span>  <span>${dto.cm_cnt}
                   <c:if test="${dto.cm_star==-1}">
                       (<span class="cm-star" style="color: gray">★</span>-)
                   </c:if>
                   <c:if test="${dto.cm_star>-1}">
                       (<span class="cm-star">★</span>${dto.cm_star})
                   </c:if>
               </span></div>
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
                                    dataType: "text",
                                    data: {"ur_id": ur_id, "cf_id": cf_id},
                                    success: function (res) {
                                        location.reload();
                                    }//suc
                                });//ajax insert
                            } else {
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
                }//else
            });//하트클릭

            ////////////////////////////////////////////////////////////////// 카페상세정보 관련 함수 //////////////////////////////////////////////////////////////////
            //카페정보 클릭
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

            ////////////////////////////////////////////////////////////////// 카페리뷰 관련 함수 //////////////////////////////////////////////////////////////////
            //리뷰클릭
            $("div#btn-cm-link").click(function (){
                //console.log(cf_id);
                cmList();
            });//리뷰

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
                preview(arr)
            }); //on file 선택

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

            // 리뷰삭제
            $(document).on("click",".cm-del",function (){
                var cm_id=$(this).attr("cm_id");
                //console.log(cm_id);
                $.ajax({
                    type: "get",
                    url: "delete_cmt",
                    data: {"cm_id": cm_id},
                    dataType: "text",
                    success: function (res) {
                        $("div#btn-cm-link").trigger('click');
                    }//succ
                });//ajax
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

            ////////////////////////////////////////////////////////////////// 카페사진모음 관련 함수 //////////////////////////////////////////////////////////////////
            //사진클릭
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
                            var ci_path="url('${root}/images/cafeimg/" + elt.ci_nm+"')";
                            s+='<div class="ci-mini-st" style="background-image:'+ci_path+'">';
                            s+='</div></div>';
                        });//each
                        $("div.cf-bottom").html(s);
                    }//succ
                });//ajax
            });//사진 클릭

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
                var s="<div>";
                var cm_cnt=${dto.cm_cnt};
                if(cm_cnt==0){s+='<div>아직 리뷰가 없습니다. 첫번째 리뷰를 남겨주세요!</div><br>';}
                if(login_ok=="yes"){
                    s+='<div class="mform">';
                    s+='<form id="mform">';
                    s+='<input type="hidden" name="cf_id" value="${dto.cf_id }">';
                    s+='<input type="hidden" name="ur_id" value="${sessionScope.login_id }">';
                    s+='<fieldset><span>&nbsp;별점을 선택해주세요</span>';
                    s+='<input type="radio" name="star" value="5" id="rate1"><label for="rate1">★</label>';
                    s+='<input type="radio" name="star" value="4" id="rate2"><label for="rate2">★</label>';
                    s+='<input type="radio" name="star" value="3" id="rate3"><label for="rate3">★</label>';
                    s+='<input type="radio" name="star" value="2" id="rate4"><label for="rate4">★</label>';
                    s+='<input type="radio" name="star" value="1" id="rate5"><label for="rate5">★</label>';
                    s+='</fieldset>';
                    s+='<input type="file" id="cm-i-upload" style="display: none" multiple="multiple">';
                    s+='<br><div class="input-group">';
                    s+='<textarea name="cm_txt" id="cm_txt" style="width: 500px;height: 60px;" class="form-control"></textarea>';
                    s+='<button type="button"  id="btnmsave">리뷰등록</button>';
                    s+='</div> <div id="cm-i-box"><button type="button" id="btn-img">';
                    s+='<i class="fa-solid fa-camera"></i></button>';
                    s+='&nbsp;&nbsp;<span id="cm-i-preview"></span></div>'
                    s+='</form></div><br><br>';
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
                            s+='<div>';
                            s+='<img src="${root}/images/noprofile.jpg" style="width: 30px; height: 30px; border-radius: 100px;">&nbsp;'+elt.ur_nk;
                            if(elt.ur_id=='${sessionScope.login_id }'){
                                s+='<span class="cm-edit-del"><i class="fa-solid fa-pen-to-square cm-edit" cm_id="'+elt.cm_id+'" ></i>&nbsp;&nbsp;';
                                s+='<i class="fa-solid fa-trash cm-del" cm_id="'+elt.cm_id+'"></i></span>';}
                            s+='</div>';
                            s+='<div><span class="cm-star">';
                            var i=0;
                            while(i<elt.star){s+='★'; i++;}
                            s+='</span>';
                            if(elt.star==0){s+="-"}
                            else{
                            s+='<span class="cm-star-n">';
                            var i=0;
                            while(i<5-elt.star){s+='★'; i++;}
                            s+='</span>';}
                            s+='&nbsp;&nbsp;&nbsp;<span>'+elt.w_date+'</span></div>';
                            s+='<pre>'+elt.cm_txt+'</pre>';
                        });//each
                        s+='</div>';
                        $("div.cf-bottom").html(s);

                    }//succ
                });//ajax
            }//리뷰리스트

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
</body>
</html>
