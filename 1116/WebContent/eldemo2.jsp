<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Enumeration" %>
<%-- <%
	Enumeration<String> list = request.getHeaderNames();
%>
<ul>
	<%
		while(list.hasMoreElements()){
			String name = list.nextElement();
			out.println("<li>" + name + " : " + 
			         request.getHeader(name) + "</li>");
		}
	%>
</ul> --%>
<ul>
	<li>Host : ${header['host']}</li>
	<li>User-Agent : ${header['user-agent']}</li>
	<li>accept : ${headerValues.accept[0]}, ${headerValues.accept[1]}</li>
	<li>accept-language : ${headerValues['accept-language'][0]}</li>
</ul>












