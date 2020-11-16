<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("num1", new Integer(5));
	session.setAttribute("num2", 9);   //new Integer(9)
%>

<%-- num1 : <%=(Integer)session.getAttribute("num1") %><br /> --%>
num1 : ${requestScope.num1 }<br />
num2 : ${sessionScope.num2 }<br />

<h1>\${sessionScope.num1 } 와 \${sessionScope.num2 } 연산</h1>
${sessionScope.num1 + sessionScope.num2}<br />
${sessionScope.num1 - sessionScope.num2}<br />
${sessionScope.num1 * sessionScope.num2}<br />
${sessionScope.num1 div sessionScope.num2}<br />
${sessionScope.num1 mod sessionScope.num2}<br />
${sessionScope.num1 eq sessionScope.num2}<br />
${sessionScope.num1 ne sessionScope.num2}<br />
${sessionScope.num1 lt sessionScope.num2}<br />