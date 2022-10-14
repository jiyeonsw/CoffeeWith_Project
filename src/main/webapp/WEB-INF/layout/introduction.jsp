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
  <title>Introduction</title>

  <style>
    @font-face {
      font-family: 'GangwonEdu_OTFBoldA';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }

    .intromain {
      width: 450px;
      margin: 0 auto;
      padding-top: 64px;
      text-align: left;
    }

    .introtit {
      margin-bottom: 32px;
      font-size: 2.6rem;
      line-height: 1.3;
      font-weight: 900;
      text-align: center;
    }

    .intromini {
        text-align: center;
    }

  </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<div id="intromain" class="intromain">
  <p class="introtit">커피위드를 소개합니다</p><br>

  <p class="intromini">♥ 커피위드는 카페투어 플랫폼 입니다 ♥<br><br>

      카페 지도에서 관심 있는 카페에 하트를 눌러보세요!<br>
      마이페이지 북마크 기능에서 관심 카페를 모아볼 수 있습니다.<br><br>

      관심 있는 카페에 함께 갈 친구들을 찾으시나요?<br>
      그렇다면 투어 만들기에서 모임을 개설해 보세요!<br><br>

      평소에 가보고 싶은 카페가 많았다면<br>
      투어 플랜 기능으로 계획을 짜보세요 :)<br><br>

      날짜를 설정하여 계획을 잡을 수 있고<br>
      계획한 카페 사이의 거리를 직관적으로 볼 수 있답니다!<br><br>

      다녀온 카페에 대한 리뷰를 남길 수 있고<br>
      커뮤니티에서 유용한 정보를 공유할 수 있답니다.<br><br>

      ♥ <a href="${root}/user_form">회원가입</a> 하시고 함께 커윗해요 ♥
  </p>

</div>
</body>
</html>
