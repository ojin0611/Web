<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URLDecoder" %>
<%
	Cookie [] array = request.getCookies();
	if(array != null && array.length > 0){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
&nbsp;&nbsp;&nbsp;&nbsp;쿠키 이름 : 쿠키 값<br />
&nbsp;&nbsp;&nbsp;&nbsp;==================<br />
    <% for(int i = 0 ; i < array.length ; i++){
    	  Cookie cookie = array[i];
    	  String cookie_name = cookie.getName();
    	  cookie_name = URLDecoder.decode(cookie_name, "utf-8");
    	  if(!cookie_name.equals("JSESSIONID")){
    %>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<%=cookie_name %> : <%=array[i].getValue() %> <br />   
    <% 
    	} // if end
      } //for end %>
    <a href="inputCookie.html">쿠키 입력 화면으로</a>
</body>
</html>
<% }else{ %>
<body>
	<script>
		alert("Cookie가 전혀 없습니다.");
	</script>
	<a href="inputCookie.html">쿠키 입력 화면으로</a>
</body>
<% } %>