<%@page import="boardVO.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./CSS/마이페이지.css">
    <title class="mypaless">마이페이지</title>
</head>
<body>
    <form>
        <div class="mypage-container">
            <div class="image-container">
                <input type="file" id="imageInput" style="display: none" accept="image/*">
                <img class="profile-image" src="../이미지/2.jpg" alt="프로필 이미지" onclick="openImageDialog()">
            </div>
            <h2>마이페이지</h2>
            <div class="input-container">
                <label for="id">닉네임</label>
                <input class="w3-input" type="text" id="id" name="id">
            </div>
            <button type="button" onclick="logout()">회원정보 변경</button>
            <div class="input-container">
                <label for="ChPassword">새 비밀번호</label>
                <input class="w3-input" type="text" id="ChPassword" name="ChPassword">
            </div>
            <div class="input-container">
                <label for="verifyPassword">새 비밀번호 확인</label>
                <input class="w3-input" type="text" id="verifyPassword" name="verifyPassword">
            </div>
            <button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" onclick="logout1()">비밀번호 변경</button>

        </div>
    </form>
    <script src="../JS/마이페이지.js"></script>

    <!-- 외부 스크립트로부터 함수 호출 -->
    <script>
        greet(); // 외부 스크립트에 정의된 함수 호출
    </script>
    <script src="../JS/마이페이지.js?v=2"></script>
</body>
</html>
