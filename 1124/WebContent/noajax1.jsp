<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int result = num1 * num2;
	pageContext.setAttribute("result", result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>No Ajax : Submit</title>
</head>
<body>
	<form method="get">
		<input type="text" id="num1" name="num1" size="10" value="<%=num1%>"/> X 
		<input type="text" id="num2" name="num2" size="10" value="<%=num2%>"/> = 
		<input type="text" id="answer" size="10" value="${pageScope.result}" />&nbsp;&nbsp; 
		<input type="submit" value="Calculate" id="btnCalc" />
	</form>
</body>
</html>