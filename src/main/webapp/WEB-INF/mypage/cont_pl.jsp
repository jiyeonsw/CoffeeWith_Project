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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8mlhxamjq5"></script>
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
<div class="bk_container">
    <div id="planmodal" class="modal"></div>
    <c:if test="${totalCount==0}">
        <div>
            <h4>등록된 투어가 없습니다</h4>
        </div>
    </c:if>
    <c:if test="${totalCount>0}">
        <c:forEach var="dto" items="${list}">
            <c:set var="no" value="${no-1}"/>
            <div class="bk-card">
                <div class="bk-ci-nm" id="map${no}">
                    <script>
                        var markerList = [];
                        var polypath = [];
                        //지도 생성
                        var mapOptions = {
                            center:new naver.maps.LatLng(37.4993705, 127.0290175),
                            zoom: 18
                        };
                        var map${no} = new naver.maps.Map("map${no}", mapOptions);
                        <c:forEach var="pl_loc" items="${dto.pl_loc}">
                                var marker = new naver.maps.Marker({
                                    position : new naver.maps.LatLng(${pl_loc.loc_y},${pl_loc.loc_x}),
                                    map : map${no}
                                })
                                markerList.push(marker);
                                polypath.push(marker.getPosition());
                        </c:forEach>
                        if(markerList.length>1) {
                            var bounds = new naver.maps.LatLngBounds(markerList[0].getPosition(), markerList[1].getPosition());
                            for (var i = 0; i < markerList.length; i++) {
                                var latLng = markerList[i].getPosition();
                                bounds.extend(latLng);
                            }
                            map${no}.fitBounds(bounds);
                        }
                        //색상배열
                        var rainbow = ["red","orange","yellow","green","blue","indigo","purple"];
                        //경로 생성
                        var polyline = new naver.maps.Polyline({
                            map: map${no},
                            path: polypath,
                            strokeColor: "red",
                            strokeOpacity: 0.6,
                            strokeWeight: 3,
                            zIndex: 2,
                            endIcon: naver.maps.PointingIcon.OPEN_ARROW
                        });
                    </script>
                </div>
                <div class="bk-txt-area" value="${dto.pl_nm}">
                    <h5 class="bk-cf-nm">${dto.pl_nm}</h5>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>
<div class="paging">
    <ul class="pagination">
        <c:if test="${startPage>1}">
            <li class="page-item">
                <a href="${root}/mypage/plan?currentPage=${startPage-1}"
                   class="page-link">이전</a>
            </li>
        </c:if>
        <%--페이지 번호--%>
        <c:forEach var="pnp" begin="${startPage}" end="${endPage}">
            <c:if test="${pnp==currentPage}">
                <li class="page-item active">
                    <a class="page-link"
                       href="${root}/mypage/plan?currentPage=${pnp}">${pnp}</a>
                </li>
            </c:if>
            <c:if test="${pnp!=currentPage}">
                <li class="page-item">
                    <a class="page-link"
                       href="${root}/mypage/plan?currentPage=${pnp}">${pnp}</a>
                </li>
            </c:if>
        </c:forEach>
        <c:if test="${endPage<totalPage}">
            <li class="page-item">
                <a href="${root}/mypage/plan?currentPage=${endPage+1}"
                   class="page-link">다음</a>
            </li>
        </c:if>
    </ul>
</div>
<script>
    $(document).on('click','.bk-txt-area',function (){
        var pl_nm = $(this).find("bk-cf-nm").text();
        var s = "";
        $.ajax({
            type: "get",
            url: "plandetail",
            dataType: "json",
            data:{"pl_nm":pl_nm},
            success: function(res) {
                s += "<div id='modalmap'>"+res.pl_id+"</div>"
            }
        })
        $("#planmodal").show();
    })

    <%--//투어 삭제(-) 클릭시 db data delete--%>
    <%--$(".un-bk").click(function () {--%>
    <%--    var ur_id = '${sessionScope.login_id }';--%>
    <%--    var pl_id = $(this).attr("value");--%>
    <%--    console.log(pl_id);--%>
    <%--    $.ajax({--%>
    <%--        type: "get",--%>
    <%--        url: "${root}/cafe/delete_like",--%>
    <%--        dataType: "text",--%>
    <%--        data: {"ur_id": ur_id, "pl_id": pl_id},--%>
    <%--        success: function (res) {--%>
    <%--            alert("투어를 삭제했습니다")--%>
    <%--            location.reload();--%>
    <%--        }//suc--%>
    <%--    })//ajax--%>
    <%--})//$(".un-bk")--%>

</script>
</body>
</html>
