<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	

<fmt:requestEncoding value="utf-8" />
<c:set var="address" value="${param.address}" />
<c:set var="order" value="${param.order}" />

<!DOCTYPE html">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Break Neck Pizza Delivery</title>
<link rel="stylesheet" type="text/css" href="css/breakneck.css" />
</head>
<body>
	<p>
		<img src="images/pizzahut.jpg" alt="Break Neck Pizza" />
	</p>
	<p>Your order will be delivered to:</p>
	<p class="customer-data">
		${address}
	</p>
	<p>We have your order down as:</p>
	<p class="customer-data">
		${order}
	</p>
</body>
</html>