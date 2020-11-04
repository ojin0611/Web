<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int count = 0;
%>
<%
	response.setHeader("Refresh", "1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="Refresh" content="1"> -->
<title>Insert title here</title>
</head>
<body>
	방문자 수 : <%=++count %>
</body>
</html>