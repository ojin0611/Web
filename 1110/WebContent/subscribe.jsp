<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String result = request.getParameter("aggrement");  //yes or no
	
	
	String sessionid = (String)session.getAttribute("id");
	if(sessionid.equals(id)) {
%>		
	<script>
		alert("이미 사용중인 아이디입니다.");
		history.go(-2);
	</script>
<% 
	}
	session.setAttribute("id", id);   //id,  jimin
	session.setAttribute("name", name); // name, 한지민
	response.sendRedirect("result.jsp?result=" + result);
%>