<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.UserInfo"%>
<jsp:useBean id="user" class="com.example.libs.UserInfo" />
<jsp:setProperty property="name" name="user" value="한지민"/>
<jsp:setProperty property="gender" name="user" value="female"/>
<jsp:setProperty property="age" name="user" value="24"/>
<jsp:setProperty property="address" name="user" value="서울시 강남구 역삼동"/>

<% 
	pageContext.setAttribute("USERINFO", user);

	Object obj = pageContext.getAttribute("USERINFO");
	UserInfo jimin = (UserInfo)obj;
%>

<ul>
	<li>이름 : <%=jimin.getName() %> </li>
	<li>나이 : <jsp:getProperty property="age" name="user" /></li>
	<li>성별 : <%=user.getGender() %></li>
	<li>주소 : ${user['address']}</li>
</ul>