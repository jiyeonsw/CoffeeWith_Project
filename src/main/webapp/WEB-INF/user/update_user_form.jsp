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
            margin-bottom: 32px;
            font-size: 2.6rem;
            line-height: 1.3;
            font-weight: 900;
            text-align: center;
        }

        .img-area {
            display: block;
            position: relative;
            margin-bottom: 20px;
        }

        .img-area > div {
            width: 120px;
            height: 120px;
        }

        .img-area img {
            padding: 0.25rem;
            background-color: #ecf2f5;
            border: 1px solid #dee2e6;
            border-radius: 50%;
            box-shadow: 1px 1px 1px gray;
            max-width: 100%;
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
<form action="update_user" method="post" onsubmit="return check()">
    <div id="container" class="container">
        <div id="contents" class="contents">
            <%--컨텐츠영역--%>
            <p class="titbox">
                회원정보관리
            </p>
            <a class="img-area">
                <div>
                    <img src="${root}/images/${ur_img}"
                         onerror="this.src='${root}/images/noprofile.jpg'"/>
                </div>
            </a>

            <div class=" input-form">
                <label for="inp-email" class="titLab">이메일</label>
                <div class="inpA">
                    <input type="email" id="inp-email" class="form-control" name="email_id" value="${email_id}"
                           disabled>
                </div>
            </div>
            <div class="input-form">
                <label for="inp-name" class="titLab">이름</label>
                <div class="inpB">
                    <input type="text" id="inp-name" class="form-control" name="ur_nm" value="${ur_nm}"
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
    $(document).ready(function () {
        selCity();
    })

    //선호지역 옵션 구현(DB(지역추출)-> Controller -> ajax(출력))
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

                /* 기존 등록된 선호지역(시/도) selected */
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

    $("#sel-si").change(function () {
        selGu();
    })

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

                /* 기존 등록된 선호지역(구) selected */
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

    $("#inp-nick").change(function () {
        $("div.nick-success").text("입력하신 닉네임을 중복 조회해주세요.").attr("value", "");
    })//$("#inp-email")

    //닉네임 중복 조회
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
    })//$("#btn-nick-chk"),

    function check() {
        let nickSuccess = $("div.nick-success").attr("value");
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
