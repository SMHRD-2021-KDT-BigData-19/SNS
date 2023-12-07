<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id = "dao" class="boardController.BoardDAO"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	dao.delete(num);
%>

<c:redirect url = "boardList.jsp?"/>