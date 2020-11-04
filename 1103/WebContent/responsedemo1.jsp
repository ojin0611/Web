<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
	if(username == null && userage == null){
		username = "";
		userage = "0";
	}
	int age = Integer.parseInt(userage);
	if(age < 10 && age > 0){
		response.sendRedirect("https://jr.naver.com/");
	}else if(age >= 10 && age < 65){
%>
	<script>
		location.href = "./register.jsp";
	</script>
	<% }else if(age >= 65){ 
		response.sendRedirect("../1102/gugudan.jsp");
	}
	%>
<form>
	Name : <input type="text" name="username" /><br />
	Age : <input type="number" name="userage" /><br />
	<button>전송하기</button>
</form>