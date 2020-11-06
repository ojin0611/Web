<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ page import="java.net.URLEncoder, java.net.URLDecoder" %>

<%
	Cookie cookie = new Cookie("username", 
			URLEncoder.encode("한지민", "UTF-8"));
	cookie.setMaxAge(60);
	response.addCookie(cookie);
%>
<body>
	<ul>
		<li>Cookie Name : <%=cookie.getName() %></li>
		<li>Cookie Value : <%=URLDecoder.decode(cookie.getValue(), "UTF-8") %></li>
		<li>Cookie expire Date : <%=cookie.getMaxAge() %></li>
		<li><a href="cookiedemo1.jsp">Cookie 읽기</a></li>
	</ul>
</body>