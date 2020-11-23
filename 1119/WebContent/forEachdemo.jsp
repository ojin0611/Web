<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <c:set var="count" value="0" />
<c:forEach var="i" begin="1" end="100">
	<c:if test="${i mod 7 eq 0}">
		<c:out value="${i}" />&nbsp;&nbsp;&nbsp;
		<c:set var="count" value="${count + 1}" />
		<c:if test="${count mod 4 eq 0}">
			<br />
		</c:if>
	</c:if>
</c:forEach> --%>
<style>
	table{ 
		border-collapse:collapse;
		width:400px;margin-left:auto;margin-right:auto;
		border:1px sold black;
	}
	td, th{
		border:1px sold black;
	}
	td{
		text-align:center;
	}
</style>
<h2 style="text-align:center">구구단</h2>
<table border="1">
	<thead>
		<tr>
			<c:forEach var="i" begin="2" end="5">
				<th>${i}단</th>
			</c:forEach>
		</tr>	
	</thead>
	<tbody>
		<tr>
			<c:forEach var="i" begin="2" end="5">
				<td>
					<c:forEach var="j" begin="1" end="9">
						${i} x ${j} = ${i * j}<br />
					</c:forEach>
				</td>
			</c:forEach>
		</tr>
	</tbody>
</table>


