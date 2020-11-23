<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="today" value="<%=new Date() %>" />
<c:forTokens items="${today}" delims=" :" var="myvariable">
	<c:out value="${myvariable}" /><br />
</c:forTokens>