<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>
<sql:query dataSource="${conn}" var="rs">
	SELECT empno, ename, job, dname, loc, deptno
	FROM emp NATURAL JOIN dept
	ORDER BY empno
</sql:query>
{
   "code" : "success",
   "data" : [ 
   	<c:forEach items="${rs.rows}" var="row">
		{
		   "empno"  : ${row.empno},
		   "ename"  : "${row.ename}",
		   "job"    : "${row.job}",
		   "dname"  : "${row.dname}",
		   "loc"    : "${row.loc}",
		   "deptno" : ${row.deptno}
		},
	</c:forEach>
   ]
}