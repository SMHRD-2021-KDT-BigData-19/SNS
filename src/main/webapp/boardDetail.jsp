<%@page import="boardVO.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%
	BoardDAO dao = new BoardDAO();
	객체 생성
	<jsp:useBean id = "dao" class="boardController.BoardDAO"/>
	액션태그와 동일
%>  --%>
<jsp:useBean id = "dao" class="boardController.BoardDAO"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo = dao.selectone(num);
	pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./CSS/상세보기.css">
    <title>나의 게시물</title>
</head>
<body>
    <main>
        <header>
            <h1>${vo.title}</h1>
        </header>
        <div id="post-info">
            <div>
                <p id="nickname">${vo.nick}</p>
            </div>
            <div>
                <p id="views">조회수: ${vo.cnt}</p>
            </div>
            <div>
                <p id="upload-info"></p>
            </div>
        </div>
        <section id="post-content">
            <div class="content-container">
            ${vo.content}
       
                <!-- Add your content here if needed -->
            </div>
            <section id="comments">
                <h3>댓글</h3>
                <ul id="comment-list">
                    <!-- 댓글이 나열될 곳입니다. -->
                    <!-- 예: <li><span class="comment-time">날짜 및 시간</span> 댓글 내용</li> -->
                </ul>
                <form id="comment-form">
                    <div id="comment-input-container">
                        <textarea id="comment-input" placeholder="댓글을 입력하세요"></textarea>
                        <button type="button" onclick="addComment()">댓글 작성</button>
                    </div>
                </form>
            </section>
        </section>
        <br> <br> 
		<a href="<c:url value="boardEditForm.jsp?num=${vo.num}"/>">
		<button>게시글 수정</button></a>
		<a href="<c:url value="boardDeleteForm.jsp?num=${vo.num}"/>">
		<button>게시글 삭제</button></a>
			<a href="<c:url value="boardList.jsp"/>">
		<button>게시글 리스트</button></a>
    </main>
    <script src="./JS/상세보기.js"></script>
</body>
</html>
