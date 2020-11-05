<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="com.example.libs.Member" />
<%--<jsp:setProperty name="m" property="name" value="한지민"/>
<jsp:setProperty name="m" property="age" value="24" /> --%>
<%
	//com.example.libs.Member mem = new com.example.libs.Member();
    mem.setName("박지민");
    //mem.setAge(24);
%>
    <jsp:setProperty name="mem" property="age" value="34" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>이름 : <%=mem.getName() %></li>
		<li>나이 : <jsp:getProperty name="mem" property="age" /></li>
	</ul>
</body>
</html>