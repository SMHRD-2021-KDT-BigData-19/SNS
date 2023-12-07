<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../CSS/비밀번호 찾기.css">
    <title>비밀번호 찾기</title>
</head>
<body>
    <header>
        <h1>비밀번호 찾기</h1>
    </header>
    <main>
        <form action="YourPasswordResetServlet" method="post"> <!-- Replace YourPasswordResetServlet with the actual servlet handling the password reset -->
            <label for="username">아이디:</label>
            <input type="text" id="username" name="username" placeholder="아이디를 입력하세요">

            <label for="email">등록한 이메일:</label>
            <input type="email" id="email" name="email" placeholder="이메일을 입력하세요">

            <button type="submit">비밀번호 찾기</button>
        </form>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <div class="sotong">
            <a>같이소통하조</a>
        </div>
    </main>
</body>
</html>
