<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Connection" %>
<%@ page import="com.example.libs.model.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = DBConnection.getConnection();
		out.println(conn);
		conn.close();
	%>
</body>
</html>