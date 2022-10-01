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
        .titDep {
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
            text-align: left;
        }

        .inp-frm {
            width: 450px;
            display: flex;
            flex-direction: column;
            margin-bottom: 13px;
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


    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<form action="insert_user" method="post" onsubmit="return check()">
    <div id="container" class="container">
        <div id="contents" class="contents">
            <%--컨텐츠영역--%>
            <p class="titDep">
                회원가입
            </p>
            <fieldset>
                <div class="inp-frm">
                    <label for="inp-email" class="titLab">이메일</label>
                    <div class="inpA">
                        <input type="email" id="inp-email" placeholder="example@coffewith.com" class="form-control"
                               required="required" name="emailId">
                        <button type="button" id="btn-id-chk" class="btn btn-outline-info btnA">중복확인</button>
                    </div>
                    <div class="id-success"></div>
                </div>
                <div class="inp-frm">
                    <label for="inp-pass" class="titLab">비밀번호</label>
                    <div class="inpB">
                        <input type="password" id="inp-pass" placeholder="영문,숫자,특수문자 8~16자이내" class="form-control"
                               required="required" name="userPass">
                    </div>
                    <div class="pass-success"></div>
                </div>
                <div class="inp-frm">
                    <label for="inp-repass" class="titLab">비밀번호 확인</label>
                    <div class="inpB">
                        <input type="password" id="inp-repass" placeholder="확인을 위해 한번 더 입력해주세요" class="form-control"
                               required="required">
                    </div>
                    <div class="repass-success"></div>
                </div>
                <div class="inp-frm">
                    <label for="inp-email" class="titLab">이름</label>
                    <div class="inpB">
                        <input type="text" id="inp-name" placeholder="이름을 입력해주세요" class="form-control"
                               required="required" name="userName">
                    </div>
                </div>
                <div class="inp-frm">
                    <label for="inp-nick" class="titLab">닉네임</label>
                    <div class="inpB">
                        <input type="text" id="inp-nick" placeholder="닉네임을 입력해주세요" class="form-control"
                               required="required" name="userNick">
                    </div>
                </div>
                <div class="inp-frm">
                    <label for="inp-nick" class="titLab">시/도</label>
                    <div class="inpB">
                        <select id="sel-si" class="form-select"></select>
                    </div>
                </div>

                <button type="submit" id="inp-btn" class="btn btn-info" style="width: 450px;">회원가입</button>
            </fieldset>
        </div>
    </div>
</form>
<script>
    $("#sel-si").click(function () {
        $.ajax({
            type: "get",
            dataType: "json",
            url: "select_si",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
            success: function (res) {
                alert("yes");
                $.each(res, function (idx, val) {
                    console.log(idx + " : " + val);
                })
            }
        })

    })

    //이메일 아이디 변경 시 체크
    $("#inp-email").change(function () {
        $("div.id-success").text("입력하신 이메일 아이디를 중복 확인해주세요.").attr("value", "");
    })//$("#inp-email")

    //이메일 아이디 중복 조회
    $("#btn-id-chk").click(function () {
        const inpEmail = $("#inp-email").val();
        $.ajax({
            type: "get",
            dataType: "json",
            url: "id_check",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
            data: {"emailId": inpEmail},
            success: function (res) {
                if (res.countId == 0) {
                    // console.log(res.countId)
                    $("div.id-success").text("해당 이메일 아이디로 가입하실 수 있습니다.").attr("value", "Y");
                } else {
                    $("div.id-success").text("해당 이메일 아이디는 가입이 불가능합니다.").attr("value", "N");
                }
            }//success
        })//$.ajax
    })//$("#btn-id-chk")

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
                    $("div.pass-success").text("입력한 비밀번호는 사용이 가능합니다.");
                } else {
                    $("div.pass-success").text("영문,숫자,특수문자 구성으로 8~16자 이내로 입력해주세요.");
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
        if (p1 == p2) {
            $("div.repass-success").text("입력한 비밀번호를 사용 가능합니다.").attr("value", "Y");
        } else if (p2 == "") {
            $("div.repass-success").text("").attr("value", "");
        } else {
            $("div.repass-success").text("입력한 비밀번호가 일치하지 않습니다.").attr("value", "N");
        }
        //else
    })//$("#inp-repass")

    function check() {

        if ($("#inp-name").val().length <= 1) {
            alert("이름을 정확히 입력해주세요");
            return false;
        }
        var idChk = $(".id-success").attr("value");
        var passChk = $(".repass-success").attr("value");
        if (idChk != 'Y') {
            alert("동일한 이메일 아이디가 존재합니다. 수정 후 회원가입해주세요.");
            return false;
        }

        if (passChk != 'Y') {
            alert("입력한 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
            return false;
        }
    }//check()
</script>
</body>
</html>