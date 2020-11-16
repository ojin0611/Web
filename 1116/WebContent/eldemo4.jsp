<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String oracle = application.getInitParameter("oracle.properties");
    // /WEB-INF/oracle.properties
    String path = application.getRealPath(oracle);
%>
<ul>
	<li>Parameter Name : <%=application.getInitParameter("oracle.properties") %></li>
	<li>Parameter Value : ${initParam['oracle.properties']}</li>
</ul>