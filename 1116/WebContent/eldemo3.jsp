<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie c1 = new Cookie("username", "한지민");
    Cookie c2 = new Cookie("userage", "24");
    Cookie c3 = new Cookie("usergender", "여성");
    response.addCookie(c1);
    response.addCookie(c2);
    response.addCookie(c3);
    response.sendRedirect("cookieget.jsp");
%>