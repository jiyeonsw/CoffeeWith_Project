<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Lobster&family=Rubik+Beastly&family=Single+Day&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<style type="text/css">
		*{
			font-family: 'Gugi';
		}
		
		* {box-sizing: border-box;}

		/* Full-width input fields */
		input[type=text], input[type=password] {
		  width: 100%;
		  padding: 15px;
		  margin: 5px 0 22px 0;
		  display: inline-block;
		  border: none;
		  background: #f1f1f1;
		}
		
		/* Add a background color when the inputs get focus */
		input[type=text]:focus, input[type=password]:focus {
		  background-color: #ddd;
		  outline: none;
		}
		
		/* Set a style for all buttons */
		button {
		  background-color: #04AA6D;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: 1px solid;
		  border-radius: 10px;
		  cursor: pointer;
		  width: 100%;
		  opacity: 0.9;
		}
		
		button:hover {
		  opacity:1;
		}
		
		/* Extra styles for the cancel button */
		.cancelbtn {
		  padding: 14px 20px;
		  background-color: #f44336;
		}
		
		/* Float cancel and signup buttons and add an equal width */
		.cancelbtn, .signupbtn {
		  float: left;
		  width: 30%;
		}
		
		/* Add padding to container elements */
		.container {
		  padding: 16px;
		}
		
		/* The Modal (background) */
		.modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 1; /* Sit on top */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: #474e5d;
		  padding-top: 50px;
		}
		
		/* Modal Content/Box */
		.modal-content {
		  background-color: #fefefe;
		  margin: 8% auto 8% auto; /* 5% from the top, 15% from the bottom and centered */
		  width: 80%; /* Could be more or less, depending on screen size */
		}
		
		/* Style the horizontal ruler */
		hr {
		  border: 1px solid #f1f1f1;
		  margin-bottom: 25px;
		}
		 
		/* The Close Button (x) */
		.close {
		  position: absolute;
		  right: 35px;
		  top: 15px;
		  font-size: 40px;
		  font-weight: bold;
		  color: #f1f1f1;
		}
		
		.close:hover,
		.close:focus {
		  color: #f44336;
		  cursor: pointer;
		}
		
		/* Clear floats */
		.clearfix::after {
		  content: "";
		  clear: both;
		  display: table;
		}
		
		/* Change styles for cancel button and signup button on extra small screens */
		@media screen and (max-width: 300px) {
		  .cancelbtn, .signupbtn {
		     width: 100%;
		  }
		}
	</style>
</head>
<body>
	<div>
	 <form class="modal-content" action="#">
	    <div class="container">
	      <h1>회원가입</h1>
	      <p>서비스 이용을 위하여 정보를 입력해주세요.</p>
	      <hr>
	      <label for="email"><b>Email ID</b></label>
	      <input type="text" placeholder="Enter Email" name="email" required>
	
	      <label for="psw"><b>비밀번호</b></label>
	      <input type="password" placeholder="Enter Password" name="psw" required>
	
	      <label for="psw-repeat"><b>비밀번호 재입력</b></label>
	      <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
	      
	      <label>
	        <input type="checkbox" checked="checked" name="reuser" style="margin-bottom:15px"> 작성 임시 저장
	      </label>
	
	      <p>계정 생성과 관련된 <a href="#" style="color:dodgerblue">계정 약관</a>을 확인해주세요.</p>
	
	      <div class="clearfix">
	        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
	        <button type="submit" class="signupbtn">Sign Up</button>
	      </div>
	    </div>
	  </form>
	</div>
</body>
</html>