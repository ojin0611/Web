<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="col" class="com.example.libs.ColorBean" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>최종페이지</h1>
	<div><jsp:getProperty name="col" property="username" />님!</div>
	<div style='color:<jsp:getProperty name="col" property="color" />'>
	    귀하가 좋아하시는 색깔은 <jsp:getProperty name="col" property="color" />입니다.</div>
	
</body>
</html>