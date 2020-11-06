<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%
	HashMap<String, Object> map = 
		(HashMap<String, Object>)session.getAttribute("mysession");

	if(map == null) {  //login을 한 적이 없다면
%>
	<script>
		alert("먼저 로그인부터 하셔야 합니다.");
		location.replace("login.html");
	</script>
<%		
	}else{   //login을 해서 redirect로 넘어왔다면
		String username = (String)map.get("USERNAME");
%>
<div><%=username %>님! 환영합니다.</div>
<div>회원만이 누리는 환상적인 서비스를 기대하세요.</div>
<div><a href="logout.jsp">Logout</a></div>
<% }  %>