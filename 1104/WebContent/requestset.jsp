<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
	request.setAttribute("username", username);
	request.setAttribute("userage", userage);
%>
<h1>request 변수 연습</h1>
<ul>
	<li>이름 : <%=username %></li>
	<li>나이 : <%=userage %></li>
	<%
		pageContext.forward("requestget.jsp");
	%> 
</ul>