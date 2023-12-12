<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="./CSS/글스기.css">
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "vo" class="boardVO.BoardVo"/>
<jsp:useBean id = "dao" class="boardController.BoardDAO"/>

<jsp:setProperty name = "vo" property="*"/>

<%
	dao.update(vo);
	pageContext.setAttribute("vo",vo);
%>

<c:redirect url = "boardDetail.jsp?num=${vo.num}">
</c:redirect>
