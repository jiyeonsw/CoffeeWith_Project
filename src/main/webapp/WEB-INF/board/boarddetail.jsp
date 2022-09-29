<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<style type="text/css">
		span.likes{
			cursor: pointer;
		}
		
		span.writer{
			color: red;
			border: 1px solid red;
			border-radius: 40px;
			margin-left:5px;
			font-size: 0.8em;
			padding: 3px;
		}
		.adel{
			color: red;
			cursor: pointer;
			float: right;
			margin-right: 10px;
			margin-top: 10px;
		}
		
		span.day {
			float: right;
		}
		div.alist img{
			width: 30px;
			height: 30px;
			cursor: pointer;
			border: 1px solid gray;
			border-radius: 10px;
			margin-left:10px;
			
		}
		
		div.answer-box{
			padding: 5px 5px 5px;
			border: 1px solid black;
		}
	</style>
<script type="text/javascript">
	var num = ${dto.num};
	$(function () {
		console.log("num="+num);
		list();
		
	$(document).on("click",".adel",function(){
         var ans=confirm("삭제 할래?");
         var idx = $(".adel").attr("idx");
         console.log(idx);
         if(ans)
         {
            $.ajax({
               type:"get",
               url:"../answer/delete",
               dataType:"text",
               data:{"idx":idx},
               success:function(res){
                  alert("삭제완료");
                  list();
               }
            })
         }
      })
	})
	//댓글목록
	function list() {
		var loginok = '${sessionScope.loginok}';
		var loginid = '${sessionScope.loginid}'; //로그인한사람의 아이디
		var writerid = '${dto.id}';//글쓴 사람의 아이디
// 		alert(loginok+","+loginid);
		
		var s="";
		$.ajax({
			type : "get",
			url : "../answer/list",
			dataType : "json",
			data: {"num":num},
			success: function(res) {
				$("b.banswer").text(res.length);
				$.each(res,function(i,elt){
					
					s+="<div class='answer-box'>"+elt.name;
					
					if(elt.photo!='no'){
						s+="<a href='../upload/"+elt.photo+"' target='_new'>";
						s+="<img src='../upload/"+elt.photo+"'>";
						s+="</a>";
					}
					if(writerid==elt.id){
						s+="<span class='writer'>작성자</span>";
					}
					if(loginok =='yes' && loginid == elt.id){
						s+="<i class='fa fa-close adel' style='font-size:15px;' idx="+elt.idx+"></i>";
					}
					s+="<br>";
					s+="<pre>"+elt.message;
					s+="<span class='day'>"+elt.writeday+"&nbsp;";
					s+="</span></pre></div>";
				})
				$("div.alist").html(s);
			}
		})
	}
</script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>"/>
	<table class="table table-bordered">
		<tr>
			<td>
				<h2><b>${dto.subject}</b></h2>
				<c:if test="${userphoto!='no'}"><!-- 탈퇴한 회원은 사진 안나옴 -->
					<img src="${root}/upload/${userphoto}" onerror="this.src='../images/noimage.png'" width="60" height="60" class="rounded-circle">
				</c:if>
				<b>${dto.name}(${dto.id})</b>
				&nbsp;
				<span style="color: #ccc; font-size: 13px">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;
					조회&nbsp;${dto.readcount}
				</span>
			</td>
		</tr>
		<tr height="300" valign="top">
			<td>
				<pre>${dto.content}</pre>
				<br>
				<br>
				<c:if test="${dto.photo!='no'}">
					<c:forTokens var="photo" items="${dto.photo}" delims=",">
						<img src="../upload/${photo}" width="250" class="img-thumbnail"
						onerror="this.style.display='none'"><!-- 해당폴더에 없는 사진은 안보이게 처리 -->
						<img src="../images/test.svg">
						<svg width="100" height="100" xmlns="href='../images/test.svg'"></svg>
					</c:forTokens>
				</c:if>
				<br><br>
				<span class="likes">
					<i class='far fa-heart'></i>&nbsp;
					좋아요 <b>${dto.likes}</b>
				</span>
				&nbsp;&nbsp;
				<i class='far fa-comment-dots'></i>
				&nbsp;<b class="banswer">0</b>
				
				<br>
				<div class="alist">
					댓글목록
				</div>
				<c:if test="${sessionScope.loginok!=null}">
					<div class="aform">
						<form id="aform">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="id" value="${sessionScope.loginid}">
							<input type="hidden" name="name" value="${sessionScope.loginname}">
							
							<input type="file" id="upload" style="display: none;">
							<button type="button" class="btn btn-info btn-sm" id="btnphoto">사진</button>
							<img src="" id="aphoto" width="50" height="50" onerror="this.style.display='none'"><!-- 사진이 없을때는 안보이게함 -->
							<br>
							<div class="input-group">
								<textarea name="message" id="message" style="width: 400px; height: 60px" class="form-control"></textarea>
								<button type="button" class="btn btn-secondary btn-sm" id="btnasave">등록</button>
							</div>
						</form>
					</div>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-outline-primary" 
				onclick="location.href='form'">새글</button>
				
				<button type="button" class="btn btn-outline-primary" 
				onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&currentPage=${currentPage}'">답글</button>
				
				<button type="button" class="btn btn-outline-secondary" 
				onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				
				<!-- 로그인중이면서 세션의 아이디와 글의 아이디가 같을 경우에만 수정,삭제 가능 -->
				<c:if test="${sessionScope.loginok!=null && sessionScope.loginid == dto.id}">
					<button type="button" class="btn btn-outline-success" 
					onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
					
					<button type="button" class="btn btn-outline-danger" 
					onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		//하트 클릭시 빨강하트/빈하트 번갈아 나오게 하기
		$("span.likes").click(function(){
// 			alert($(this).find("i").attr("class"));
			var heart = $(this).find("i").attr("class");
			if(heart == 'far fa-heart'){
				$(this).find("i").attr("class","fas fa-heart").css("color","red");
// 				console.log("됨");
			}else{
				$(this).find("i").attr("class","far fa-heart").css("color","black");
			}
			//ajax이용해서 좋아요 증가 후 출력
			var num = ${dto.num};
			$.ajax({
				type : "get",
				url : "likes",
				dataType : "json",
				data : {"num":num},
				success:function(res) {
					$("span.likes").find("b").text(res.likes);
				}
			})
		})
		
		//사진 버튼
		$("#btnphoto").click(function () {
			$("#upload").trigger("click");
		})
		
		//file태그
		$("#upload").change(function () {
			//정규표현식
			var num=$(this).attr("num");
			var f=$("#upload")[0].files[0];//현재 선택한 파일
			var form = new FormData();
			form.append("photo",f);//선택한 1개만추가
			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"../answer/updatephoto",
				processData:false,
				contentType:false,
				data:form,
				success:function(res){
					$("#aphoto").attr("src","../upload/"+res.aphoto);
					$("#aphoto").css("display","inline-block");
				}
			})
		})
		
		//댓글저장
		$("#btnasave").click(function () {
			var fdata = $("#aform").serialize();//form태그안의 name을 쿼리스트링형태로 읽어온다.(반드시name이 있어야함)
 			//alert(fdata);
			$.ajax({
				type : "post",
				url : "../answer/insert",//한단계올라가서 경로지정
				dataType : "text",
				data : fdata,
				success : function(data) {
					//새로고침하지 않고 댓글목록을 다시 db에서 가져와서 출력
					list();
					
					//입력값이랑 사진 안보이게 처리
					$("#message").val("");
					$("#aphoto").attr("src","").css("display","none");
				}
			})
		})
		
		
	</script>
</body>
</html>