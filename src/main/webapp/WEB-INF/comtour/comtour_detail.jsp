<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffeewith</title>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="../res/css/style.css" type="text/css">

    <c:set var="root" value="<%=request.getContextPath()%>"/>

    <style type="text/css">
        div.wholetable{
            display: table; margin-left: auto; margin-right: auto; margin-top: 20px;
        }

        .trdel{
            cursor: pointer;
            margin-left: 5px;
        }
        pre {
            display: block;
            font-family: 'GangwonEdu_OTFBoldA';
            white-space: pre;
            margin: 1em 0;

        }
    </style>

    <script> /*답글관련 스크립트*/
    var tr_id=Number(${dto.tr_id}); /*tr_id는 answer 테이블에 등록된 것을 말하며 여러개의 답글을 말함 이때 tr_id는 list에서 넘어온 것*/
    //alert(isNaN(tr_id));


    $(function () {

        list(); // 처음 시작 시 답글 출력

        /*답글 입력 제이쿼리 btnasave는 (등록) 버튼임*/
        $("#btnasave").click(function () {
            var fdata = $("#aform").serialize();// form tag의 내용을 쿼리스트링 형태로 읽는다.
            //alert(fdata); //tm_id=0& ur_id=2& tr_id=13& rg=0& rs=0& rl=0& tm_txt=test
            $.ajax({
                type: "post",
                url: "../answer/insert",
                dataType: "text",
                data: fdata,
                success: function (res) {
                    list();
                    $("#msg").val("");
                },
            });//ajax
        });//btnasave 종료

        /*답글 삭제*/
        $(document).on("click",".trdel",function(){
            var del=confirm("정말 삭제하시겠습니까?");
            if(del){
                var num=$(this).attr("num");
                //alert(num);
                $.ajax({
                    type:"get",
                    dataType:"text",
                    url:"../answer/delete",
                    data:{"num":num},
                    success:function(res){
                        list();
                    } // success
                }); //ajax
            } //if
        }); // event
    }); // 답글관련 스크립트 종료

    /*List 일반함수*/
    function list(){
        var login_ok = '${sessionScope.login_ok}';
        var login_id = '${sessionScope.login_id}';
        //alert(login_ok); yes

        var s="";
        $.ajax({
            type:"get",
            url: "../answer/list",
            data:{"tr_id":tr_id},
            dataType: "json",
            success:function(res){

                s+="<table style='border-collapse: collapse'> 댓글목록";
                $.each(res,function (i,elt){
                    s+="<tr><td style='width: 100px;'>";
                    s+="<img src='${root}/res/prfimg/"+elt.ur_img+"' style='width: 50px;' class='rounded-circle'></td>";
                    s+="<td style='width: 200px;'>"+elt.ur_nk+"</td>";
                    s+="<td style='width: 600px;'>"+elt.tm_txt+"</td>";
                    s+="<td style='width: 30px;'>";
                    if(login_ok=='yes' && login_id==elt.ur_id) {
                        s+="<i class='fas fa-trash-alt trdel' style='font-size:24px' num="+elt.tm_id+"></i>";
                    }
                    s+="</td></tr>";

                });//each 함수
                s+="</table>"
                $("div.alist").html(s);
            }//success
        })//a.jax
    }//list함수 종료

    </script>
</head>
<body>

<c:set var="root" value="<%=request.getContextPath()%>"/>
<%--<h1>세션: 로그인 아이디: ${sessionScope.login_id}</h1>
<h1>ur_id(글쓴이): ${dto.ur_id}</h1>
<h1>tr_id(글번호): ${dto.tr_id}</h1>
<h5>${dto}</h5>--%>


<!--dto 객체에 tr 테이블(inner join으로 ur 정보 포함)의 정보가 담겨 있어서 dto.xx 형태로 꺼내어 쓰면 됨-->
<div class="wholetable">
    <table class="table table-bordered" style="width: 1460px">
        <tr>
            <th colspan="3" style="text-align: center">
                카페 모임 상세 정보
                <%--<button type="button" class="btn-close" data-bs-dismiss="modal" style="float: right"></button>--%>
            </th>

        </tr>
        <tr> <%--타이틀 상단--%>
            <td style="width: 130px;">title</td>
            <td style="width: 400px;">${dto.tr_nm}</td>
            <td style="width: 930px;">모임관련 정보 : 주최자(${dto.ur_nk}), 아이디(${dto.email_id})</td>
        </tr>

        <tr>
            <td rowspan="2">Content</td>
            <td rowspan="2"><pre class="form-control" style="height: 300px;">${dto.tr_txt}</pre></td>
            <td>
                <!--디테일 페이지의 댓글 입력창 만들기-->
                <div class="alist">댓글목록</div>

            </td>
        </tr>
        <tr>
            <td>
                <c:if test="${sessionScope.login_id!=null}">
                    <div class="aform">
                        <form id="aform">
                            <input type="hidden" name="tm_id" value="${tm_id}">
                            <input type="hidden" name="ur_id" value="${sessionScope.login_id}">
                            <input type="hidden" name="tr_id" value="${dto.tr_id}">
                            <input type="hidden" name="rg" value="${rg}">
                            <input type="hidden" name="rs" value="${rs}">
                            <input type="hidden" name="rl" value="${rl}">
                            <br>
                            <div class="input-group">
                                <textarea name="tm_txt" id="msg" style="width: 400px;height: 60px;" class="form-control"></textarea>
                                <button type="button" class="btn btn-secondary btn-sm" id="btnasave">등록</button>
                            </div>
                        </form>
                    </div><!--aform -->
                </c:if>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <button type="button" class="btn btn-outline" id="nform">새글</button>
                <button type="button" class="btn btn-outline" onclick="location.href='list'">목록</button>
                <c:if test="${sessionScope.login_ok!=null&&sessionScope.login_id==dto.ur_id}">
                    <button type="button" class="btn btn-outline" onclick="location.href='updateform?num=${dto.tr_id}'">수정</button>
                </c:if>
                <c:if test="${sessionScope.login_ok!=null&&sessionScope.login_id==dto.ur_id}">
                    <button type="button" class="btn btn-outline" id="delform">삭제</button>
                </c:if>

            </td>
            <td style="width: 300px; text-align: left; vertical-align: middle">
                <span class="plist" class="form-control">성공</span>
            </td>
        </tr>
        <tr>
            <td class="trcrw" colspan="3" style="text-align: center;">
                <c:if test="${dto.tr_cmp==1}">
                    <span>모집완료</span>
                </c:if>
                <c:if test="${dto.tr_cmp==0}">
                    <%--<form action="../part/data?num=${dto.tr_id}">--%>
                    <button type="submit" class="btn bnt-outline" id="partBtn">참여하기</button>
                    <%--</form>--%>
                </c:if>

                <span style="font-size: 30px;" id="crwnum"></span> / ${dto.tw_max}
            </td>
        </tr>
    </table>
</div>

<script> /*투어 모집글 관련 스크립트*/
/*새글쓰기 버튼 클릭시 호출함수*/
$("#nform").click(function (){

    location.href='form2';
});

/*삭제(투어모집글) 버튼 클릭시 호출*/
$("#delform").click(function (){
    var del= confirm("삭제하시겠습니까?")
    if(del){
        location.href="list";
        alert("삭제되었습니다!")
    }
});
</script>

<script>
    /*참여버튼 클릭시 이벤트*/
    /* 최초 plist 합수를 호출하여 현재 참여자의 정보를 얻어서 표기 */

    plist();
    crwcount();

    $("#partBtn").click(function () {
        var tr_id = ${dto.tr_id};
        var ur_id = ${sessionScope.login_id};
        //var totalcnt=0;
        var s="";
        $.ajax({
            type: "post",
            url: "crwcount",
            dataType: "json",
            data: {"tr_id":tr_id,"ur_id":ur_id},
            success: function (res) {
                if(res.count==1){
                    alert("이미참여하셨습니다.");

                }else {
                    $.ajax({
                        type: "post",
                        url: "../part/insert",
                        dataType: "text",
                        data: {"tr_id": tr_id, "ur_id": ur_id},
                        success: function (res) {
                            crwcount();
                            alert("참가되었습니다!");
                            //totalcnt=totalcnt+1;
                            plist();
                            //alert("insert 영역 : " + totalcnt);


                        }, //success
                    });//ajax
                }//else 종료
            },//success
        });
    }); // 버튼 이벤트 함수



    /*pList 일반함수*/
    function plist(){
        var login_ok = '${sessionScope.login_ok}';
        var login_id = '${sessionScope.login_id}';
        //alert(login_ok); yes

        var s="";
        $.ajax({
            type:"get",
            url: "../part/list",
            data:{"tr_id":tr_id},
            dataType: "json",
            success:function(res){
                s+="참여자 닉네임 : ";
                $.each(res,function (i,elt){

                    s+=elt.ur_nk+"&nbsp;&nbsp;";
                    //totalcnt+=1;
                    //alert("list 호출 함수 : "+totalcnt);

                });//each 함수
                $("span.plist").html(s);
            }//success
        })//a.jax

    }//plist함수 종료


    /*count 일반함수*/
    var p="";
    function crwcount(){
        var s="";

        $.ajax({
            type:"get",
            url: "../part/data",
            data:{"num":tr_id},
            dataType: "json",
            success:function(res){
                s+="<b>"+res.totalCount+"</b>";
                $("span#crwnum").empty();
                $("span#crwnum").html(s);

                if(res.totalCount==${dto.tw_max}){
                        //alert("성공");
                        $(".trcrw").empty();
                        $(".trcrw").text("모집완료")

                        var tr_cmp = 1;
                        var tr_id = ${dto.tr_id};
                        //alert(tr_cmp);
                        $.ajax({
                            type:"post",
                            url: "./updatecrw",
                            data:{"tr_cmp":tr_cmp,"tr_id":tr_id},
                            dataType: "text",
                            success:function(res) {
                                location.href="list";
                            },
                        }); //ajax
                    }; //if
            },//success
        })//a.jax

    }//crwcount함수 종료






</script>


</body>
</html>