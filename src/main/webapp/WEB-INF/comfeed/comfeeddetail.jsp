<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffeewith</title>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="../res/css/style.css" type="text/css">
    <style type="text/css">

        .fddata a{
            text-decoration: none;
            color: black;
        }

        .fddata {
            width: 100%;
            text-align: center;
            margin: auto;
        }

        .table {
            height: 750px;
            margin-bottom: 0;
            border-collapse: collapse;
        }

        .table .photo {
            border: hidden;
            height: 100%;
            width: 70%;
            vertical-align: middle;
            text-align: center;
            padding: 0;
        }

        .table .profile {
            height: 5%;
            text-align: left;
            padding-bottom: 0;
            border-bottom: hidden;
        }

        .table .fdcafe {
            text-align: left;
            height: 3%;
            padding: 0;
            padding-left: 10px;
        }

        .table .fdcafe a{
            font-size: 16px;
        }

        .table .profile img {
            height: 40px;
            width: 40px;
            border-radius: 100%;
        }

        .table .fdcontent {
            height: 5%;
            vertical-align: top;
            text-align: left;
        }

        .table .fdcmt{
            height: 95%;
            border: hidden;
            text-align: left;
        }

        .table .fdmpl{
            height: 20px;
            padding: 10px;
            text-align: right;
        }

        .table .fdmpl a{
            font-size: 13px;
        }

        .table .fdlkdt{
            height: 50px;
            border-bottom: hidden;
            padding: 10px;
            display: flex;
            justify-content: space-between;
        }

        .table .fdlkdt .fddate{
            font-size: 13px;
        }

        .table .fdcmtform{
            height: 50px;
            padding: 10px;
            flex-direction: row;
            align-items: center;
            position: relative;
            display: flex;
            border: none;
        }

        .table .fdcmtform input{
            height: 30px;
            width: 80%;
            border: none;
        }

        .table .fdcmtform button{
            border: none;
            width: 20%;
            height: 30px;
        }

        #imgdetail {
            width: 100%;
            height: 100%;
        }

        #imgdetail .carousel-inner {
            width: 100%;
            height: 100%;
        }

        #imgdetail .carousel-item {
            height: 100%;
        }

        #imgdetail .carousel-item img {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
        }

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="fddata">
    <table class="table">
        <tr>
            <td rowspan="7" class="photo">
                <!-- Carousel -->
                <div id="imgdetail" class="carousel slide" data-bs-interval="false">
                    <div class="carousel-inner" data-bs-interval="false">
                        <c:forEach var="photo" varStatus="i" items="${comfeeddto.fd_photo.split(',')}">
                            <c:if test="${i.count==1}">
                                <div class="carousel-item active">
                            </c:if>
                            <c:if test="${i.count!=1}">
                                <div class="carousel-item">
                            </c:if>
                            <img src="${root}/images/upload/${photo}">
                            </div>
                            <c:if test="${i.count==2}">
                                <button class="carousel-control-prev" type="button" data-bs-target="#imgdetail"
                                        data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#imgdetail"
                                        data-bs-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </button>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </td>
            <td class="profile">
                <img src="${root}/res/prfimg/${userdto.ur_img}">
                ${userdto.ur_nk}
            </td>
        </tr>
        <tr>
            <td class="fdcafe">
                <a href="${root}/cafe/detail?cf_id=${cafedto.cf_id}">${cafedto.cf_nm}</a>
            </td>
        </tr>
        <tr>
            <td class="fdcontent">
                ${comfeeddto.fd_txt}
            </td>
        </tr>
        <tr>
            <td class="fdcmt">
            </td>
        </tr>
        <tr>
        <c:if test="${sessionScope.login_id==comfeeddto.ur_id}">
            <td class="fdmpl">
                <a id="updatefd" onclick="updatemodal()">수정하기</a>&nbsp;&nbsp;&nbsp;
                <a id="deletefd" onclick="deletemodal()">삭제하기</a>
            </td>
        </c:if>
         </tr>
        <tr>
            <td class="fdlkdt">
                <div class="fdlikes">
                    <c:if test="${comfeeddto.likes==0}"><i class='far fa-heart' onclick="likeaction()" style="cursor: pointer"></i></c:if>
                    <c:if test="${comfeeddto.likes>0}"><i class='fas fa-heart' onclick="likeaction()" style="cursor: pointer"></i></c:if>
                    <span id="fl-cnt">${comfeeddto.likes}</span>
                </div>
                <div class="fddate">
                    <c:if test="${comfeeddto.u_date!=null}">
                        수정됨&nbsp;&nbsp;&nbsp;
                        <fmt:formatDate value="${comfeeddto.u_date}" type="date" pattern="yyyy-MM-dd"></fmt:formatDate>
                    </c:if>
                    <c:if test="${comfeeddto.u_date==null}">
                        <fmt:formatDate value="${comfeeddto.w_date}" type="date" pattern="yyyy-MM-dd"></fmt:formatDate>
                    </c:if>
                </div>
            </td>
        </tr>
        <tr>
            <td class="fdcmtform">
                <input type="text" placeholder="댓글 달기...">
                <button type="submit">등록</button>
            </td>
        </tr>
    </table>
</div>

<script>

    lg_id = "${sessionScope.login_id}"
    fd_id = "${comfeeddto.fd_id}"

    function updatemodal(){
        $("#modaltmp .modal-content").load("update?fd_id=" + fd_id);
    }

    function deletemodal(){
        location.href="delete?fd_id=${comfeeddto.fd_id}"
        alert("삭제 완료")
    }

    function likeaction(){
        if(lg_id==""){
            alert("로그인이 필요합니다")
        }
        else{
            $.ajax({
                type: "get",
                url: "select_like",
                dataType: "json",
                data: {"lg_id": lg_id, "fd_id": fd_id},
                success: function (res) {
                    var fl_chk = res.fl_chk;
                    if (fl_chk == 0) {
                        $.ajax({
                            type: "get",
                            url: "insert_like",
                            dataType: "json",
                            data: {"lg_id": lg_id, "fd_id": fd_id},
                            success: function (res) {
                                var fl_cnt=res.fl_cnt;
                                var pre_fl_cnt=$("#fl-cnt").text();
                                if (pre_fl_cnt==0){
                                    $(".fdlike").find("svg").removeClass("fas");
                                    $(".fdlike").find("svg").addClass("far");
                                }
                                $("#fl-cnt").html(fl_cnt);
                            }
                        });
                    } else {
                        $.ajax({
                            type: "get",
                            url: "delete_like",
                            dataType: "json",
                            data: {"lg_id": lg_id, "fd_id": fd_id},
                            success: function (res) {
                                var fl_cnt=res.fl_cnt;
                                var pre_fl_cnt=$("#fl-cnt").text();
                                if (pre_fl_cnt==1){
                                    $(".fdlike").find("svg").removeClass("far");
                                    $(".fdlike").find("svg").addClass("fas");
                                }
                                $("#fl-cnt").html(fl_cnt);
                            }
                        });
                    }

                    $.ajax({
                        type:"post",
                        url:"update_like",
                        dataType:"json",
                        data:{"fd_id":fd_id},
                        success: function (res){
                            alert("좋아요")
                        }
                    })
                }
            })
        }
    }

</script>
</body>
</html>