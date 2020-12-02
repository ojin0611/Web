<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="utf-8" />
<c:set var="sido" value="${param.sido}" />
<sql:setDataSource dataSource="jdbc/myoracle" var="conn" />
<sql:query dataSource="${conn}" var="rs">
	SELECT DISTINCT gugun FROM zipcode
	WHERE sido = ? ORDER BY gugun
	<sql:param value="${sido}"/>
</sql:query>

<select name="gugun" id="selGugun">
	<option value="">--구군선택--</option>
	<c:forEach items="${rs.rows}" var="row">
		<option value="${row.gugun}">${row.gugun}</option>
	</c:forEach>
</select>