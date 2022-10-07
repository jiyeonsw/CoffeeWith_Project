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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
<link rel="stylesheet" href="../res/css/style.css" type="text/css">
<style type="text/css">
</style>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
    <div class="fddata">
        <table class="table table-bordered" >
            <tr>
                <td rowspan="4" class="photo">
                    <a><i class='fas fa-photo-video' style='font-size:24px'></i>사진 선택</a>
                    <input class="selectphoto" type="file" multiple="multiple" style="display: none" name="fd_photo">
                </td>
                <td class="profile">
                    ${sessionScope.login_nick}
                </td>
            </tr>
            <tr>
                <td class="fdcontent">
                    <textarea class="inputtext" required="required" name="fd_txt" placeholder="내용 입력"></textarea>
                </td>
            </tr>
            <tr>
                <td class="fdcafe">
                    <input onkeyup="filter()" type="text" class="inputtext" required="required" name="cf_id" placeholder="카페 추가">
                </td>
            </tr>
            <tr>
                <td class="fdtag">
                    <input onkeyup="filter()" type="text" class="inputtext" name="fg_nm" placeholder="태그 입력">
                </td>
            </tr>
        </table>
    </div>
</form>
</body>

</html>