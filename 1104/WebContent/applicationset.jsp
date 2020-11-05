<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
	application.setAttribute("username", username);
	application.setAttribute("userage", userage);
%>
<h1>application 변수 연습</h1>
<ul>
	<li>이름 : <%=username %></li>
	<li>나이 : <%=userage %></li>
	<li><a href="applicationget.jsp">확인하기</a></li> 
</ul>