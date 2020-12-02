<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource dataSource="jdbc/mymariadb" var="conn"/>
<sql:query dataSource="${conn}" var="rs">
	SELECT id, name, countrycode, district, population
	FROM city
	WHERE countrycode = ?
	<sql:param value="${param.code}" />
</sql:query>
{
	"code" : "success",
	"data" : [
		<c:forEach items="${rs.rows}" var="row">
			{
				"id"          : ${row.id},
				"name"        : "${row.name}",
				"countrycode" : "${row.countrycode}",
				"district"    : "${row.district}",
				"population"  : ${row.population}
			},
		</c:forEach>
	]
}