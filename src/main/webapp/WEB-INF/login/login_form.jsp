<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <title>Login Page</title>

    <style>
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .loginmain {
            width: 450px;
            margin: 0 auto;
            padding-top: 64px;
            text-align: left;
        }

        .titlogin {
            margin-bottom: 32px;
            font-size: 2.6rem;
            line-height: 1.3;
            font-weight: 900;
            text-align: center;
        }

        .loginbutton {
            width: 450px;
            text-align: center;
        }

        .findlink {
            text-align: center;
            font-size: 18px;
        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<div id="loginmain" class="loginmain">
    <p class="titlogin">로그인</p>
    <p>♥ 로그인 하시고 카페지도부터 투어모집까지 커피위드를 즐겨보세요 ♥</p>
    <br>

    <form name="mForm" method="post" action="../layout/main.jsp" > <!-- Form 연결 : main -->

        <label for="email_id" class="titLab">아이디</label>
        <input type="text" name="email_id" id="email_id" placeholder="공백 없이 입력해주세요" class="form-control" required="required">
        <br>
        <label for="ur_pw" class="titLab">비밀번호</label>
        <input type="password" name="ur_pw" id="ur_pw" placeholder="비밀번호를 입력해주세요" class="form-control" required="required">
        <br>
        <button type="submit" id="loginbutton" class="btn btn-secondary">로그인</button>
    </form>

    <div class="id-success"></div>
    <br>
    <div class="pass-success"></div>
    <!-- 등록되지 않은 아이디 or 아이디/비밀번호 불일치 시 -->
    <p tabindex="0" id="pwErrorArea" class="input-error"></p>
</div>
<br>

<hr>
<!-- 회원가입 및 아이디 비밀번호 찾기 -->
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="findlink">
    <a href="user_form">회원가입하기</a><br>
    <a href="${root}/user/find_id">아이디 찾기</a><br> <!-- Find ID page -->
    <a href="${root}/user/find_pw">비밀번호 찾기</a> <!-- Find PW page -->
</div>
</div>

<script>
    $('#mForm button[type=submit]').click(function(e){
        e.preventDefault();

        let id = $('#email_id').val();
        let pass = $('#ur_pw').val();

        $.ajax({
            url: "../layout/main.jsp",
            data:{"email_id":id, "ur_pw":pass},
            type: "POST",
            dataType: "json",
            success: function(data){
                if(data.succ)
                    alert("로그인 성공");
                else
                    alert("로그인 실패");
            },
            error: function(err){
                alert(err);
            }
        });
    });

    $('#mForm button[type=submit]').click(function(e){
        e.preventDefault();

        // TODO : 시작 전 loading visible
        $.ajax({
            // url: './layout1.jsp',
            type: "POST",
            dataType: "json",
            success: function(data){
                // TODO : loading invisible
            },
            error: function(err){
                // TODO : loading invisible
            }
        });
    });
</script>

<%--<!-- 로그인 스크립트 이벤트 -->--%>
<%--<script type="text/javascript">--%>
<%--    console.log('hit1')--%>
<%--    // 팝업창에 있는 로그인 버튼--%>
<%--    $("#loginbutton").click(function(){--%>
<%--        // 아이디와 비번 읽기--%>
<%--        console.log("hit");--%>
<%--        var id=$("#email_id").val();--%>
<%--        var pass=$("#ur_pw").val();--%>
<%--        var root='${root}';--%>
<%--        console.log("root"+root);--%>
<%--        console.log(id,pass);--%>

<%--        $.ajax({--%>
<%--            type:"post",--%>
<%--            url:root+"/user/login",--%>
<%--            dataType:"json",--%>
<%--            data:{"email_id":id, "ur_pw":pass},--%>
<%--            success:function(res){--%>
<%--                if(res.result=='fail'){--%>
<%--                    alert("아이디나 비번이 맞지 않습니다");--%>
<%--                }else{--%>
<%--                    location.reload();--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>

<%--    // 로그아웃--%>
<%--    $("#logoutbutton").click(function(){--%>
<%--        var root='${root}';--%>

<%--        $.ajax({--%>
<%--            type:"get",--%>
<%--            url:root+"/user/logout",--%>
<%--            dataType:"text",--%>

<%--            success:function(res){--%>
<%--                location.reload();--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

</body>
</html>
