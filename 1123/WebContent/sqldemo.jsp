<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>
<sql:query dataSource="${conn}" var="rs">
	SELECT empno, ename, sal, hiredate, dname, loc, deptno
	FROM emp INNER JOIN dept using(deptno)
	ORDER BY empno DESC
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<h1 class="text-center">쌍용 주식회사 사원 리스트</h1>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>사원번호</th><th>사원명</th><th>월급</th>
				<th>입사일</th><th>부서이름</th><th>위치</th>
				<th>부서번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${rs.rowsByIndex}" var="row">
				<tr>
				<td>${row.empno}</td><td>${row.ename}</td>
				<td><fmt:formatNumber type="currency" 
					currencySymbol="$" value="${row.sal}" /></td>
				<td><fmt:formatDate value="${row.hiredate}" type="date" 
				    dateStyle="full" /></td>
				<td>${row.dname}</td>
				<td>${row.loc}</td><td>${row.deptno}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>






