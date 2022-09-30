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
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Lobster&family=Rubik+Beastly&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style type="text/css">
        * {
            font-family: 'Gugi';
        }

        .container {
            width: 560px;
            margin: 0 auto;
            padding-top: 64px;
            text-align: left;
        }

        .inp-box {
            flex-direction: column;
        }

        .inpA {
            display: flex;
        }


        .inpA > input {
            padding-right: 50px;
        }

    </style>
    <script type="text/javascript">
        /* $(function () {

             //아이디 입력시 .idsuccess 값 지움
             $("#loginid2").keydown(function () {
                 $("div.idsuccess").text("");
             })

             //중복체크 버튼시 아이디 체크
             $("#btn-idcheck").click(function () {
                 $.ajax({
                     type: "get",
                     dataType: "json",
                     url: "idcheck",//상대주소임으로 달라지는 부분만 작성하면됨.(만약 앞도 다를경우 ../ 하고 올라가야함)
                     data: {"id": $("#loginid2").val()},
                     success: function (res) {
                         if (res.count == 0) {
                             $("div.idsuccess").text("ok");
                         } else {
                             $("div.idsuccess").text("fail");
                         }
                     }//success
                 })//$.ajax
             })//$("#btnidcheck")

             //2번째 비밀번호 입력시 체크
             $("#pass2").keyup(function () {
                 var p1 = $("#pass").val();
                 var p2 = $(this).val();
                 if (p1 == p2) {
                     $("div.passsuccess").text("ok");
                 } else {
                     $("div.passsuccess").text("다름");
                 }
             })//$("#pass2")
         })//$(function)

         //submit 전에 호출
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
         }//check()*/
    </script>
</head>
<body>
<div id="container" class="container">
    <div id="contents" class="contents">
        <%--컨텐츠영역--%>
        <p class="titDep">
            "회원가입"
        </p>
        <div class="inp-box">
            <label for="inp-email" class="titLab">이름</label>
            <div class="inpA">
                <input type="email" id="inp-email" placeholder="example@coffewith.com" class="form-control"
                       required="required">
                <button type="button" id="btn-idcheck" class="btn btn-outline-info">중복확인</button>
            </div>
        </div>
    </div>
</div>
<%--<form class="table-container" action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
    <table class="table table-bordered" style="width: 600px">
        <tr>
            <td>
                <div class="input-group">
                    아이디(이메일)
                    <input type="text" placeholder="아이디입력" id="loginid2" name="loginid"
                           class="form-control" style="width: 120px;" required="required">
                    <button type="button" id="btn-idcheck" class="btn btn-outline-info">중복체크</button>
                    &nbsp;
                    <div class="idsuccess">id check</div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group">
                    <input type="password" style="width: 120px" class="form-control"
                           name="pass" id="pass" placeholder="숫자4자리" maxlength="4" pattern="[0-9]{4,}"
                           required="required">
                    <input type="password" style="width: 120px" class="form-control"
                           id="pass2" placeholder="숫자4자리" maxlength="4" pattern="[0-9]{4,}">
                    &nbsp;
                    <div class="passsuccess">pass check</div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" name="name" class="form-control" style="width: 150px"
                       placeholder="이름을 입력하세요" required="required">
            </td>
        </tr>
        <tr>
            <td>
                <input type="email" name="email" class="form-control"
                       placeholder="이메일을 입력하세요" required="required">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="input-group">
                    <input type="text" name="hp" placeholder="(-)없이 휴대폰번호만 입력" class="form-control"
                           style="width: 200px" required="required">
                    <input type="text" name="address" placeholder="주소를 입력하세요" class="form-control"
                           style="width: 300px" required="required">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit" class="btn btn-info" style="width: 180px">회원가입</button>
            </td>
        </tr>
    </table>--%>
</form>
</body>
</html>