<%--
  Created by IntelliJ IDEA.
  User: ian
  Date: 2022-10-03
  Time: 오후 5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffeewith</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <style>
        .cmt-container {
            width: 100%;
            padding: 40px 40px 20px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0 20px;
        }

        .cmt-box {
            height: 120px;
            display: grid;
            grid-template-areas:
                    "cfimg  cmt-cf-nm   icon-box"
                    "cfimg  cmt-top     cmt-top "
                    "cfimg  cmt-bottom  cmt-bottom";
            grid-template-columns: 100px 1fr;
            grid-template-rows: 20px 20px 50px;
            gap: 5px 0;
            padding: 10px 10px 10px;
            margin-bottom: 20px;
            background-color: rgba(107, 72, 4, .06);
            border: 1px solid #f1f1f1;
            border-radius: 4px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
        }

        div.cf-cmt-img {
            grid-area: cfimg;
            width: 90px;
            height: 100px;
        }

        div.cf-cmt-img img {
            width: 100%;
            height: 100%;
            border-radius: 4px;
            background: 50% 50% no-repeat;
            background-size: cover;
            object-fit: cover;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
            margin-bottom: 10px;
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
        }

        div.cmt-cf-nm {
            grid-area: cmt-cf-nm;
        }

        div.cmt-icon-box {
            grid-area: icon-box;
        }

        div.cmt-top {
            grid-area: cmt-top;
        }

        div.cmt-txt {
            grid-area: cmt-bottom;
        }

        div.cmt-icon-box svg {
            cursor: pointer;
        }

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="cmt-container">
    <c:forEach var="dto" items="${list}">
        <div class="cmt-box">
            <div class="cf-cmt-img">
                <img src="${root}/images/cafeimg/${dto.ci_nm}"
                     onError="this.onerror=null; this.src='${root}/images/noimage.png'">
            </div>
            <div class="cmt-cf-nm">
                    ${dto.cf_nm}
            </div>
            <div class="cmt-icon-box">
                <span class="my-cmt-update" value="${dto.cm_id}">
                    <i class="fa-solid fa-pen-to-square"></i>
                </span>
                <span class="my-cmt-del" value="${dto.cm_id}">
                    <i class="fa-solid fa-trash"></i>
                </span>
            </div>
            <div class="cmt-top">
            <span style="color: rgba(250, 208, 0, 0.99);">
                    ${map.get(dto.star)}
            </span>
                <span class="cmt-date">
            <fmt:formatDate value="${dto.w_date}" pattern="MM-dd hh:mm" type="date"/>
            </span>
            </div>
            <div class="cmt-txt">
            <span>
                    ${dto.cm_txt}
            </span>
            </div>
        </div>
    </c:forEach>
</div>
<script>
    // 리뷰삭제
    $(".my-cmt-del").click(function () {
        var cm_id = $(this).attr("value");
        //console.log(cm_id);
        $.ajax({
            type: "get",
            url: "${root}/cafe/delete_cmt",
            data: {"cm_id": cm_id},
            dataType: "text",
            success: function (res) {
                alert("yse")
                location.reload();
            }//succ
        });//ajax
    });//리뷰삭제

    // 리뷰수정클릭시 내용 넣기
    $(".my-cmt-update").click(function () {
        var cm_id = $(this).attr("cm_id");
        $.ajax({
            type: "get",
            url: "select_cmt_by_cmid",
            data: {"cm_id": cm_id},
            dataType: "json",
            success: function (res) {

            }//succ
        });//ajax
    });//리뷰수정클릭시 내용 넣기
</script>
</body>
</html>
