<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Find ID</title>

    <style>
        .findid{padding-left: 300px; padding-top: 30px;}

    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>


<div class="findid">
    <h2>아이디 찾기</h2>
    <p>회원정보에 등록된 정보로 아이디를 찾을 수 있습니다.</p>

    <ul class="findid_form">
        <li>
            <div class="findid_nm"><label>이름</label></div>
            <span class="box_input">
                    <input type="text"  placeholder="특수문자 없이 입력">
                </span>
        </li>
        <br>
        <li>
            <div class="findid_ml"><label>이메일 주소</label></div>
            <span class="box_input">
                    <input type="text" placeholder="     @    ">
                </span>
            <button type="button">인증번호 발송</button>
            <p>이메일 주소를 정확하게 입력해주세요.</p>
        </li>

        <li>
            <div class="findid_ph"><label>휴대폰 번호</label></div>
            <span class="box_input">
                    <input type="text" placeholder="‘-’ 없이 숫자만 입력">
                </span>
            <button type="button">인증번호 발송</button>
            <p>휴대폰 번호를 정확하게 입력해주세요.</p>
        </li>

        <li>
            <div class="findid_ok"><label>인증번호 입력</label></div>
            <div class="wrap_input">
                                <span class="box_input">
                                   <input type="text" name="findCite" id="findCite" class="inp_find">
                                    <span class="message_find time_find" style="display:none;">남은 시간 (3:00)</span>
                                </span>
                <p class="message_find" id="msg_cert_num" style="display:none;">입력시간이 만료되었습니다. 인증번호를 다시 발송해주세요.</p>
                <p class="message_find ok" style="display:none;">인증 성공. 잠시만 기다려주세요.</p>
            </div>
        </li>
        <br>
        <br>
        <button type="button" id="btn_cert_complete">본인인증완료</button>
    </ul>
</div>
</div>
</body>
</html>
