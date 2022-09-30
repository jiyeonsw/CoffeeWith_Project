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
    <script>

    </script>
</head>
<body>
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
                           required="required">
                    <button type="button" id="btn-id-chk" class="btn btn-outline-info btnA">중복확인</button>
                </div>
                <div class="id-success"></div>
            </div>
            <div class="inp-frm">
                <label for="inp-pass" class="titLab">비밀번호</label>
                <div class="inpB">
                    <input type="password" id="inp-pass" placeholder="영문,숫자,특수문자 8~16자이내" class="form-control"
                           required="required">
                </div>
            </div>
            <div class="inp-frm">
                <label for="inp-repass" class="titLab">비밀번호 확인</label>
                <div class="inpB">
                    <input type="password" id="inp-repass" placeholder="확인을 위해 한번 더 입력해주세요" class="form-control"
                           required="required">
                </div>
            </div>
            <div class="inp-frm">
                <label for="inp-email" class="titLab">이름</label>
                <div class="inpb">
                    <input type="email" id="inp-name" placeholder="이름을 입력해주세요" class="form-control"
                           required="required">
                </div>
            </div>
            <div class="inp-frm">
                <label for="inp-phone" class="titLab">휴대전화번호</label>
                <div class="inpA">
                    <input type="text" id="inp-phone" placeholder="010-0000-0000" class="form-control"
                           required="required">
                    <button type="button" id="btn-phone-chk" class="btn btn-outline-info btnA">본인확인</button>
                </div>
            </div>
            <div class="inp-frm">
                <label for="sel-gender" class="titLab">성별</label>
                <div class="inpA" id="sel-gender">
                    <button type="button" class="btn btn-outline-info btnB" value="men">남성</button>
                    <button type="button" class="btn btn-outline-info btnB" value="women">여성</button>
                </div>
            </div>

        </fieldset>
    </div>
</div>
<script>
    $("#btn-id-chk").click(function () {
        /*alert($("#inp-email").val());*/
        $.ajax({
            type: "get",
            dataType: "json",
            url: "id_check",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
            data: {"email_id": $("#inp-email").val()},
            success: function (res) {
                if (res.countId == 0) {
                    $("div.id-success").text("ok");
                } else {
                    $("div.id-success").text("fail");
                }
            }//success
        })
    })

    function check() {

        //중복체크
        if ($("div.idsuccess").text() != 'ok') {
            alert("아이디 중복체크를 해주세요");
            return false; //false를 해야 return이 호출되지 않음.
        }
        //비밀번호
        if ($("div.passsuccess").text() != 'ok') {
            alert("비밀번호가 서로 다릅니다");
            return false; //false를 해야 return이 호출되지 않음.
        }
    }//check()
</script>
</form>
</body>
</html>