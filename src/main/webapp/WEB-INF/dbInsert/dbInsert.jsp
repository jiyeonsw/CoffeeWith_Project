<%--
  Created by IntelliJ IDEA.
  User: YS
  Date: 2022-09-29
  Time: 오후 5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button type="button" class="btn btn-primary" id="btndbsave">DB 저장</button>
<script type="text/javascript">
    $("#btndbsave").click(function () {
        var s="";
        $.ajax({
            type:"get",
            url:".json",
            dataType:"json",
            success:function(data){

            },//su
            statusCode:{//에러났을경우
                404:function(){
                    alert("파일을 찾을 수 없어요!");
                },
                500:function(){
                    alert("서버 오류.. 코드를 다시 확인해주세요");
                }
            }
        })//ajax
    })//click
</script>
</body>
</html>
