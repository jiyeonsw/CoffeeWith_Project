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
<div class="modal-body">
    새 피드 작성
    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
    <table class="table table-bordered" >
        <tr>
            <td rowspan="4" class="photo"></td>
            <td>프로필</td>
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
    <a data-bs-dismiss="modal">공유하기</a>
</div>
</body>

</html>