<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../CSS/글스기.css">
    <title>게시글 작성</title>
</head>
<body>

<div class="container">
    <h1>게시글 작성</h1>
    
    <form action="process_post.jsp" method="post">
        <!-- 제목 입력 -->
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required>

        <!-- 본문 입력 -->
        <label for="content">내용:</label>
        <textarea id="content" name="content" rows="25" required></textarea>

        <!-- 이미지 파일 첨부 버튼 -->
        <div id="file-container">
            <label for="file-input">이미지 첨부 (선택사항):</label>
            <div>
                <input type="file" id="file-input" name="file" accept="image/*">
                <button onclick="document.getElementById('file-input').click()">파일 선택</button>
            </div>
            <span id="file-name">선택된 파일: 없음</span>
        </div>

        <!-- 전송 버튼 -->
        <span class="rmfwkrtjd">
            <input type="submit" value="글 작성" onclick="rptlvks()">
            <input type="submit" value="목록" onclick="ahrfhr()">
        </span>
    </form>
    
</div>
    <script src="../JS/글스기.js"></script>
    <script>
        greet(); // 외부 스크립트에 정의된 함수 호출
    </script>
    <script src="../JS/글스기.js?v=2"></script>


</body>
</html>
