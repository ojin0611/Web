<%--
	pageContext
	1. 기본객체(내장객체) 구하기
	2. 속성 다루기(페이지 기본값)
	3. 페이지의 흐름(include, forward) : cf)RequestDispatcher interface
	4. Error 처리
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!   //_jspService() 밖의 지역.
	public void printDemo(PageContext pc) throws java.io.IOException{
		JspWriter out = pc.getOut();
		ServletRequest parentRequest = pc.getRequest();
		HttpServletRequest req = (HttpServletRequest)parentRequest;
		out.println("Hello, World<br />");
		out.println("user address : " + req.getRemoteAddr());
	}
%>

<%   //여기는 _jspService() 지역.
	printDemo(pageContext);
%>