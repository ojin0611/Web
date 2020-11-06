<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<jsp:useBean id="login" class="com.example.libs.LoginBean" scope="page" />

<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	if(userid.equals(login.getUserid()) && 
		password.equals(login.getUserpwd())){
		//login success
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("USERNAME", request.getParameter("username"));
		session.setAttribute("mysession", map);
		response.sendRedirect("welcome1.jsp");
	}else{   //login failure
%>
	<script>
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
<%			
	}
%>
