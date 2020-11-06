<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.invalidate();
	response.sendRedirect("sessionget.jsp");
%>

<div>방금 Session이 삭제됐습니다.</div>