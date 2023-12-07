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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 상세보기</title>
<script type="text/javascript" src="script/board.js"></script>
</head>
<body>
	<div id="wrap" align="center">
		<h1>게시글 상세보기</h1>
		<table>
			<tr>
			<!-- num, title, userid, nick, content, regdate, cnt -->
				<th>번호</th>
				<td>${vo.num}</td>
				<th>작성일</th>
				<td>${vo.regdate}</td>				
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${vo.nick}</td>
				<th>조회수</th>
				<td>${vo.cnt}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${vo.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><pre>${vo.content}</pre></td>
			</tr>
		</table>
		<br> <br> 
		<a href="<c:url value="boardEditForm.jsp?num=${vo.num}"/>">
		<button>게시글 수정</button></a>
		<a href="<c:url value="boardDeleteForm.jsp?num=${vo.num}"/>">
		<button>게시글 삭제</button></a>
			<a href="<c:url value="boardList.jsp"/>">
		<button>게시글 리스트</button></a>
			
		
	</div>
</body>
</html>