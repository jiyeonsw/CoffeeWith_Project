<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffeewith</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
<link rel="stylesheet" href="../res/css/style.css" type="text/css">
<style type="text/css">

    .photo{
        vertical-align: middle;
        text-align: center;
    }

    table{
        height: 700px;
        min-width: 500px;
    }

    table .photo{
        width: 70%;
    }

    table .profile{
        height: 10%;
        vertical-align: middle;
    }


</style>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
    <div>
        <b>새 피드 작성</b>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        <table class="table table-bordered" >
            <tr>
                <td rowspan="4" class="photo"><a><i class='fas fa-photo-video' style='font-size:24px'></i>사진 선택</a>
                    <input class="selectphoto" type="file" multiple="multiple" style="display: none">
                </td>
                <td class="profile">프로필 사진+닉네임</td>
            </tr>
            <tr>
                <td>내용</td>
            </tr>
            <tr>
                <td>카페</td>
            </tr>
            <tr>
                <td>태그</td>
            </tr>
        </table>
        <a>공유하기</a>
    </div>
</form>
</body>

<script>
    $(".photo a").click(function (){
        $(".photo .selectphoto").click();
    })

</script>
</html>