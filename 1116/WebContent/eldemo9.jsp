<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="eldemo" uri="/WEB-INF/tlds/el-functions.tld" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Now is ${eldemo:mymethod()} 입니다.</h3>
</body>
</html>