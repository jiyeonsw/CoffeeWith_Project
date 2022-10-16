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

        .bk_container {
            display: grid;
            padding: 40px 20px 20px;
            grid-template-columns: 1fr 1fr 1fr;
            grid-template-rows: 280px 280px 280px 280px;
            gap: 20px 0px;
            justify-items: center;
            min-height: 1300px;
        }

        div.bk-card {
            width: 270px;
            height: 270px;
            overflow: hidden;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
        }

        div.bk-txt-area {
            margin-left: 20px;
        }

        div.bk-txt-area:hover {
            cursor: pointer;
        }

        .bk-ci-nm {
            width: 100%;
            height: 194px;
            border-radius: 4px;
            background: 50% 50% no-repeat;
            background-size: cover;
            object-fit: cover;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
            border-radius: 4px;
            background: 50% 50% no-repeat;
            background-size: cover;
            object-fit: cover;
            box-sizing: border-box;
            border: 1px solid #f1f1f1;
            margin-bottom: 10px;
        }

        .bk-ci-nm svg {
            cursor: pointer;
            float: right;
            margin: 15px;
        }

        .bk_container h5 {
            margin-bottom: 0rem;
        }

        .bk-cf-addr {
            font-size: 13px;
        }

        .pagination {
            justify-content: center;
        }

        .page-link {
            color: #664400;
        }

        .page-item.active .page-link {
            background-color: #664400;
            border-color: #664400;
        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<%--bookmark == bk--%>
<div class="bk_container">
    <c:if test="${totalCount==0}">
        <div>
            <h4>등록된 북마크가 없습니다</h4>
        </div>
    </c:if>
    <c:if test="${totalCount>0}">
        <c:forEach var="dto" items="${list}">
            <c:set var="no" value="${no-1}"/>
            <div class="bk-card">
                <div class="bk-ci-nm"
                     style="background-image:url('${root}/images/cafeimg/${dto.ci_nm}'),url('${root}/images/noimage.png')">
                    <div class="un-bk" value="${dto.cf_id}">
                        <i class="fa-solid fa-trash"></i>
                    </div>
                </div>
                <div class=" bk-txt-area" onclick="location.href='${root}/cafe/detail?cf_id=${dto.cf_id}'">
                    <h5 class="bk-cf-nm">${dto.cf_nm}</h5>
                    <span class="bk-cf-addr">${dto.loc_si} ${dto.loc_gu}</span>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>
<div class="paging">
    <ul class="pagination">
        <c:if test="${startPage>1}">
            <li class="page-item">
                <a href="${root}/mypage/bookmarks?currentPage=${startPage-1}"
                   class="page-link">이전</a>
            </li>
        </c:if>
        <%--페이지 번호--%>
        <c:forEach var="pnp" begin="${startPage}" end="${endPage}">
            <c:if test="${pnp==currentPage}">
                <li class="page-item active">
                    <a class="page-link"
                       href="${root}/mypage/bookmarks?currentPage=${pnp}">${pnp}</a>
                </li>
            </c:if>
            <c:if test="${pnp!=currentPage}">
                <li class="page-item">
                    <a class="page-link"
                       href="${root}/mypage/bookmarks?currentPage=${pnp}">${pnp}</a>
                </li>
            </c:if>
        </c:forEach>
        <c:if test="${endPage<totalPage}">
            <li class="page-item">
                <a href="${root}/mypage/bookmarks?currentPage=${endPage+1}"
                   class="page-link">다음</a>
            </li>
        </c:if>
    </ul>
</div>
<script>
    //북마크 제거 버튼(-) 클릭시 db data delete
    $(".un-bk").click(function () {
        var ur_id = '${sessionScope.login_id }';
        var cf_id = $(this).attr("value");
        console.log(cf_id);
        $.ajax({
            type: "get",
            url: "${root}/cafe/delete_like",
            dataType: "text",
            data: {"ur_id": ur_id, "cf_id": cf_id},
            success: function (res) {
                alert("북마크에서 정상 제외되었습니다.")
                location.reload();
            }//suc
        })//ajax
    })//$(".un-bk")

</script>
</body>
</html>
