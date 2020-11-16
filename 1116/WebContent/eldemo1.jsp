<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");  %>

<h1>회원정보</h1>
<ul>
	<li>이름 : <%=request.getParameter("name") %></li>
	<li>아이디 : ${param.id }</li> 
	<li>패스워드 : ${param['password'] }</li>
	<li>성별 : ${param['gender'] }</li>
	<li>취미 : ${paramValues['hobby'][0]} ${paramValues['hobby'][1]} ${paramValues['hobby'][2]}
	          ${paramValues['hobby'][3]} ${paramValues['hobby'][4]} ${paramValues['hobby'][5]}</li>
</ul>