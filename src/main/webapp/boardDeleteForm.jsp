<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� Ȯ��</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
%>
<form action="delete.jsp">
<input type="hidden" value="<%=num%>" name="num">
���� �Ͻðڽ��ϱ�?<input type="submit" value="����">
</form>
</body>
</html>