<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Enumeration" %>
<h1>User's Header Information</h1>
<ul>
	<%
		Enumeration<String> names = request.getHeaderNames();
		while(names.hasMoreElements()){
			String name = names.nextElement();
			String value = request.getHeader(name);
	%>
			<li><%=name + " : " + value%></li>
	<% } %>
</ul>