<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <style type="text/css">

        div.flex {
            margin-top: 30px;
            margin-left: 110px;
        }
        div.cell {
            display: table-cell; vertical-align: middle;
        }

        ul.itemlist{
            display: flex;
        }
        ul.itemlist li{
            list-style: none;
            width: 300px;
            height: 330px;
            text-align: left;
            border: 0px solid gray;
            margin-right: 10px;
        }
        /*ul.itemlist li img{
            width: 230px;
            height: 260px;
            border: 4px solid pink;
        }*/
        div.detailbox{
            border: 1px solid #ffebb5;
            /*background-image: url("${root}/images/logo1.png");*/
            background-color: #ffeebb5;
            background-size: 250px 300px;
            border-right: 16px;
            box-shadow: inset 0 0 8px #deb13a;
            width: 300px;
            height: 330px;
        }
        div.detailbox:hover{
            background-color:lightpink;
            color:white;
            box-shadow: 5px 5px 5px gray;
            cursor: pointer;
        }
    </style>

    <script>

       var login_ok="<%=(String)session.getAttribute("login_ok")%>";
        //alert(login_ok);
        $(function (){
            //새글쓰기 모달창
            $("#btnform").click(function (){
                if(login_ok!=="yes"){
                    alert("로그인을 먼저 해주세요")
                }
                else {
                    $("#modalform").modal("toggle");
                    $("#modalform .modal-content").load("form");
                }
            }); // 새글쓰기 모달창 종료

        });//스크립트 전체 함수 영역
    </script>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="flex">
    <form action="list">
            <div class="input-group" style="margin-left: 30px; width: 700px;">
                <!--검색 영역-->
                <select name="searchcolumn" class="form-select" style="300px;">
                    <option value="tr_loc">투어도시</option>
                    <option value="s_date">출발날짜</option>
                </select>
                <input type="text" name="searchword" class="form-control" style="width: 400px;"
                       placeholder="여행친구를 만날 도시를 입력하고 출발일을 지정해 주세요!">

                <!--검색버튼-->
                   <button type="submit" class="btn">
                      <i class='fas fa-search' style='font-size:24px;'></i>
                   </button>
                <!--새글쓰기 영역-->
                   <a id="btnform">
                     <i class='far fa-plus-square' style='font-size:38px; margin-left: 10px;'></i>
                   </a>
            </div>
    </form><br>
<%--<a href="list?searchcolumn=tr_id&searchword=${sessionScope.login_id}">내가쓴글</a><br><br>--%>

<%--헤터 부분 검색창 과 디테일 페이지 li 태그로 묶인 부분--%>
<h1>총 ${totalCount}개의 모임이 존재합니다.</h1><br>
    <ul class="itemlist">
        <c:forEach var="dto" items="${list}" varStatus="i">
        <li id="detailview">
           <a href="detail?tr_id=${dto.tr_id}">
            <input type="hidden" value="${dto.tr_id}">
                <div class="detailbox">
                    <table class="table table-bordered">
                        <tr>
                            <th style="text-align: center">
                                <fmt:parseDate var="start" value="${dto.s_date}"  pattern="yyyy-MM-dd"/>
                                <fmt:formatDate value="${start}" pattern="MM월" /><br>
                                <b style="font-size: 25px;"><fmt:formatDate value="${start}" pattern="dd일" /></b>
                            </th>
                            <th style="text-align: center; vertical-align: middle">>></th>
                            <th style="text-align: center">
                                <fmt:parseDate var="end" value="${dto.e_date}"  pattern="yyyy-MM-dd"/>
                                <fmt:formatDate value="${end}" pattern="MM월" /><br>
                                <b style="font-size: 25px;"><fmt:formatDate value="${end}" pattern="dd일"/></b>
                            </th>
                            <th style="text-align: center; vertical-align: middle">
                                <c:if test="${dto.tr_cmp!=1}"><b>모집중</b></c:if>
                                <c:if test="${dto.tr_cmp==1}"><b style="color:red">모집<br>완료</b></c:if>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="4">title: ${dto.tr_nm}</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <img src="${root}/res/prfimg/${dto.ur_img}" style="width: 40px;" class="rounded-circle">
                                주최자: ${dto.ur_nm}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 170px;">내용: ${dto.tr_txt}</td>
                        </tr>
                    </table>
                </div> <!--detailbox-->
          </a>
        </li>
            <c:if test="${i.count%4==0}">
    </ul><ul class="itemlist">
            </c:if>
        </c:forEach>
    </ul>
</div> <!--wrapper-->

    <%--새 글 모달 영역--%>
<div class="modal" id="modalform">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content"></div>
    </div>
</div>

</body>
</html>