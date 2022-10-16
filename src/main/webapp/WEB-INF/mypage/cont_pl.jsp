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
<c:set var="root" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${root}/res/css/cont_pl_style.css"/>
    <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8mlhxamjq5"></script>
</head>
<body>

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
                <div class="bk-txt-area" value="${dto.pl_id}" style="cursor: pointer;">
                    <h5 class="bk-cf-nm">${dto.pl_nm}</h5>
                    <div class="pl-txt">
                            ${dto.pl_txt}
                    </div>
                    <div class="pl-date">
                        <span>
                            <fmt:formatDate value="${dto.s_date}" pattern="MM월 dd일" type="date"/> ~ <fmt:formatDate
                                value="${dto.e_date}" pattern="MM월 dd일" type="date"/>
                        </span>
                    </div>
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

<!----------------------------- Update Modal -------------------------------------------------->
<!----------------------------- modal == md  -------------------------------------------------->
<div class="modal fade" id="pl-md-container" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">투어 플랜 상세 일정</h4>
                <button type="button" class="close" data-bs-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="pl-md-body mx-3">
                <div class="pl-md-head">
                    <div class="pl-md-nm">
                        <h4></h4>
                    </div>
                    <div class="pl-md-intro">
                    </div>
                    <div class="pl-md-date">
                    </div>
                </div>
                <div class="pl-md-detail">
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="submit" class="close" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(".bk-txt-area").on("click", function () {
        const pl_id = $(this).attr("value");
        const pl_nm = $(this).find(".bk-cf-nm").text();
        const pl_txt = $(this).find(".pl-txt").text();
        const pl_date = $(this).find(".pl-date").find("span").text();
        $(".pl-md-nm>h4").text("투어명 : " + pl_nm);
        $(".pl-md-intro").text("투어소개 : " + pl_txt);
        $(".pl-md-date").text("투어일정 : " + pl_date);
        let s = "";
        // alert(pl_date);
        $.ajax({
            type: "get",
            url: "plandetail",
            dataType: "json",
            data: {"pl_id": pl_id},
            async: false, // 동기처리하기
            success: function (res) {
                $.each(res, function (i, ele) {
                    s += '<div class="pl_detail_date">';
                    s += '<h5>' + ele.v_date + '</h5>';
                    let v_date = ele.v_date;
                    $.ajax({
                        type: "get",
                        url: "sel_pl_cf_list",
                        dataType: "json",
                        data: {"v_date": v_date, "pl_id": pl_id},
                        async: false, // 동기처리하기
                        success: function (res2) {
                            $.each(res2, function (idx, item) {
                                s += '<a class="pl_detail_time" href="${root}/cafe/detail?cf_id=' + item.cf_id + '">';
                                s += '<span class="pl_cf_img"><img src="${root}/images/cafeimg/' + item.ci_nm + '" onerror="${root}/images/noprofile.jpg" style="width:60px"></span>';
                                s += '<span class="pl_cf_nm">' + item.cf_nm + '</span>';
                                s += '<span class="pl_v_time">' + item.v_time + '</span>';
                                s += '</a>';
                            })
                        }
                    })
                    s += '</div>';
                })
                $(".pl-md-detail").html(s);
            }
        })
        $("#pl-md-container").modal("toggle");
    })

    // $(document).on('click', '.bk-txt-area', function () {
    //     var pl_nm = $(this).find("bk-cf-nm").text();
    //     var s = "";
    //     $.ajax({
    //         type: "get",
    //         url: "plandetail",
    //         dataType: "json",
    //         data: {"pl_nm": pl_nm},
    //         success: function (res) {
    //             s += "<div id='modalmap'>" + res.pl_id + "</div>"
    //         }
    //     })
    //     $("#planmodal").show();
    // })

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
