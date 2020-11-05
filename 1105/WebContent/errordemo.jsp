<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	int first = Integer.parseInt(request.getParameter("first"));
	int second = Integer.parseInt(request.getParameter("second"));
%>
<%=first %> / <%=second %> = <%=first /second %>