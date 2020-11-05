<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%
	String str = String.format("방문시간 : %tT\t", new Date());
	application.log(str);
	str = request.getRequestURI();
	application.log(str + "\t");
	application.log("한글이 잘 되나요?\n");
	
%>