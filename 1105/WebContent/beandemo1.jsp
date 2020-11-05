<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="com.example.libs.LoginBean" scope="session"/>
<jsp:setProperty name="login" property="userid" value="jimin"/>
<jsp:setProperty name="login" property="userpwd" value="1234567" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Bean Setting Page</h1>
	<ul>
		<li>아이디 : <%=login.getUserid() %></li>
		<li>패스워드 : <%=login.getUserpwd() %></li>
		<li><a href="beandemo2.jsp">beandemo2.jsp로 가기</a></li>
	</ul>
</body>
</html>