<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="update" class="com.example.libs.service.UpdateService" />
<jsp:useBean id="member" class="com.example.libs.model.MemberVO" />
<jsp:setProperty name="member" property="userid" value="${userid}" />
<jsp:setProperty name="member" property="email" param="email" />
<jsp:setProperty name="member" property="city" param="city" />
<jsp:setProperty name="member" property="age" param="age" />

<c:set var="row" value="${update.updateMember(member)}" />
<c:if test="${row eq 1}">
	<c:redirect url="myservice.jsp" />
</c:if>
<c:if test="${row ne 1}">
	<script>
		alert("회원정보 수정 실패");
		history.back();
	</script>
</c:if>