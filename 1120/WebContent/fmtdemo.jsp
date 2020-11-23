<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
Number : <fmt:formatNumber value="12345678.3456" type="number" /><br />
Currency : <fmt:formatNumber value="1500000"
type="currency" currencySymbol="￦"/><br />
Currency : <fmt:formatNumber value="1500000"
type="currency" currencySymbol="$"/><br />
Currency : <fmt:formatNumber value="1500000"
type="currency" currencySymbol="￥"/><br />
Percent : <fmt:formatNumber value="1500000" type="percent" /><br />
<c:set var="now" value="<%=new java.util.Date()%>" />
Now is ${now}<br />
Now is <c:out value="${now}" /><br />
Date : <fmt:formatDate value="${now}" type="date" /><br />
Time : <fmt:formatDate value="${now}" type="time" /><br />
Both : <fmt:formatDate value="${now}" type="both" /><br />
<fmt:formatNumber value="50000" type="currency"/><br>
<fmt:formatNumber value="0.15" type="percent"/><br>
<fmt:formatNumber value="500567300" pattern="###,###,###"/><p>
<jsp:useBean id="date" class="java.util.Date"/>
<fmt:formatDate value="${date}" type="date"/><br>
<fmt:formatDate value="${date}" type="time"/><br>