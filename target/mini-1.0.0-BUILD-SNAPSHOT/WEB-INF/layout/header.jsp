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
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Lobster&family=Rubik+Beastly&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style type="text/css">
        * {
            font-family: 'Gugi';
        }

        #btnlogin, #btnlogout {
            position: fixed;
            right: 7%;
            top: 40%;
            background-color: rgb(234, 190, 195);
            border-color: #FF9F9F;
            opacity: 0.9;
        }


        .loginid {
            position: fixed;
            right: 8%;
            top: 46%;
            color: black;
            font-size: 25px;

        }


        #btnlogin:hover {
            opacity: 1;
        }

        {
            box-sizing: border-box
        ;
        }

        /* Button used to open the contact form - fixed at the bottom of the page */
        .open-button {
            background-color: #555;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.8;
            position: absolute;
            bottom: 23px;
            right: 28px;
            width: 280px;
        }

        /* The popup form - hidden by default */
        .form-popup {
            display: none;
            position: fixed;
            bottom: 0;
            right: 15px;
            border: 3px solid #f1f1f1;
            z-index: 9;
        }

        /* Add styles to the form container */
        .form-container {
            max-width: 300px;
            padding: 10px;
            background-color: white;
        }

        /* Full-width input fields */
        .form-container input[type=text], .form-container input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }

        /* When the inputs get focus, do something */
        .form-container input[type=text]:focus, .form-container input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for the submit/login button */
        .form-container .btn {
            background-color: #04AA6D;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom: 10px;
            opacity: 0.8;
        }

        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: red;
        }

        /* Add some hover effects to buttons */
        .form-container .btn:hover, .open-button:hover {
            opacity: 1;
        }

        .header-box {
            width: 1000px;
            height: 100%;
            background-image: url("https://i.pinimg.com/originals/da/4f/00/da4f0047275dbcc62465e06e5b29ea84.gif");
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        }

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="header-box">
    <h1>비트캠프</h1>
    <span>
			<c:if test="${sessionScope.loginok==null}">
                <button type="button" class="btn btn-danger" id="btnlogin" onclick="openForm()">로그인</button>
            </c:if>
			
			<c:if test="${sessionScope.loginok!=null}">
                &nbsp;&nbsp;<b class="loginid">${sessionScope.loginname}님</b>
                <button type="button" class="btn btn-danger" id="btnlogout">로그아웃</button>
            </c:if>
		</span>
</div>
<!-- The form -->
<div class="form-popup" id="myForm">
    <div class="form-container">
        <h1>Login</h1>

        <label for="loginid"><b>아이디</b></label>
        <input type="text" placeholder="Enter Email" id="loginid" required>

        <label for="loginpass"><b>비밀번호</b></label>
        <input type="password" placeholder="Enter Password" id="loginpass" required>

        <button type="submit" class="btn longin-btn">Login</button>
        <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
    </div>
</div>
<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
    }

    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }

    //popup login button
    $(".longin-btn").click(function () {
        var id = $("#loginid").val();
        var pass = $("#loginpass").val();
        var root = '${root}';

        console.log(id)
        console.log(pass)
        console.log("root" + root);

        $.ajax({
            type: "get",
            url: root + "/user/login",
            dataType: "json",
            data: {"id": id, "pass": pass},
            success: function (res) {
                if (res.result == 'fail') {
                    alert("아이디나 비번이 맞지 않습니다");
                } else {
                    location.reload();
                }
            }
        })
    })
    //logout
    $("#btnlogout").click(function () {
        var root = '${root}';
        $.ajax({
            type: "get",
            url: root + "/user/logout",
            dataType: "text",
            success: function (res) {
                location.reload();
            }
        })
    })

</script>
</body>
</html>