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
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<style type="text/css">
		*{
			font-family: 'Gugi';
		}
		
		.menu-box{
			margin-top: 30px;
		    width: 100%;
		    display: inline-flex;
		    justify-content: space-around;
		}
		
		
		li i{
			font-size: 29px;
			color: rgb(234,190,195);	
		}
		
		li{
			list-style: none;
		}
		
		ul.submenu{
			padding-left: 0px;
		}
		
		ul.mainmenu{
			padding-inline-start: 0;
			width:100%;
			text-align: center;
			height: 120px;
			display: block;
		}
		
		ul.submenu a{
			text-decoration: none;
			color: black;
		}
		
	</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="menu-box">
		<ul class="mainmenu">
			<li>
			<i class='fas fa-home'></i>
			<ul class="submenu">
				<li><a href="${root}">메인</a></li>
			</ul>
			</li>
		</ul>
		<ul class="mainmenu">
			<li>
			<i class='fas fa-clipboard-list'></i>
				<ul class="submenu">
					<li><a href="${root}/board/list">게시판목록</a></li>
					<li><a id="boardwrite" href="${root}/board/form">글쓰기</a></li>
					<li>방명록</li>
				</ul>
			</li>
		</ul>
		<ul class="mainmenu">
			<li>
				<i class='fas fa-map-marked-alt'></i>
				<ul class="submenu">
					<li><a href="${root}/help/map">찾아오는길</a></li>
				</ul>
			</li>
		</ul>
		<ul class="mainmenu">
			<li>
			<i class='fas fa-user-plus'></i>
				<ul class="submenu">
					<li><a href="${root}/member/list">회원리스트</a></li>
					<li><a href="${root}/member/form">회원가입</a></li>
				</ul>
			</li>
		</ul>
	</div>
<script type="text/javascript">
    $("ul.mainmenu>i").hover(function(){
        $(this).css("color","orange");
    },function(){
        $(this).css("color","rgb(234,190,195)");
    });
    
    $("ul.submenu").hide();
    
//     $("i.fas").mouseover(function () {
//     	$(this).siblings().slideDown('fast');
//     	$(this).parent().parent().siblings().find("ul.submenu").slideUp('fast');
// 		console.log($(this).parent().siblings().find("ul.submenu"));
//     })
	
	$("i.fas").click(function () {
		$(this).siblings().slideToggle('fast');
	})
	
	
</script>
</body>
</html>