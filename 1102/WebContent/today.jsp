<%@ page contentType="text/html; charset=utf-8" 
		import="java.util.Calendar, java.util.Date" 
	session="true" trimDirectiveWhitespaces="true"%>
<%@ page import="java.text.SimpleDateFormat, java.sql.Connection" %>
<%--
	page directive의 import의 대상은
	1. java.lang.*
	2. javax.servlet.jsp.*
	3. javax.servlet.http.*
	4. javax.servlet.*
	을 제외한 나머지 패키지
--%>
<%
	Calendar today = Calendar.getInstance();
	int year = today.get(Calendar.YEAR);
	int month = today.get(Calendar.MONTH) + 1;
	int day = today.get(Calendar.DAY_OF_MONTH);
%>
<div>오늘은 <%=year %>년 <%=month %>월 <%=day %> 일입니다.</div>