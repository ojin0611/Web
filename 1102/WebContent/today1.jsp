<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%
	Calendar now = Calendar.getInstance();
	int hour = now.get(Calendar.HOUR_OF_DAY);
	out.println("hour = " + hour);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% if(hour < 12){ %>
<style>
	body {
		background-color:yellow;
	}
</style>
<% }else if(hour >= 12 && hour < 24){ %>
<style>
	body {
		background-color:lime;
	}
</style>
<% } %>
</head>
<body>
	<h1>Welcome to www.examle.com</h1>
</body>
</html>