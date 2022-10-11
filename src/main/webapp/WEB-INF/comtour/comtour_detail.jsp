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
        var num=${dto.tr_id};
        $(function (){
           list();
        });

        function list(){

        }

    </script>
</head>
<body>
<h1>${dto.tr_id}</h1>
<h1>${dto1}</h1>


<!--dto 객체에 tr 테이블(inner join으로 ur 정보 포함)의 정보가 담겨 있어서 dto.xx 형태로 꺼내어 쓰면 됨-->
<div class="wholetable">
    <table class="table table-bordered" style="width: 1460px">
        <tr>
            <th colspan="3" style="width: 1000px; text-align: center">
                카페 모임 상세 정보
                <%--<button type="button" class="btn-close" data-bs-dismiss="modal" style="float: right"></button>--%>
            </th>

        </tr>
        <tr>
            <td style="width: 130px;">title</td>
            <td style="width: 630px;">
            ${dto.tr_nm}
            </td>
            <td style="width: 700px;">
                모임관련 정보 : 주최자(${dto.ur_nm}), 아이디(${dto.email_id})
            </td>
        </tr>

        <tr>
            <td>Content</td>
            <td>
                <textarea class="form-control" style="height: 300px;">${dto.tr_txt}</textarea>
            </td>
            <td>


                <!--계층형 게시판 영역-->
                <table class="table table-bordered">
                    <tr>
                        <td>111</td>
                        <td>111</td>
                        <td>111</td>
                    </tr>
                </table>
                <!--계층형 게시판 영역 종료-->



                <!--디테일 페이지의 댓글 입력창 만들기-->
                <div class="alist">댓글목록</div>

                <c:if test="${sessionScope.login_id!=null}">
                    <div class="aform">
                        <form id="aform">
                            <%--<input type="hidden" name="tm_id" value="${tm_id}"> <!--?????????-->--%>
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
            <td colspan="3" style="width: 300px; text-align: center">
                <button type="submit" class="btn bnt-outline">참여하기</button>
                <b style="font-size: 25px">??/${dto.tw_max}</b>
            </td>
        </tr>
    </table>
</div>

<script>
    var root="${root}";
    $("#btnasave").click(function (){
        var fdata = $("#aform").serialize();// form tag의 내용을 쿼리스트링 형태로 읽는다.
        alert(fdata); //tm_id=0& ur_id=2& tr_id=13& rg=0& rs=0& rl=0& tm_txt=test
        $.ajax({
            type:"post",
            url:"../answer1/insert",
            dataType:"text",
            data:fdata,
            success:function (res){
               // list();
                $("#msg").val("");
            },
        });//ajax
    });//btnasave

</script>





</body>

</html>