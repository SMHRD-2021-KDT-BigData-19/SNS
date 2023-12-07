<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="boardController.*"%>
<%@page import="java.util.List"%>
<%@page import="boardVO.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	BoardDAO dao = new BoardDAO();
	List<BoardVo> list = dao.selectAll();
	pageContext.setAttribute("list",list);
%> 
<%
	request.setCharacterEncoding("UTF-8");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../CSS/게시판.css">
    <title>게시판 리스트</title>
</head>

<body>
    <h2> 게시판 </h2>
    <button class="rptlvks" onclick="mypage()">마이페이지</button>
    <hr class="hr1" noshade>

    <form>
        <span class="right">
            <span class="grey" id="strong">검색</span>
            <select>
                <option value="제목" name="제목">제목</option>
                <option value="글쓴이" name="글쓴이">글쓴이</option>
            </select>
            <input type="text">
            <input type="button" name="검색" class="gradient" value="검색">
        </span>
    </form>

    <br>
    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>일시</th>
            <th>조회수</th>
        </tr>
        
        <c:forEach var="board" items="${list}">
        <tr>
			<!-- DB 내용 출력 -->
			<td>${board.num}</td>
			<td><a href="boardDetail.jsp?num=${board.num}">
				${board.title } </a></td>
			<td>${board.nick}</td>
			<td>${board.regdate}</td>
			<td>${board.cnt}</td>
		</tr>
		</c:forEach>
    </table>
    </br>

    <div class="center">
        <a href="https://www.naver.com/">◀ 이전</a>
        <a href="https://www.naver.com/">1</a>
        <a href="https://www.naver.com/">다음 ▶</a>
    </div>

    <span class="right">
        <input type="button" value="목록" class="greylist">
        <!-- <input type="button" value="글쓰기" class="gradient"> -->
        <a href="<c:url value="RegistForm.jsp"/>"><button class="gradient">게시글 등록</button></a>
    </span>
    <script src="../JS/게시판.js"></script>

    <!-- 외부 스크립트로부터 함수 호출 -->
    <script>
        greet(); // 외부 스크립트에 정의된 함수 호출
    </script>
    <script src="../JS/게시판.js?v=2"></script>
</body>
</html>
