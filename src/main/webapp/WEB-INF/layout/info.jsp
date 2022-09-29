<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
	<style type="text/css">
		*{
			font-family: 'Gugi';
		}
		
		.info-box{
			background-image: url("https://i.pinimg.com/originals/9b/ee/9c/9bee9ccfece6c7750dca6fc3708b5252.gif");
			background-size: cover;
			width: 100%;
			height: 100%;
		    display: flex;
		    align-items: center;
   			flex-direction: column;
 			background-position: center;
   			background-repeat: no-repeat;
		}
		
		.rounded-circle{
			margin-top: 30px;
		}
		
		.info-text{
			color: white;
			margin-top: 20px;
			font-size: large;
			text-shadow: 2px 2px 2px gray;
		}
		
	</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>"/>
<!-- 로그인한 상태에서는 로그인한 멤버의 사진이 나오도록 하다 -->
	<div class="info-box">
	   <c:if test="${sessionScope.loginok==null}">
	      <img src="${root}/upload/images.png" width="130" height="130" class="rounded-circle">
			<div class="info-text">로그인 필요</div>
	   </c:if>
	   <c:if test="${sessionScope.loginok!=null}">
	      <img src="${root}/upload/${sessionScope.loginphoto}" width="130" height="130" class="rounded-circle">
			<div class="info-text">${sessionScope.loginname}</div>
	   </c:if>
	</div>
</body>
</html>