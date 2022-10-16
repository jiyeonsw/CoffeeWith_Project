<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <style>
        .titbox {
            margin-bottom: 32px;
            font-size: 2.6rem;
            line-height: 1.3;
            font-weight: 900;
            text-align: center;
        }

        .container {
            width: 450px;
            margin: 0 auto;
            padding-top: 64px;
            padding-bottom: 64px;
            text-align: left;
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
            border: 1px solid #664400;
            border-radius: 5px;
            color: #664400;
            background-color: white;
        }

        .btnB {
            width: 100%;
            border: 1px solid #664400;
            border-radius: 5px;
            background-color: #664400;
            background-color: white;
        }

        .role-box {
            display: grid;
            grid-template-columns: 0.2fr 1.8fr 0.5fr;
            row-gap: 10px;
            margin-top: 10px;
            border: 1px solid gray;
            padding: 10px 10px 10px;
        }

        input[type="checkbox"] {
            width: 15px; /*Desired width*/
            height: 15px; /*Desired height*/
            cursor: pointer;
        }

        a {
            color: #664400;
        }

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<form action="insert_user" method="post" onsubmit="return check()">
    <div id="container" class="container">
        <div id="contents" class="contents">
            <%--컨텐츠영역--%>
            <p class="titbox">
                회원가입
            </p>
            <fieldset>
                <div class="input-form">
                    <label for="inp-email" class="titLab">이메일</label>
                    <div class="inpA">
                        <input type="email" id="inp-email" placeholder="ex) coffeewith@gmail.com" class="form-control"
                               required="required" name="email_id">
                        <button type="button" id="btn-id-chk" class="btnA">중복확인</button>
                    </div>
                    <div class="id-success"></div>
                </div>
                <div class="input-form">
                    <label for="inp-pass" class="titLab">비밀번호</label>
                    <div class="inpB">
                        <input type="password" id="inp-pass" placeholder="영문,숫자,특수문자 8~16자이내" class="form-control"
                               required="required" name="ur_pw">
                    </div>
                    <div class="pass-success"></div>
                </div>
                <div class="input-form">
                    <label for="inp-repass" class="titLab">비밀번호 확인</label>
                    <div class="inpB">
                        <input type="password" id="inp-repass" placeholder="확인을 위해 한번 더 입력해주세요" class="form-control"
                               required="required">
                    </div>
                    <div class="repass-success"></div>
                </div>
                <div class="input-form">
                    <label for="inp-name" class="titLab">이름</label>
                    <div class="inpB">
                        <input type="text" id="inp-name" placeholder="이름을 입력해주세요" class="form-control"
                               required="required" name="ur_nm">
                    </div>
                </div>
                <div class="input-form">
                    <label for="inp-nick" class="titLab">닉네임</label>
                    <div class="inpA">
                        <input type="text" id="inp-nick" placeholder="닉네임을 입력해주세요" class="form-control"
                               required="required" name="ur_nk">
                        <button type="button" id="btn-nick-chk" class="btnA">중복확인</button>
                    </div>
                    <div class="nick-success"></div>
                </div>
                <hr>
                <div class="input-form">
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
                <div class="input-form">
                    <label for="chk-useRole" class="titLab">이용약관 / 개인정보 수집 및 이용 동의</label>
                    <div class="role-box" id="chk-useRole">
                        <input type="checkbox" class="allchk-col" id="role-allchk">
                        전체 동의
                        <a style="visibility: hidden;"></a>
                        <input type="checkbox" class="role-chk" required>
                        (필수) 만 14세 이상입니다.
                        <a style="visibility: hidden;"></a>
                        <input type="checkbox" class="role-chk" required>
                        (필수) 이용약관 동의
                        <a href="#">내용보기</a>
                        <input type="checkbox" class="role-chk" required>
                        (필수) 개인정보 수집 및 이용 동의
                        <a href="#">내용보기</a>
                    </div>
                </div>
                <button type="submit" id="inp-btn" class="btnB">회원가입</button>
            </fieldset>
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
        //ajax가 실행되기전까지 선택되지않도록 세팅
        $("#sel-si").attr("disabled", true);
        $.ajax({
            type: "get",
            dataType: "json",
            url: "select_si",
            success: function (res) {
                //ajax가 실행되기전까지 선택되지않도록 세팅
                $("#sel-si").attr("disabled", false);
                $.each(res, function (idx, val) {
                    if (val != "") {
                        var cityOption = "<option value='" + val + "'>" + val + "</option>";
                        $("#sel-si").append(cityOption);
                    }
                })
            }
        })
    }

    $("#sel-si").change(function () {
        // alert($("#sel-si option:selected").text());
        var selGu = $("#sel-si option:selected").text();
        console.log(selGu);

        $("#sel-gu").children('option:not(:first)').remove();
        //ajax가 실행되기전까지 선택되지않도록 세팅
        $("#sel-gu").attr("disabled", true);
        $.ajax({
            type: "get",
            dataType: "json",
            data: {"selGu": selGu},
            url: "select_gu",
            success: function (res) {
                //ajax가 실행되기전까지 선택되지않도록 세팅
                $("#sel-gu").attr("disabled", false);
                // alert("yes");
                $.each(res, function (idx, val) {
                    if (val != "") {
                        console.log(val);
                        var guOption = "<option value='" + val + "'>" + val + "</option>";
                        $("#sel-gu").append(guOption);
                    }
                })
            }
        })
    })


    //이메일 아이디 변경 시 체크
    $("#inp-email").change(function () {
        $("div.id-success").text("입력하신 이메일 아이디를 중복 조회해주세요.").attr("value", "");
    })//$("#inp-email")

    //이메일 아이디 중복 조회
    $("#btn-id-chk").click(function () {
        const inpEmail = $("#inp-email").val();
        $("#inp-email").attr("disabled", true);
        $.ajax({
            type: "get",
            dataType: "json",
            url: "id_check",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
            data: {"emailId": inpEmail},
            success: function (res) {
                $("#inp-email").attr("disabled", false);
                if (inpEmail == "") {
                    // console.log(res.countId)
                    $("div.id-success").text("입력하신 이메일 아이디가 없습니다.").attr("value", "");
                } else if (res.countId == 0) {
                    $("div.id-success").text("해당 이메일 아이디로 가입하실 수 있습니다.").attr("value", "Y");
                } else {
                    $("div.id-success").text("해당 이메일 아이디는 가입이 불가능합니다.").attr("value", "N");
                }
            }//success
        })//$.ajax
    })//$("#btn-id-chk")

    //닉네임 중복 조회
    $("#btn-nick-chk").click(function () {
        const inpNick = $("#inp-nick").val();
        $("#inp-nick").attr("disabled", true);
        $.ajax({
            type: "get",
            dataType: "json",
            url: "nick_check",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
            data: {"userNick": inpNick},
            success: function (res) {
                $("#inp-nick").attr("disabled", false);
                if (res.countNick == 0) {
                    console.log(res.countNick)
                    $("div.nick-success").text("해당 닉네임으로 사용가능합니다.").attr("value", "Y");
                } else {
                    $("div.nick-success").text("입력하신 닉네임은 현재 사용중입니다.").attr("value", "N");
                }
            }
        })
    })//$("#btn-nick-chk")

    //비밀번호 유효성 검사
    $("#inp-pass").keyup(function () {
        const inpPass = $(this).val();
        $("#inp-repass").val("");
        $("div.repass-success").text("").attr("value", "");
        // console.log(inpPass);
        $.ajax({
            type: "post",
            dataType: "json",
            url: "pass_check",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
            data: {"userPass": inpPass},
            success: function (res) {
                if (res == true) {
                    $("div.pass-success").text("입력한 비밀번호는 사용이 가능합니다.").attr("value", "Y");
                } else {
                    $("div.pass-success").text("영문,숫자,특수문자 구성으로 8~16자 이내로 입력해주세요.").attr("value", "N");
                }
            },
            error: function (request, status) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        })
    })// $("#inp-pass")

    //비밀번호 일치 확인
    $("#inp-repass").keyup(function () {
        var p1 = $("#inp-pass").val();
        var p2 = $(this).val();
        var pass_suc = $("div.pass-success").attr("value");
        if (p1 == p2 && pass_suc == 'Y') {
            console.log(pass_suc);
            $("div.repass-success").text("입력한 비밀번호를 사용 가능합니다.").attr("value", "Y");
        } else if (p2 == "" || pass_suc == 'N') {
            $("div.repass-success").text("").attr("value", "");
        } else {
            $("div.repass-success").text("입력한 비밀번호가 일치하지 않습니다.").attr("value", "N");
        }
        //else
    })//$("#inp-repass")

    //이용약관 전체 체크
    $("#role-allchk").click(function () {
        var allchk = $(this).prop("checked");
        // console.log(allchk);
        if (allchk == true) {
            $(".role-chk").prop("checked", true);
        } else {
            $(".role-chk").prop("checked", false);
        }
    })// $("#role-allchk")

    function check() {

        if ($("#inp-name").val().length <= 1) {
            alert("이름을 정확히 입력해주세요");
            return false;
        }

        if ($("#inp-nick").val().length <= 2) {
            alert("닉네임을 3글자 이상 입력해주세요");
            return false;
        }
        var idChk = $(".id-success").attr("value");
        var passChk = $(".pass-success").attr("value");
        var repassChk = $(".repass-success").attr("value");
        if (idChk != 'Y') {
            alert("동일한 이메일 아이디가 존재합니다. 수정 후 회원가입해주세요.");
            return false;
        }

        if (passChk != 'Y') {
            alert("입력한 비밀번호를 다시 한번 확인해주세요.");
            return false;
        }

        if (repassChk != 'Y') {
            alert("재확인 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
            return false;
        }

        return true;
    }//check()
</script>
</body>
</html>