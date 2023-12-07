<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>삭제 확인</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
%>
<form action="delete.jsp">
<input type="hidden" value="<%=num%>" name="num">
삭제 하시겠습니까?<input type="submit" value="삭제">
</form>
</body>
</html>