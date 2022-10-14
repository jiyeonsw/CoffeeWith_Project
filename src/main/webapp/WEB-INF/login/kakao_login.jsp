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
  <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Kakao</title>

  <style>
    @font-face {
      font-family: 'GangwonEdu_OTFBoldA';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
  </style>
</head>
<body>
<a href="#0" id="kakaoLogout">로그아웃</a> |
<a href="#0" id="secession">탈퇴</a>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

  window.Kakao.init('faf782939186046125921704c4e2ad90');
  window.Kakao.Auth.setAccessToken(JSON.parse(sessionStorage.getItem('AccessKEY'))); //sessionStorage에 저장된 사용자 엑세스 토큰 받아온다.

  function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      console.log('Not logged in.');
      return;
    }
    Kakao.Auth.logout(function(response) {
      alert(response +' logout');
      window.location.href='/'
    });
  };

  function secession() {
    Kakao.API.request({
      url: '/v1/user/unlink',
      success: function(response) {
        console.log(response);
        //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
        window.location.href='/'
      },
      fail: function(error) {
        console.log('탈퇴 미완료')
        console.log(error);
      },
    });
  };

  const logout = document.querySelector('#kakaoLogout');
  const sion = document.querySelector('#secession');

  logout.addEventListener('click', kakaoLogout);
  sion.addEventListener('click', secession);
</script>
</body>
</html>
