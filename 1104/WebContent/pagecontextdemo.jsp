<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
    
<%  pageContext.include("header.html");   %>

<h1>여기는 본문입니다.</h1>
<img src="images/autumn.jpg"/>
<%
	String pattern = "지금은 GG yyyy년 MM월 dd일 EE aa hh시 mm분 ss초 입니다.";
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	String now = sdf.format(new Date());
%>
	<%=now %>
	
<%  pageContext.include("copyright.html");  %>