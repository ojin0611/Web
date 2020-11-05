<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.Calendar" %>    
<%@ page import="java.util.GregorianCalendar" %>
<%
	//String msg = String.format("방문 시간 %tT", new Date());
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	Calendar now = new GregorianCalendar(year, month - 1, day);
%>
<div style='text-align:center;color:red;font-size:2em'><%=now%></div>