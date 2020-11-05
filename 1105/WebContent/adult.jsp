<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:yellow">
	<h1>성인 페이지</h1>
	<ul>
		<li>이름 : <%=request.getParameter("username") %></li>
		<li>나이 : <%=request.getParameter("userage") %></li>
		<li><button onclick="javascript:history.back();">뒤로가기</button></li>
	</ul>
</body>
</html>