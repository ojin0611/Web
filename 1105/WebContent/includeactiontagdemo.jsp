<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="header.html" flush="true"/>

<jsp:include page="date.jsp" flush="false">
	<jsp:param name="year" value="2020" />
	<jsp:param name="month" value="11" />
	<jsp:param name="day" value="5" />
</jsp:include>

<jsp:include page="copyright.html" />