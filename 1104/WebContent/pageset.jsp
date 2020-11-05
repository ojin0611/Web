<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
	pageContext.setAttribute("username", username);
	pageContext.setAttribute("userage", userage);
%>
<h1>page 변수 연습</h1>
<ul>
	<li>이름 : <%=username %></li>
	<li>나이 : <%=userage %></li>
	<li><a href="pageget.jsp">확인하기</a></li> 
</ul>