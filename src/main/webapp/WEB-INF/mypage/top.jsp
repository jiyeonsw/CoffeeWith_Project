<%--
  Created by IntelliJ IDEA.
  User: ian
  Date: 2022-10-02
  Time: 오후 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <style>
        .user-profil-box {
            margin-left: 40px;
            height: 160px;
            display: grid;
            position: relative;
            grid-template-columns: 60px 2fr 1fr;
            gap: 0px 10px;
            align-items: center;
        }

        .user-profil-box h2 {
            margin-bottom: -0.5rem;
        }

        .img-area {
            width: 70px;
            height: 70px;
            display: block;
            position: relative;
            overflow: hidden;

        }

        .img-area > div {
            width: 100%;
            height: 100%;

        }

        .img-area img {
            padding: 0.1rem;
            background-color: #ecf2f5;
            border: 1px solid #dee2e6;
            border-radius: 50%;
            box-shadow: 1px 1px 1px gray;
            width: 99%;
            height: 99%;
        }

        .img-area:after {
            content: "";
            position: absolute;
            right: 0;
            bottom: 0;
            width: 24px;
            height: 24px;
            background: url('${root}/images/pen.png') no-repeat;
        }

        .box-type-01 {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            border-radius: 8px;
            background: #6B4804;
            margin-bottom: 20px;
        }

        .txt, .num {
            color: #f0f0f0;
        }

        .link-area {
            height: 60px;
            line-height: 60px;
            text-align: center;
        }

        div.txt:hover {
            font-size: 20px;
        }

        .btn-d {
            width: 120px;
            margin: 0 4px;
            color: #404040;
            background: #fff;
            min-width: 72px;
            height: 40px;
            padding: 0 15px;
            font-size: 1rem;
            border-radius: 8px;
            border: 1px solid #664400;
            line-height: 33px;
            overflow: hidden;
            position: relative;
            display: inline-block;
            font-weight: 600;
            text-align: center;
        }

        .btn-d:hover {
            background: #664400;
            color: #fff;
            box-shadow: 2px 2px 2px 2px lightgray;
        }

        .pass-modal-body {
            margin: 30px 0px 30px;
            height: 300px;
            display: grid;
            gap: 20px 10px;
            justify-items: center;
        }

        .input-form {
            display: grid;
            grid-template-areas:
                    "input-tit  input-tit"
                    "input           icon"
                    "info            info";
            grid-template-columns: 0.7fr 0.3fr;
            gap: 0px 30px;
        }

        div.input-form > input {
            width: 300px;
            grid-area: input;
        }

        div.input-form > div.input-tit {
            grid-area: input-tit;
        }

        div.input-form > span {
            grid-area: icon;
            display: flex;
            align-items: center;
        }

        div.input-info {
            grid-area: info;
        }

        div.input-form > span > svg {
            width: 30px;
            height: 30px;
        }

        div.input-form svg.fa-circle-xmark > path {
            width: 100%;
            height: 100%;
            color: red;
        }

        div.input-form svg.fa-circle-check > path {
            width: 100%;
            height: 100%;
            color: green;
        }

        button.close {
            border: #f1f1f1;
            background-color: #fff;
        }
    </style>
</head>
<body>
<div class="top-container">
    <div class="user-profil-box">
        <%--이미지 클릭하면 회원정보 변경으로 이동(예정)--%>
        <a href="${root}/mypage/edit_info" class="img-area">
            <div>
                <c:if test="${sessionScope.login_img != null}">
                    <img src="${root}/res/prfimg/${sessionScope.login_img}">
                    <%--                         onerror="this.src='${root}/images/noprofile.jpg'">--%>
                </c:if>
                <c:if test="${sessionScope.login_img == null}">
                    <img src="${root}/images/noprofile.jpg">
                </c:if>
            </div>
        </a>
        <div class=" txt-area">
            <h2 class="tit-dep2 nick">&nbsp;${sessionScope.login_nick} 님 환영합니다!</h2>
        </div>
        <div>
            <button class="btn-d" onclick="location.href='${root}/mypage/edit_info'">회원정보관리</button>
            <button class="btn-d" id="update-pass-form">비밀번호변경</button>
        </div>
    </div>
    <div class="box-type-01">
        <div class="link-area">
            <a href="${root}/mypage/bookmarks" class="inner">
                <div class="txt book-marks">
                    북마크
                    <span class="num">${sessionScope.cfLkCnt}</span>
                </div>
            </a>
        </div>
        <div class="link-area">
            <a href="${root}/mypage/review" class="inner">
                <div class="txt cf-tr">
                    작성한 리뷰
                    <span class="num">${sessionScope.cfCmtCnt}</span>
                </div>
            </a>
        </div>
        <div class="link-area">
            <a href="${root}/mypage/plan" class="inner">
                <div class="txt my-tr-plan">
                    투어 플랜
                    <span class="num">${sessionScope.myPlCnt}</span>
                </div>
            </a>
        </div>
        <div class="link-area">
            <a href="#" class="inner">
                <div class="txt my-com-tr">
                    참여중인 투어
                    <span class="num"></span>
                </div>
            </a>
        </div>
    </div>
</div>
<!----------------------------- Update Modal -------------------------------------------------->
<!----------------------------- modal == md  -------------------------------------------------->
<div class="modal fade" id="cmt-md-body" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">비밀번호변경</h4>
                <button type="button" class="close" data-bs-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${root}/update_pass" method="post" id="cmt-update-form" onsubmit="return check()">
                <div class="pass-modal-body mx-3">
                    <div class="input-form">
                        <div class="input-tit">기존 비밀번호 입력</div>
                        <input type="password" class="form-control pass-form" id="existing-pass" required>
                        <span></span>
                        <div class="input-info" id="exi-success"></div>
                    </div>
                    <div class="input-form">
                        <div class="input-tit">새로운 비밀번호 입력</div>
                        <input type="password" class="form-control pass-form" id="new-pass" name="new_pass" required>
                        <span></span>
                        <div class="input-info" id="pass-success"></div>
                    </div>
                    <div class="input-form">
                        <div class="input-tit">새로운 비밀번호 재확인</div>
                        <input type="password" class="form-control pass-form" id="new-repass" required>
                        <span></span>
                        <div class="input-info" id="repass-success"></div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="submit" class="btn update-pass-btn">변경 완료</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $("#update-pass-form").click(function () {
        $("#existing-pass").next().html("");
        $(".pass-form").next().html("");
        $(".pass-form").val("");
        $(".input-info").attr("value", "").text("");
        $("#cmt-md-body").modal("toggle");
    })//$("#update-pass-form")

    // /* 리뷰 수정 완료 버튼 클릭시 알림 */
    // $(".update-pass-btn").click(function () {
    //     // alert("yes");
    //     alert("비밀번호 수정이 완료되었습니다.")
    // })

    //기존 비밀번호 정상 체크
    $("#existing-pass").keyup(function () {
        var exi_pass = $(this).val();
        var ur_id = "${sessionScope.login_id}";
        console.log(exi_pass);
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${root}/exi_pass_chk",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
            data: {"ur_id": ur_id, "exi_pass": exi_pass},
            success: function (res) {
                if (res == true) {
                    // console.log("suc")
                    $("#existing-pass").next().html('<i class="fa-solid fa-circle-check"></i>');
                    $("div#exi-success").text("기존에 사용 중인 비밀번호와 동일합니다.").attr("value", "Y");
                } else if (exi_pass == "") {
                    $("#existing-pass").next().html("");
                    $("div#exi-success").text("").attr("value", "");
                } else {
                    $("#existing-pass").next().html('<i class="fa-regular fa-circle-xmark"></i>');
                    $("div#exi-success").text("기존에 사용 중인 비밀번호와 다릅니다.").attr("value", "N");
                }
            }//success
        })//$.ajax
    })

    //비밀번호 유효성 검사
    $("#new-pass").keyup(function () {
        const inpPass = $(this).val();
        $("#new-repass").val("");
        $("div.repass-success").text("").attr("value", "");
        // console.log(inpPass);
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${root}/pass_check",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
            data: {"userPass": inpPass},
            success: function (res) {
                if (res == true) {
                    $("#new-pass").next().html('<i class="fa-solid fa-circle-check"></i>');
                    $("div#pass-success").text("입력한 비밀번호는 사용이 가능합니다.").attr("value", "Y");
                } else if (inpPass == "") {
                    $("#new-pass").next().html("");
                    $("div#pass-success").text("").attr("value", "");
                } else {
                    $("#new-pass").next().html('<i class="fa-regular fa-circle-xmark"></i>');
                    $("div#pass-success").text("영문,숫자,특수문자 구성으로 8~16자 이내로 입력해주세요.").attr("value", "N");
                }
            }
        })
    })

    //비밀번호 일치 확인
    $("#new-repass").keyup(function () {
        var p1 = $("#new-pass").val();
        var p2 = $(this).val();
        if (p1 == p2) {
            $("#new-repass").next().html('<i class="fa-solid fa-circle-check"></i>');
            $("div#repass-success").text("입력한 비밀번호를 사용 가능합니다.").attr("value", "Y");
        } else if (p2 == "") {
            $("#new-repass").next().html("");
            $("div#repass-success").text("").attr("value", "");
        } else {
            $("#new-repass").next().html('<i class="fa-regular fa-circle-xmark"></i>');
            $("div#repass-success").text("입력한 비밀번호가 일치하지 않습니다.").attr("value", "N");
        }
        //else
    })//$("#inp-repass")

    function check() {
        let exi_success = $("div#exi-success").attr("value");
        let pass_success = $("div#pass-success").attr("value");
        let repass_success = $("div#repass-success").attr("value");
        // console.log(nickSuccess)
        if (exi_success != "Y") {
            alert("기존 비밀번호를 확인해주세요.");
            return false;
        }

        if (pass_success != "Y") {
            alert("새로 사용할 비밀번호를 확인해주세요 ");
            return false;
        }

        if (repass_success != "Y") {
            alert("새로 사용할 비밀번호의 재확인이 필요합니다.");
            return false;
        }
        alert("비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.")
        return true;
    }//check()
</script>
</body>
</html>
