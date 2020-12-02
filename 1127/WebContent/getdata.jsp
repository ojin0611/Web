<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>
<c:set var="search" value="${param.search}" />
<c:if test="${fn:indexOf(search, '0') eq 1}">
	<sql:query dataSource="${conn}" var="rs">
		SELECT empno, ename, deptno, dname, loc 
		FROM emp INNER JOIN dept using(deptno)  
		WHERE deptno = ?
		<sql:param value="${search}" />
	</sql:query>
</c:if>
<c:if test="${fn:indexOf(search, '0') ne 1}">
	<sql:query dataSource="${conn}" var="rs">
		SELECT empno, ename, deptno, dname, loc 
		FROM emp INNER JOIN dept using(deptno)  
		WHERE loc = ?
		<sql:param value="${search}" />
	</sql:query>
</c:if>

<c:if test="${rs.rowCount gt 0}">
{
	"code" : "success",
	"data" : [
		<c:forEach items = "${rs.rows}" var="row">
			{
				"empno" : ${row.empno},
				"ename" : "${row.ename}",
				"deptno" : ${row.deptno},
				"dname" : "${row.dname}",
				"loc" : "${row.loc}"
			},
		</c:forEach>
	]
}
</c:if>
<c:if test="${rs.rowCount eq 0}">
{
	"code" : "failure"
}
</c:if>





