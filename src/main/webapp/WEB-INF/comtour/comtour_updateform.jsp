<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffeewith</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="../res/css/style.css" type="text/css">
    <style type="text/css">
        div.wholetable{
            margin: 50px 70px;
        }

    </style>
</head>
<body>

${dto}

<form action="update" method="post">
    <input type="hidden" name="tr_id" value="${dto.tr_id}">
    <div class="wholetable">
        <table class="table table-bordered" style="width: 1000px">
            <tr>
                <th colspan="3" style="width: 1000px; text-align: center">게시정보 수정
                    <button type="button" class="btn-close" data-bs-dismiss="modal" style="float: right"></button>
                </th>

            </tr>
            <tr>
                <td style="width: 130px;">title</td>
                <td style="width: 630px;">
                    <input type="text" name="tr_nm" class="form-control" value="${dto.tr_nm}" required="required">
                </td>
                <td style="width: 300px;">
                    모임관련 정보
                </td>
            </tr>

            <tr>
                <td rowspan="4">Content</td>
                <td rowspan="4">
                    <textarea name="tr_txt" class="form-control" style="height: 300px;" required="required">${dto.tr_txt}</textarea>
                </td>
                <td>
                    <div class="input-group">
                        출발날짜&nbsp;&nbsp;<input type="date" name="s_date" class="form-control" value="${dto.s_date}" required="required">
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="input-group">
                        도착날짜&nbsp;&nbsp;<input type="date" name="e_date" class="form-control" value="${dto.e_date}" required="required">
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="input-group">
                        모임장소&nbsp;&nbsp;<input type="text" name="tr_loc" class="form-control" value="${dto.tr_loc}" required="required">
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="input-group">
                        모집인원&nbsp;&nbsp;<input type="number" min='2' max='30' name="tw_max" class="form-control" value="${dto.tw_max}" required="required">
                    </div>
                </td>
            </tr>


            <tr>
                <th colspan="3" style="width: 250px; text-align: center">
                    <button type="submit" class="btn bnt-outline">수정하기</button>
                </th>
            </tr>
        </table>
    </div>
</form>
</body>
</html>