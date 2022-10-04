<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffeewith</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <style type="text/css">
    </style>
</head>
<body>
  <c:if test="${sessionScope.login_ok==null}">
      <script>
          alert("먼저 로그인 후 글을 써 주세요");
          history.back();
      </script>
  </c:if>
  <form action="insert" method="post">
      <input type="hidden" name="currentPage" value="${currentPage}">
      <input type="hidden" name="ur_id" value="${ur_id}">

      <table class="table table-bordered" style="width: 800px">
          <tr>
                <th>뒤로가기</th>
                <th style="width: 500px;">새 게시물 만들기</th>
                <th><button type="submit" class="btn bnt-outline">공유하기</button></th>
          </tr>
          <tr>
              <td>title</td>
              <td>
                  <input type="text" name="tr_nm" class="form-control">
              </td>
              <td rowspan="5">
                  <div class="input-group">
                      출발날짜 <input type="date" name="s_date" class="form-control">
                  </div>
                  <div class="input-group">
                    도착날짜<input type="date" name="e_date" class="form-control">
                  </div>
                  <div class="input-group">
                      모집인원<input type="text" name="tw_max" class="form-control">
                  </div>
                  <div class="input-group">
                      비밀번호<input type="text" name="tw_max" class="form-control">
                  </div>

              </td>

          </tr>
          <tr>
              <td>Content</td>
              <td>
                  <textarea name="tr_txt" class="form-control"></textarea>
              </td>
          </tr>
      </table>

  </form>
</body>
</html>