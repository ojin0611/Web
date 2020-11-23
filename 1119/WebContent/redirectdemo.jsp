<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:redirect url="redirectdemo1.jsp">
	<c:param name="username" value="한지민" />
	<c:param name="userage" value="24" />
</c:redirect>