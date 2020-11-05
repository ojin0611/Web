<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul>
	<li>Major Version : <%=application.getMajorVersion() %></li>
	<li>Minor Version : <%=application.getMinorVersion() %></li>
	<li>db.url : <%=application.getInitParameter("db.url") %></li>
	<li>db.driver : <%=application.getInitParameter("db.driver") %></li>
	<li>db.user : <%=application.getInitParameter("db.user") %></li>
	<li>db.password : <%=application.getInitParameter("db.password") %></li>
</ul>