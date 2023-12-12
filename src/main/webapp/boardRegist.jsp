<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "vo" class="boardVO.BoardVo"/>
<jsp:useBean id = "dao" class="boardController.BoardDAO"/>

<jsp:setProperty name = "vo" property="*"/>

<%
	dao.insertboard(vo);
%>

<c:redirect url="boardList.jsp" />