<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- scriptletdemo.jsp?first=5&second=9&op=x --> 
<%
	int first = Integer.parseInt(request.getParameter("first"));
	int second = Integer.parseInt(request.getParameter("second"));
	String op = request.getParameter("op");  //+
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>계산기</h1>
	<%
		int result = 0;  //지역변수
		switch(op){
			case "+" : result = first + second; break;
			case "-" : result = first - second; break;
			case "x" : result = first * second; break;
			case "/" : result = first / second; break;
			case "%" : result = first % second; break;
		}
	%>
	<div style='font-size:3em;'>
		<%=first %> <%=op %> <%=second %> = <%=result %>
	</div>
</body>
</html>




