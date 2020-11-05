<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String search = request.getParameter("search");
	switch(search){
		case "naver": response.sendRedirect("https://www.naver.com"); break;
		case "nate":  response.sendRedirect("https://www.nate.com"); break;
		case "daumkakao":  response.sendRedirect("https://www.daum.net"); break;
		case "googlekorea":  response.sendRedirect("https://www.google.co.kr"); break;
	}
%>