<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="eldemo" uri="/WEB-INF/tlds/el-functions.tld" %>
<%
	pageContext.setAttribute("ENAME", 
			request.getParameter("ename"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${param.ename}'s Info</h1>
 	${empty (eldemo:empinfo(ENAME)) ? "Not Found" : eldemo:empinfo(ENAME)}
</body>
</html>