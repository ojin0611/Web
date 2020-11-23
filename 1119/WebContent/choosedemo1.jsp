<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="name" value="${param.name}" />
<c:set var="kor" value="${param.kor}" />
<c:set var="eng" value="${param.eng}" />
<c:set var="mat" value="${param.mat}" />

<c:set var="total" value="${kor + eng + mat}" />
<c:set var="avg" value="${total / 3. }" />
<c:choose>
	<c:when test="${avg ge 90 and avg le 100}">
		<c:set var="grade" value="A" />
	</c:when>
	<c:when test="${avg ge 80}">
		<c:set var="grade" value="B" />
	</c:when>
	<c:when test="${avg ge 70}">
		<c:set var="grade" value="C" />
	</c:when>
	<c:when test="${avg ge 60}">
		<c:set var="grade" value="D" />
	</c:when>
	<c:otherwise>
		<c:set var="grade" value="F" />
	</c:otherwise>
</c:choose>

<h2><c:out value="${name}"/>님의 성적표</h2>
<ul>
	<li>국어 : <c:out value="${kor}" /></li>
	<li>영어 : <c:out value="${eng}" /></li>
	<li>수학 : <c:out value="${mat}" /></li>
	<li>총점 : <c:out value="${total}" /></li>
	<li>평균 : <c:out value="${avg}" /></li>
	<li>평점 : <c:out value="${grade}" /></li>
</ul>





