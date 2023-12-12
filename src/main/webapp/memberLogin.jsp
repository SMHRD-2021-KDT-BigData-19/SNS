<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./CSS/로그인.css">
    <title>지역 기반 SNS 로그인</title>
</head>
<body>
    <header>
        <h1>지역 기반 SNS 서비스 플랫폼</h1>
    </header>
    <main>
        <form action="login" method="post"> <!-- Replace YourLoginServlet with the actual servlet handling the login -->
            <label for="username">아이디:</label>
            <input type="text" id="id" name="username" placeholder="아이디를 입력하세요" value="${id}">

            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="pw" placeholder="비밀번호를 입력하세요">

            <button type="submit" onclick="login()">로그인</button>
        </form>

        <div class="find-links">
            <a href="memberJoin.jsp">회원가입</a>
            <a href="memberFidnID.jsp">ID 찾기</a>
            <a href="findPW.jsp">비밀번호 찾기</a>
        </div>
        <br><br>
        <br><br>
        <br><br>
        <br>
        <div class="sotong">
            <a>가치소통하조</a>
        </div>
    </main>
    
    <!-- 외부 스크립트 로드 -->
    <script src="./JS/로그인.js"></script>

    <!-- 외부 스크립트로부터 함수 호출 -->
 
</body>
</html>
