<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/mymariadb" var="conn"/>
<sql:update dataSource="${conn}" var="result">
	UPDATE City SET population = ?
	WHERE Name = ?
	<sql:param value="10068381"/>
	<sql:param value="Seoul" />	
</sql:update>
<c:if test="${result eq 1}">
	<h1>Update Success</h1>
	<!-- <div><a href="sqldemo1">결과보기</a></div> -->
	<c:redirect url="sqldemo1.jsp" />
</c:if>
<c:if test="${result ne 1}">
	<h1>Update Failure</h1>
</c:if>