<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mylogout" value="${userid}" scope="page" />
<c:remove var="userid" scope="session"/>
<script>
	alert('${mylogout}님! 다음에 만나요.');
	location.href = 'index.html';
</script>