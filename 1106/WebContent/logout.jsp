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
	}else{   //login을 해서 welcome.jsp 갔다가 logout.jsp로 온 상황
		String username = (String)map.get("USERNAME");
%>
<div><%=username %>님! 그동안 만족하셨나요? 다음에 또 방문해 주세요.</div>

<% 
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0L);
		session.invalidate();
	}  %>
	
	
	
	
	