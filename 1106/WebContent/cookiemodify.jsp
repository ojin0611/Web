<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  
	response.addCookie(new Cookie("AGE", "44"));  
	response.sendRedirect("cookieget.jsp");	
%>
<div>방금 Cookie가 수정됐습니다.</div>
