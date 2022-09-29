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
		
		div.img-box{
			width: 100%;
			display: flex;
			min-width: 0;
		    flex-wrap: wrap;
    		justify-content: center;
		}
		
		div.img-box img{
			border: 1px solid none;
			border-radius: 20px;
		}
		
		figure{
			margin-top: 20px;
		}
		
		figcaption{
			text-align: center;
			color: dimgrey;
		}
		
		
	</style>
</head>
<body>
	<div class="img-box">
		<figure>
			<img src="https://i.pinimg.com/originals/af/12/ec/af12ec2f13300c2e44ab98f9d892e1c8.gif">
			<figcaption>뾰로롱</figcaption>
		</figure>
		<figure>
			<img src="https://i.pinimg.com/originals/f7/22/1a/f7221a5b63847da51ccf1671efab9824.gif">
			<figcaption>푸르르</figcaption>
		</figure>
		<figure>
			<img src="https://i.pinimg.com/originals/82/a6/b7/82a6b7dc16aff0c04b17f4f61e0bab81.gif">
			<figcaption>하늘하늘</figcaption>
		</figure>
	</div>
</body>
</html>