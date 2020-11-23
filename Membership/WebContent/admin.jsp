<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<c:set var="list" value="${select.selectAll()}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 페이지</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<script src="js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="container">
    	<div class="row">
    		<h1>전체 회원 리스트</h1>
    		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th><th>이름</th><th>Email</th>
					<th>성별</th><th>거주지</th><th>나이</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="member">
					<c:if test="${fn:trim(member.userid) ne 'admin'}"><%--관리자가 아니라면 --%>
						<tr>
							<td>${member.userid}</td><td>${member.name}</td>
							<td>${member.email}</td>
							<td>
								<c:if test="${member.gender eq 1}">
								남성
								</c:if>
								<c:if test="${member.gender eq 2}">
								여성
								</c:if>
							</td>
							<td>${member.city}</td><td>${member.age}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
			</table>
    	</div>
    </div>
</body>
</html>