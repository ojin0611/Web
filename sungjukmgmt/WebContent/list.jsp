<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.example.libs.model.StudentVO" %>
<%
	String path = application.getRealPath("/WEB-INF/oracle.properties");
%>   
<jsp:useBean id="service" class="com.example.libs.service.SelectService" /> 
<jsp:setProperty name="service" property="path" value="<%=path %>" />
<%
	ArrayList<StudentVO> list = service.selectAll();	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to 쌍용고등학교</title>
</head>
<body>
	<h1>쌍용 고등학교 성적관리프로그램</h1>
	
</body>
</html>