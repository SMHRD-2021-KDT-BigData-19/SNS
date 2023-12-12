<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./CSS/회원가입.css">
    <title>회원가입 페이지</title>
</head>
<body>

<form action="join" method="post">
    <h2>회원가입</h2>
    <label for="username">아이디:</label>
    <input class="ghkrdls" type="text" id="username" name="name" required>
    <button type="button" class="check-duplicate-btn" onclick="checkDuplicate()">중복확인</button>

    <label for="nickname">닉네임:</label>
    <input class="ghkrdls" type="text" id="nickname" name="nick" required>
    <button type="button" class="check-duplicate-btn" onclick="checkDuplicate_nick()">중복확인</button>

    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="pw" required>

    <label for="confirm_password">비밀번호 확인:</label>
    <input type="password" id="confirm_password" name="pw" required>

    <label for="email_address">이메일 주소:</label>
    <input type="text" id="email_address" name="email" required>
	
	 <input type="submit" class="register-btn" onclick="showAlert()" value="가입하기">
</form>
<!-- 외부 스크립트 로드 -->
<script src="./JS/회원가입.js"></script>

</body>
</html>
