<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>

<%
	String username = null;
	Integer userage = null;
	String useraddress = null;
	HashMap<String, Object> map = 
		(HashMap<String, Object>)session.getAttribute("mysession");
	if(map != null){
		username = (String)map.get("NAME");
		userage = (Integer)map.get("AGE");
		useraddress = (String)map.get("ADDRESS");
	}
	
%>
<h1>Session Get</h1>
<ul>
	<li>이름 : <%=(username == null) ? "" : username %></li>
	<li>나이 : <%=(userage == null) ? "" : String.valueOf(userage) %></li>
	<li>주소 : <%=(useraddress == null) ? "" : useraddress %></li>
</ul>
<div>
	<button onclick="javascript:location.href='sessionset.jsp';">Session Set</button>
	<button onclick="javascript:location.href='sessionmodify.jsp';">Session Modify</button>
	<button onclick="javascript:location.href='sessiondelete.jsp';">Session Delete</button>
</div>