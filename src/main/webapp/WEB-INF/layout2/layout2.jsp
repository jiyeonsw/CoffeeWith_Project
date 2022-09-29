<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<style type="text/css">
		body *{
			font-family: 'THE하늘색바람';
		}
		
		body{
			display: flex;
    		justify-content: center;
		}
		
		#header{
		    overflow:hidden;
		    height: 300px;
		}
		
		#main{
			width: 100%;
		    display: flex;
		    justify-content: center;
		    flex-direction: column;
		    background-color: rgba(234,190,195,.3);
		}
		
		.btn-box{
			position: fixed;
			right: 2%;
    		top: 40%;
		}
		
		.btn-box i {
			font-size: 30px;
		}
	</style>
</head>
<body>
<!--  -->
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="mainlayout2">
		<div class="main" id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div class="btn-box">
			<a href="${root}"><i class='fas fa-home'></i></a>
		</div>
		<div class="main" id="main">
			<tiles:insertAttribute name="main"/>
		</div>
	</div>
</body>
</html>