<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
<div>
	1부터 10까지의 합은 
	<span style='color:red;font-size:2em'>
	<%=1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10%>
	</span>
</div>
--%>

<div>
	1부터 10까지의 합은
	<%
		int sum = 0;
		sum = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10;
		out.println("<span style='color:blue;font-size:2em'>");
		out.println(sum + "</span>");
	%>
</div>