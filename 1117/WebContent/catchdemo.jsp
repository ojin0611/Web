<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:catch var="myerror">
<%=10 / 2 %><br />
</c:catch>



<c:if test="${empty myerror}">
	<c:out value="<scan style='color:green'>잘 처리됐습니다.</scan>" escapeXml="false" />
</c:if>
<c:if test="${not empty myerror}">
	Error 발생 : <c:out value="${myerror}" />
</c:if>