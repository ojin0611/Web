<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie [] array = request.getCookies();
	boolean flag = false;
	String username = null;
	if(array != null){
		for(int i = 0 ; i < array.length ; i++){
			Cookie c = array[i];
			if(c.getName().equals("flag")) 
				flag = Boolean.parseBoolean(c.getValue());
			if(c.getName().equals("username"))
				username = c.getValue();
		}
	}
	if(!flag) {  //login을 한 적이 없다면
%>
	<script>
		alert("먼저 로그인부터 하셔야 합니다.");
		location.replace("login.html");
	</script>
<%		
	}
%>
<div><%=username %>님! 환영합니다.</div>
<div>회원만이 누리는 환상적인 서비스를 기대하세요.</div>
<%--
	Cookie를 이용한 logout처리는 flag cookie를 지우면 된다.
--%>