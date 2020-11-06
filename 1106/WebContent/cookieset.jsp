<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.addCookie(new Cookie("NAME", "한지민"));
	response.addCookie(new Cookie("AGE", "24"));
	response.addCookie(new Cookie("ADDRESS", "서울시"));
	response.sendRedirect("cookieget.jsp");
%>
<div>방금 Cookie가 저장됐습니다.</div>