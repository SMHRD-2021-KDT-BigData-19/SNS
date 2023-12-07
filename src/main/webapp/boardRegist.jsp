<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "vo" class="boardVO.BoardVo"/>
<jsp:useBean id = "dao" class="boardController.BoardDAO"/>

<jsp:setProperty name = "vo" property="*"/>
<!-- ==> vo <- request.getParmaer("title")... -->

<%
	dao.update(vo);

//response.sendRedirect(request.getContextPath()+"boardList.jsp"); 와 같은 내용 
%>

<c:redirect url="boardDetail.jsp?num=${vo.num}" />