<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="login" class="com.example.libs.LoginBean" scope="page" />

<%
	request.setCharacterEncoding("utf-8");
	Cookie cookieFlag = null;
	Cookie cookieName = null;
	String userid = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	if(userid.equals(login.getUserid()) && 
		password.equals(login.getUserpwd())){
		//login success
		cookieFlag = new Cookie("flag", "true");
		cookieName = new Cookie("username", request.getParameter("username"));
		response.addCookie(cookieFlag);
		response.addCookie(cookieName);
		response.sendRedirect("welcome.jsp");
	}else{   //login failure
%>
	<script>
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
<%			
	}
%>
