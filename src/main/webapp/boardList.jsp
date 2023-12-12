<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./CSS/게시판.css">
    <title>게시판 리스트</title>
</head>

<body>
    <h2> 게시글 리스트 </h2>
    <button class="gradient" onclick="location.href='memberMypage.jsp'">마이페이지</button>
    <hr class="hr1" noshade>

    <form>
        <span class="right">
            <span class="grey" id="strong">검색</span>
            <select>
                <option>제목</option>
                <option>글쓴이</option>
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
        <a href="#">◀ 이전</a>
        <a href="#">1</a>
        <a href="#">다음 ▶</a>
    </div>

    <span class="right">
      <!--   <input type="button" value="목록" class="greylist"> -->
        <!-- <input type="button" value="글쓰기" class="gradient"> -->
        <a href="<c:url value="boardRegistForm.jsp"/>"><button class="gradient">글쓰기</button></a>
    </span>
    <script src="./JS/게시판.js"></script>

</body>
</html>
