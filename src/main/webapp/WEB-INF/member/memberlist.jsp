<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h2 class="alert alert-danger">총${totalCount} 명의 회원이 있습니다.</h2>
	<br>
	<table class="table table-bordered">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td style="width: 250px" align="center" rowspan="5">
					<img src="../upload/${dto.photo}" onerror="this.src='../upload/images.png'" width="230" height="250" border="1">
					<br>
					<c:if test="${sessionScope.loginok!=null and sessionScope.loginid == dto.loginid }">
						<input type="file" id="newphoto" style="display: none;" num="${dto.num}">
						<button type="button" class="btn btn-info" id="btnnewphoto">사진수정</button>
					</c:if>
				</td>
				<td style="width: 300px">회원명 : ${dto.name}</td>
				<td rowspan="5" align="center" valign="middle" style="width: 100px">
				<c:if test="${sessionScope.loginok!=null and sessionScope.loginid == dto.loginid}">
					<button type="button" class="btn btn-secondary" id="btnupdate" num="${dto.num}"
					data-bs-toggle="modal" data-bs-target="#myUpdateModel">수정</button>
					<br>
					<br>
					<button type="button" class="btn btn-danger" id="btndelete" num="${dto.num}">삭제</button>
				</c:if>
				</td>
			</tr>
			<tr>
				<td>아이디 : ${dto.loginid}</td>
			</tr>
			<tr>
				<td>이메일 : ${dto.email}</td>
			</tr>
			<tr>
				<td>핸드폰 : ${dto.hp}</td>
			</tr>
			<tr>
				<td>주소 : ${dto.address}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 로그인창 -->
	   <div class="modal" id="myUpdateModel">
	      <div class="modal-dialog modal-large">
	         <div class="modal-content">
	            <!-- Modal Header -->
	            <div class="modal-header">
	               <h4 class="modal-title">회원 정보 수정</h4>
	               <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	            </div>
	            <!-- Modal body -->
	            <div class="modal-body">
	               <div class="input-group mb-3 input-group-sm">
	                  <span class="input-group-text">회원명</span>
	                  <input type="text" class="form-control" id="updatename">            
	               </div>
	               <div class="input-group mb-3 input-group-sm">
	                  <span class="input-group-text">핸드폰</span>
	                  <input type="text" class="form-control" id="updatehp">            
	               </div>
	               <div class="input-group mb-3 input-group-sm">
	                  <span class="input-group-text">이메일</span>
	                  <input type="email" class="form-control" id="updateemail">            
	               </div>
	               <div class="input-group mb-3 input-group-sm">
	                  <span class="input-group-text">주소 </span>
	                  <input type="text" class="form-control" id="updateaddr">            
	               </div>
	            </div>
	            <!-- Modal footer -->
	            <div class="modal-footer">
	               <button type="button" class="btn btn-info" id="updateok"
	                  data-bs-dismiss="modal">수정</button>
	               <button type="button" class="btn btn-danger"
	                  data-bs-dismiss="modal">닫기</button>
	            </div>
	         </div>
	      </div>
	   </div>
	<script type="text/javascript">
		$("#btnnewphoto").click(function () {
			$("#newphoto").trigger("click");
		})
		
		$("#newphoto").change(function(){
			//정규표현식
			var num=$(this).attr("num");
			console.log(num);
			var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/;
			var f=$(this)[0].files[0];//현재 선택한 파일
			if(!f.type.match(reg)){
			  alert("확장자가 이미지파일이 아닙니다");
			  return;
			}
			var form = new FormData();
			form.append("photo",f);//선택한 1개만추가
			form.append("num",num);
			console.dir(form);
			
			$.ajax({
				type:"post",
				dataType:"text",
				url:"updatephoto",
				processData:false,
				contentType:false,
				data:form,
				success:function(res){
					location.reload();
				}
			})
		})
		
		//멤버삭제
		$("#btndelete").click(function(){
			var num = $(this).attr("num");
// 			alert(num);
			var ans = confirm("정말 탈퇴하시겠습니까?");
			if(ans){

				$.ajax({
					type:"get",
					dataType:"text",
					url:"delete",
					data:{"num":num},
					success:function(res){
						alert("탈퇴하였습니다");
						location.reload();
					}
				})
			}
		})
		
		//수정버튼 클릭시 모달 다이얼로그에 데이터 넣기
		$("#btnupdate").click(function () {
			updatenum = $(this).attr("num");
// 			alert(updatenum);
			$.ajax({
				type:"get",
				dataType:"json",
				url:"updateform",
				data:{"num":updatenum},
				success:function(res){
					$("#updatename").val(res.name);
		            $("#updatehp").val(res.hp);
		            $("#updateemail").val(res.email);
		            $("#updateaddr").val(res.address);
				}
			})
		})
		
		//수정
		$("#updateok").click(function () {
			var updatename = $("#updatename").val();
			var updatehp = $("#updatehp").val();
			var updateemail = $("#updateemail").val();
			var updateaddr = $("#updateaddr").val();
			
			var data = "num="+updatenum+"&name="+updatename+"&hp="+updatehp+"&email="+updateemail+"&address="+updateaddr;
			$.ajax({
				type:"post",
				dataType:"text",
				url:"update",
				data:data,
				success: function(res){
					alert("수정되었습니다");
					location.reload();
				}
			})
		})
	</script>
</body>
</html>