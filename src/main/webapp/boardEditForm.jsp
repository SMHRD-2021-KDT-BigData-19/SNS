<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="boardVO.BoardVo"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "dao" class="boardController.BoardDAO"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo = dao.selectone(num);
	pageContext.setAttribute("vo", vo);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./CSS/글스기.css">
    <title>게시글 수정</title>
    <link rel="stylesheet" type="text/css" href="./CSS/글스기.css">
</head>
<body>
	<div class="container">
    <form action="boardEdit.jsp" method="post">
        <!-- 제목 입력 -->
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" value="${vo.title}" required>
		<tr>
					<th>작성자</th>
					<td>${vo.nick}</td>
		</tr>
        <!-- 본문 입력 -->
        <label for="content">내용:</label>
        <textarea id="content" name="content" rows="25" required>${vo.content}</textarea>

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
            <input type="submit" value="글 작성" onclick="location.href='boardDetail.jsp/?num=${vo.num}'"> 
            <input type="submit" value="목록" onclick="location.href='boardList.jsp'">
        </span>
    </form>
    
</div>
    <script src="./JS/글스기.js"></script>
    <script>
        greet(); // 외부 스크립트에 정의된 함수 호출
    </script>
    <script src="./JS/글스기.js?v=2"></script>


</body>
</html>
