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
        /*  .bk_container div, .bk_container img {
              border: 1px solid gray;
          }*/

        .bk_container {
            display: grid;
            padding: 40px 20px 20px;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 20px 0px;
            justify-items: center;
            min-height: 1600px;
        }

        div.bk-card {
            width: 270px;
            height: 260px;
            overflow: hidden;
        }

        div.bk-card:hover {
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
            margin-bottom: 10px;

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
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<%--bookmark == bk--%>
<div class="bk_container">
    <c:if test="${totalCount==0}">
        <div>
            <h4>등록된 글이 없습니다</h4>
        </div>
    </c:if>
    <c:if test="${totalCount>0}">
        <c:forEach var="dto" items="${list}">
            <c:set var="no" value="${no-1}"/>
            <div class="bk-card"
                 onclick="location.href='${root}/cafe/detail?cf_id=${dto.cf_id}'">
                <div class="bk-ci-nm"
                     style="background-image:url('${root}/images/cafeimg/${dto.ci_nm}'),url('${root}/images/noimage.png')">
                </div>
                <div class=" bk-txt-area">
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
</body>
</html>
