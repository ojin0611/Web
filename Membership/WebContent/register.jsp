<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="member" class="com.example.libs.model.MemberVO" />
<jsp:setProperty property="*" name="member"/>

<jsp:useBean id="insert" class="com.example.libs.service.InsertService" />
<c:set var="row" value="<%=insert.insertMember(member) %>" />
<c:if test="${row eq 1}">
    <c:set var="userid" value="${member.userid}" scope="session" />
	<c:redirect url="login.jsp" />
</c:if>
<c:if test="${row ne 1}">
	<script>
		alert("회원가입 실패");
		history.back();
	</script>
</c:if>