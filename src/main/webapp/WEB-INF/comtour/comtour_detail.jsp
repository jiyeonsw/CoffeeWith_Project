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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="../res/css/style.css" type="text/css">
    <style type="text/css">
        div.wholetable{
            display: table; margin-left: auto; margin-right: auto;
        }
    </style>
    <script>
        var tr_id=${dto.tr_id}; /*tr_id는 answer 테이블에 등록된 것을 말하며 중복된 글 전체를 말함*/

        $(function (){
           list();
        });

        function list(){
            var login_ok = '${sessionScope.login_ok}';
            var login_id = '${sessionScope.login_id}';
            //alert(login_ok); yes

            var s="";
            $.ajax({
                type:"get",
                url: "../answer1/list",
                data:{"tr_id":tr_id},
                dataType: "json",
                success:function(res){
                   // alert(res);
                    s+="<table class='table table-bordered'>";
                    $.each(res,function (i,elt){

                    s+="<tr><td style='width: 100px;'>"+elt.ur_img+"</td>";
                    s+="<td style='width: 200px;'>"+elt.ur_nk+"</td>";
                    s+="<td style='width: 600px;'>"+elt.tm_txt+"<br>2시간전elt.w_date</td>"
                    s+="<td style='width: 30px;'>X버튼</td></tr>"
                      /*  s+="<b>"+elt.tm_txt+", </b>";
                        s+="<b>글쓴이:"+elt.ur_nk+"</b><br>"*/
                    });//each 함수
                    s+="</table>"
                    $("div.alist").html(s);
                }//success
            })//a.jax
        }//list함수

    </script>
</head>
<body>
<h3 style="color: red">comtour/list에서 넘어온 tr_id(PK): ${dto.tr_id}</h3>
<h5>dto 정보: tr + ur table<br> ${dto}</h5>
<hr>
<h5 style="color: red">tr_cmt에 입력할 tm_id(PK), rg, rs, rl이 모두 "0"으로 넘어옴</h5>
<c:set var="root" value="<%=request.getContextPath()%>"/>
${root} ${tm_id}
<hr>


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
            <td style="width: 930px;">모임관련 정보 : 주최자(${dto.ur_nm}), 아이디(${dto.email_id})</td>
        </tr>

        <tr>
            <td>Content</td>
            <td><textarea class="form-control" style="height: 300px;">${dto.tr_txt}</textarea></td>
            <td>
                <!--디테일 페이지의 댓글 입력창 만들기-->
                <div class="alist">댓글목록</div>

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
                    <button type="button" class="btn btn-outline" onclick="location.href='delete?num=${dto.tr_id}'">삭제</button>
                </c:if>

            </td>
            <td colspan="3" style="width: 300px; text-align: center">
                <button type="submit" class="btn bnt-outline">참여하기</button>
                <b style="font-size: 25px">??/${dto.tw_max}</b>
            </td>
        </tr>
    </table>
</div>
<script>
    $("#nform").click(function (){
        location.href='form2';
    })
</script>



<table>
<tr>
    <td style="width: 100px;">사진</td>
    <td style="width: 200px;">아이디</td>
    <td style="width: 600px;">텍스트<br>2시간전</td>
    <td style="width: 30px;"> X </td>
</tr>
</table>








<script>
    var root="${root}";
    $("#btnasave").click(function (){
        var fdata = $("#aform").serialize();// form tag의 내용을 쿼리스트링 형태로 읽는다.
        //alert(fdata); //tm_id=0& ur_id=2& tr_id=13& rg=0& rs=0& rl=0& tm_txt=test
        $.ajax({
            type:"post",
            url:"../answer1/insert",
            dataType:"text",
            data:fdata,
            success:function (res){
                 list();
                $("#msg").val("");

            },
        });//ajax
    });//btnasave

</script>

</body>
</html>