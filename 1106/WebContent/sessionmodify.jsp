<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%  
	HashMap<String, Object> map = 
	     (HashMap<String, Object>)session.getAttribute("mysession");
	if(map == null){
		response.sendRedirect("sessionset.jsp");	
	}else{
		String address = (String)map.get("ADDRESS");	
		address = "부산시 해운대구 해운대동 해운대오피스텔 11호";
		map.put("ADDRESS", address);
		response.sendRedirect("sessionget.jsp");
%>
<div>방금 Session이 수정됐습니다.</div>
<%  } %>