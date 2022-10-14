<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
  <title>Kakao Logout</title>

  <!-- 카카오 로그아웃 -->
  <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
          integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
  <script>Kakao.init('faf782939186046125921704c4e2ad90'); // 보안키 JavaScript </script>

</head>
<body>

<button class="api-btn" onclick="kakaoLogout()">로그아웃</button>

<script>
  function kakaoLogout() {
    Kakao.Auth.logout()
            .then(function() {
              alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
              deleteCookie();
            })
            .catch(function() {
              alert('Not logged in');
            });
  }

  // 아래는 데모를 위한 UI 코드
  function deleteCookie() {
    document.cookie = 'authorize-access-token=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
  }
</script>

</body>
</html>
