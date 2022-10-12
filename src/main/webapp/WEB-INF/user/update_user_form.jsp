<%--
  Created by IntelliJ IDEA.
  User: ian
  Date: 2022-10-09
  Time: 오전 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <meta charset="UTF-8">

    <style>
        .container {
            width: 450px;
            margin: 0 auto;
            padding-top: 64px;
            text-align: left;
        }

        .titbox {
            margin-bottom: 30px;
            font-size: 2.6rem;
            line-height: 1.3;
            font-weight: 900;
            text-align: center;
        }

        .profil-img-box {
            display: flex;
            justify-content: center;
        }


        .img-area {
            display: block;
            position: relative;
            margin-bottom: 30px;
            width: 120px;
            height: 120px;
            cursor: pointer;
        }

        .img-area img {
            padding: 0.25rem;
            background-color: #ecf2f5;
            border: 1px solid #dee2e6;
            border-radius: 50%;
            box-shadow: 1px 1px 1px gray;
            width: 100%;
            height: 100%;
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

        .input-form {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .inpA {
            display: flex;
        }

        .inpA > input {
            padding-right: 50px;
        }

        .btnA {
            width: 100px;
        }

        .btnB {
            width: 100%;
        }

        input[type="checkbox"] {
            width: 15px; /*Desired width*/
            height: 15px; /*Desired height*/
            cursor: pointer;
        }

    </style>
</head>
<body>
<form action="${root}/update_user" method="post" onsubmit="return check()" enctype="multipart/form-data">
    <input type="hidden" name="ur_id" value="${sessionScope.login_id}">
    <div id="container" class="container">
        <div id="contents" class="contents">
            <%--컨텐츠영역--%>
            <p class="titbox">
                회원정보관리
            </p>
            <div class="profil-img-box">
                <input type="file" id="new-photo" name="profile_img" style="display: none;">
                <a class="img-area" id="profil-img-area">
                    <img src="${root}/res/prfimg/${ur_img}" id="profile-img"
                         onerror="this.src='${root}/images/noprofile.jpg'"/>
                </a>
            </div>
            <div class=" input-form">
                <label for="inp-email" class="titLab">이메일</label>
                <div class="inpA">
                    <input type="email" id="inp-email" class="form-control" value="${email_id}"
                           disabled>
                </div>
            </div>
            <div class="input-form">
                <label for="inp-name" class="titLab">이름</label>
                <div class="inpB">
                    <input type="text" id="inp-name" class="form-control" value="${ur_nm}"
                           disabled>
                </div>
            </div>
            <div class="input-form">
                <label for="inp-nick" class="titLab">닉네임</label>
                <div class="inpA">
                    <input type="hidden" id="existing-nick" value="${ur_nk}">
                    <input type="text" id="inp-nick" placeholder="닉네임을 입력해주세요" class="form-control"
                           required="required" name="ur_nk" value="${ur_nk}">
                    <button type="button" id="btn-nick-chk" class="btn btn-outline-info btnA">중복확인</button>
                </div>
                <div class="nick-success"></div>
            </div>
            <hr>
            <div class="input-form">
                <input type="hidden" id="existing-sel-si" value="${loc_si}">
                <input type="hidden" id="existing-sel-gu" value="${loc_gu}">
                <label for="sel-si" class="titLab">선호지역</label>
                <div class="inpB">
                    <select id="sel-si" class="form-select" name='loc_si'>
                        <option disabled selected>선택</option>
                    </select>
                </div>
                <div class="inpB">
                    <select id="sel-gu" class="form-select" name='loc_gu'>
                        <option disabled selected>선택</option>
                    </select>
                </div>
            </div>
            <hr>
            <button type="submit" id="inp-btn" class="btn btn-info btnB">회원정보 수정완료</button>
        </div>
    </div>
</form>
<script>

    $("#profil-img-area").click(function () {
        $("#new-photo").trigger("click");
    })

    $(function () {
        $("#new-photo").on("change", editImgFileSelect);
    })

    function editImgFileSelect(e) {
        //정규표현식
        var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/;
        var f = $(this)[0].files[0];//현재 선택한 파일
        if (!f.type.match(reg)) {
            alert("확장자가 이미지파일이 아닙니다");
            return;
        }
        if ($(this)[0].files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#profile-img").attr("src", e.target.result);
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }
    }


    $(document).ready(function () {
        selCity();
    })

    $("#sel-si").change(function () {
        selGu();
    })

    /* 닉네임 중복 조회 */
    $("#btn-nick-chk").click(function () {
        const inpNick = $("#inp-nick").val();
        const exiNick = $("#existing-nick").val();
        $("#inp-nick").attr("disabled", true);
        $.ajax({
            type: "get",
            dataType: "json",
            url: "${root}/nick_check",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
            data: {"userNick": inpNick},
            success: function (res) {
                $("#inp-nick").attr("disabled", false);
                if (res.countNick == 0) {
                    // console.log(res.countNick)
                    $("div.nick-success").text("해당 닉네임으로 사용가능합니다.").attr("value", "Y");
                } else if (inpNick == exiNick) {
                    $("div.nick-success").text("해당 닉네임으로 사용가능합니다.").attr("value", "Y");
                } else {
                    $("div.nick-success").text("해당 닉네임으로는 사용이 불가능 합니다.").attr("value", "N");
                }
            }
        })
    })//닉네임 중복 조회

    /* 닉네임 imput이 변경될 경우 다시 안내 및 value 초기화*/
    $("#inp-nick").change(function () {
        $("div.nick-success").text("입력하신 닉네임을 중복 조회해주세요.").attr("value", "");
    })


    /* -------------------- function ------------------- */

    /* 선호지역(시/도) 옵션 구현(DB(지역추출)-> Controller -> ajax(출력)) */
    function selCity() {
        //중복 출력 되지 않도록 기존출력값(selected는 제외한) remove
        $("#sel-si").children('option:not(:first)').remove();
        const exi_sel_si = $("#existing-sel-si").val();
        // console.log(exi_sel_si);
        //ajax가 실행되기전까지 선택되지않도록 세팅
        $("#sel-si").attr("disabled", true);
        $.ajax({
            type: "get",
            dataType: "json",
            url: "${root}/select_si",
            success: function (res) {
                //ajax가 실행되기전까지 선택되지않도록 세팅
                $("#sel-si").attr("disabled", false);
                $.each(res, function (idx, val) {

                    if (val != "") {
                        var cityOption = "<option name='sel-si-nm' value='" + val + "'>" + val + "</option>";
                        $("#sel-si").append(cityOption);
                    }
                })

                /* 기존 등록된 선호지역(시/도) DBdata selected */
                let arr = $('option[name=sel-si-nm]');
                $.each(arr, function (i) {
                    // console.log(arr[i].value);
                    // console.log(exi_sel_si);
                    if (arr[i].value == exi_sel_si) {
                        // console.log("yes");
                        $(arr[i]).prop("selected", true);
                    }
                })
                selGu();
            }
        })
    }

    /* 선호지역(구) 옵션 구현 */
    function selGu() {
        // alert($("#sel-si option:selected").text());
        var sel_gu = $("#sel-si option:selected").text();
        const exi_sel_gu = $("#existing-sel-gu").val();
        // console.log(selGu);

        $("#sel-gu").children('option:not(:first)').remove();
        //ajax가 실행되기전까지 선택되지않도록 세팅
        $("#sel-gu").attr("disabled", true);
        $.ajax({
            type: "get",
            dataType: "json",
            data: {"selGu": sel_gu},
            url: "${root}/select_gu",
            success: function (res) {
                //ajax가 실행되기전까지 선택되지않도록 세팅
                $("#sel-gu").attr("disabled", false);
                // alert("yes");
                $.each(res, function (idx, val) {
                    if (val != "") {
                        // console.log(val);
                        var guOption = "<option name='sel-gu-nm' value='" + val + "'>" + val + "</option>";
                        $("#sel-gu").append(guOption);
                    }
                })

                /* 기존 선호지역(구) DBdata selected */
                let arr = $('option[name=sel-gu-nm]');
                $.each(arr, function (i) {
                    // console.log(arr[i].value);
                    // console.log(exi_sel_si);
                    if (arr[i].value == exi_sel_gu) {
                        // console.log("yes");
                        $(arr[i]).prop("selected", true);
                    }
                })
            }
        })
    }

    /* onsubmit return check */
    function check() {
        let nickSuccess = $("div.nick-success").attr("value");
        console.log($("#new-photo").val())
        // console.log(nickSuccess)
        if (nickSuccess != "Y") {
            alert("닉네임을 다시 중복 조회 해주세요.");
            return false;
        }

        return true;
    }//check()
</script>
</body>
</html>
