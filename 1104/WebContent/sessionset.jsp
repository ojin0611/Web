<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
	session.setAttribute("username", username);
	session.setAttribute("userage", userage);
%>
<h1>session 변수 연습</h1>
<ul>
	<li>이름 : <%=username %></li>
	<li>나이 : <%=userage %></li>
	<li><a href="sessionget.jsp">확인하기</a></li> 
</ul>