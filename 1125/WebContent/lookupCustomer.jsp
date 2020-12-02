<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="phone" value="${param.phone}" />	
<sql:setDataSource dataSource="jdbc/mymariadb" var="conn"/>
<sql:query dataSource="${conn}" var="rs">
	SELECT irum, sido, gugun, dong, bunji, zipcode FROM member
	WHERE phone = ?
	<sql:param value="${phone}" /> 
</sql:query>

<c:if test="${rs.rowCount eq 1}"> <%--찾았다면 --%>
	<c:set var="irum" value="${rs.rows[0].irum}" />
	<c:set var="sido" value="${rs.rows[0].sido}" />
	<c:set var="gugun" value="${rs.rows[0].gugun}" />
	<c:set var="dong" value="${rs.rows[0].dong}" />
	<c:set var="bunji" value="${rs.rows[0].bunji}" />
	<c:set var="zipcode" value="${rs.rows[0].zipcode}" />
	<c:out value="${irum}" />
<c:out value="(${zipcode}) ${sido} ${gugun} ${dong} ${bunji}" />
</c:if>
<c:if test="${rs.rowCount ne 1}">
	<c:out value="Not Found" />
</c:if>