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
            border: 1px solid #f1f1f1;
            border-radius: 4px;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
        }

        a.cmt-cf-nm-box:hover {
            text-decoration: rgba(50, 50, 93, 0.25) underline;
            text-underline-position: under;
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

        /*--------- modal css -----------*/
        #cmt-update-form fieldset {
            display: inline-block;
            direction: rtl;
            border: 0;
        }

        #cmt-update-form fieldset legend {
            text-align: right;
        }

        #cmt-update-form input[type=radio] {
            display: none;
        }

        #cmt-update-form label {
            font-size: 30px;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
        }

        #cmt-update-form label:hover {
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }

        #cmt-update-form label:hover ~ label {
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }

        #cmt-update-form input[type=radio]:checked ~ label {
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }

        button.close {
            border: #f1f1f1;
            background-color: #fff;
        }

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="cmt-container">
    <c:if test="${sessionScope.cfCmtCnt==0}">
        <div>
            <h4>등록된 리뷰가 없습니다</h4>
        </div>
    </c:if>
    <c:if test="${sessionScope.cfCmtCnt>0}">
    <c:forEach var="dto" items="${list}">
        <div class="cmt-box">
            <a href="${root}/cafe/detail?cf_id=${dto.cf_id}">
                <div class="cf-cmt-img">
                    <img src="${root}/images/cafeimg/${dto.ci_nm}"
                         onError="this.onerror=null; this.src='${root}/images/noimage.png'">
                </div>
            </a>
            <a href="${root}/cafe/detail?cf_id=${dto.cf_id}" class="cmt-cf-nm-box">
                <div class="cmt-cf-nm">
                        ${dto.cf_nm}
                </div>
            </a>
            <div class="cmt-icon-box">
                <span class="my-cmt-update" cm_id="${dto.cm_id}" star="${dto.star}" txt="${dto.cm_txt}">
                    <i class="fa-solid fa-pen-to-square"></i>
                </span>
                <span class="my-cmt-del" cm_id="${dto.cm_id}" cf_id="${dto.cf_id}">
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

<!----------------------------- Update Modal -------------------------------------------------->
<!----------------------------- modal == md  -------------------------------------------------->
<div class="modal fade" id="pass-pass-md-body" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">리뷰 수정</h4>
                <button type="button" class="close" data-bs-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${root}/mypage/update_cmt" method="post" id="cmt-update-form">
                <div class="cmt-modal-body mx-3">
                    <input type="hidden" id="md-cm-id" name="cm_id">
                    <div class="update-star-box">
                        <fieldset>
                            <div>별점을 선택해주세요</div>
                            <input type="radio" name="star" value="5" id="rate1"><label for="rate1">★</label>
                            <input type="radio" name="star" value="4" id="rate2"><label for="rate2">★</label>
                            <input type="radio" name="star" value="3" id="rate3"><label for="rate3">★</label>
                            <input type="radio" name="star" value="2" id="rate4"><label for="rate4">★</label>
                            <input type="radio" name="star" value="1" id="rate5"><label for="rate5">★</label>
                        </fieldset>
                    </div>
                    <div class="input-group">
                        <textarea name="cm_txt" id="md-cm-txt" style="width: 500px;height: 60px;"
                                  class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="submit" class="btn update-cmt-btn">수정 완료</button>
                </div>
            </form>
        </div>
    </div>
</div>
</c:if>
<script>

    /* 수정 버튼 클릭시 modal */
    $(".my-cmt-update").click(function () {
        //console.log("click yes")
        let cm_id = $(this).attr("cm_id");
        let star = $(this).attr("star");
        let cm_txt = $(this).attr("txt");
        // alert(cm_txt)

        /* 기존 별점 대입 */
        let arr = $('input[type=radio][name=star]');
        for (i = 0; i < arr.length; i++) {
            if (star == $(arr[i]).attr("value")) {
                $(arr[i]).prop("checked", true);
            }
        }//for

        /* 기존 리뷰 텍스트 대입*/
        $("#md-cm-txt").val(cm_txt);

        // console.log(cmId);
        $("#md-cm-id").attr("value", cm_id);
        $("#pass-pass-md-body").modal("toggle");
    })//$(".my-cmt-update")

    /* 리뷰 수정 완료 버튼 클릭시 알림 */
    $(".update-cmt-btn").click(function () {
        // alert("yes");
        alert("리뷰 수정이 완료되었습니다.")
    })

    /* 리뷰 삭제 */
    $(".my-cmt-del").click(function () {
        var cm_id = $(this).attr("cm_id");
        //console.log(cm_id);
        $.ajax({
            type: "get",
            url: "${root}/mypage/delete_cmt",
            data: {"cm_id": cm_id},
            dataType: "text",
            success: function (res) {
                if (res == "success") {
                    alert("작성한 리뷰가 정상 삭제되었습니다.");
                    location.reload();
                }
            }//succ
        });//ajax
    });//리뷰삭제

</script>
</body>
</html>
