<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("NAME", new String("한지민"));
	map.put("AGE", new Integer(24));
	map.put("ADDRESS", "서울시 강남구 역삼동 한독빌딩 8층");

	session.setAttribute("mysession", map);
	//response.sendRedirect("sessionget.jsp");
%>
<div>방금 Session이 저장됐습니다.</div>
<a href=<%=response.encodeURL("sessionget.jsp") %>>Session Get</a>