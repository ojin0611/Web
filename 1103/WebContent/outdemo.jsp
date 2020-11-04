<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul>
	<li>Buffer Size : <%=out.getBufferSize() %> B</li>
	<li>Remain Buffer Size  :<%=out.getRemaining() %> B</li>
</ul>
<%
	out.println("이 글자는 유저에게 전달되지 않을 겁니다.");
	out.clear();
	out.print("대신 이 문장이");
	out.newLine();
	out.println("전달될 겁니다.");
	out.flush();
%>