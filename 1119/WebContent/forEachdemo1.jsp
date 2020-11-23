<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.HashMap"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Hashtable" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <c:set var="array" value="<%=new int[]{1,2,3,4,5,6,7,8} %>" />
<c:forEach items="${array}" var="i">
	<c:out value="${i}"/>&nbsp;&nbsp;&nbsp;
</c:forEach>
<br />
<br />

<c:set var="list" value="<%=Arrays.asList(1,2,3,4,5) %>" />
<c:forEach items="${list}" var="i">
	<c:out value="${i}" />&nbsp;&nbsp;&nbsp;
</c:forEach>
<br />
<br />
 --%>
<%-- <c:forEach items="<%=System.getProperties() %>" var="myproperty">
	<c:out value="${myproperty.key}" /> = 
	<span style='color:red'><c:out value="${myproperty.value}" /></span>
	<br />
</c:forEach> --%>

<%-- <%
	Hashtable<String, Integer> ht = new Hashtable<String, Integer>();
	ht.put("Jan", 1);   ht.put("Feb", 2);    ht.put("Mar", 3);
	ht.put("Apr", 4);   ht.put("May", 5);    ht.put("Jun", 6);
	ht.put("Jul", 7);   ht.put("Aug", 8);    ht.put("Sep", 9);
	ht.put("Oct", 10);   ht.put("Nov", 11);    ht.put("Dec", 12);
%>
<c:forEach items="<%=ht %>" var="my">
	<c:out value="${my.key}" /> => 
	<c:out value="${my.value}" />
	<br />
</c:forEach> --%>

<%
	HashMap<String, Object> student = new HashMap<String, Object>();
	student.put("학번", "2020-01");
	student.put("이름", "한지민");
	student.put("나이", 24);
	student.put("전화번호", "010-1234-5678");
	student.put("주소", "서울시 강남구 역삼동");
	student.put("생일", new java.util.Date());
%>
<c:set var="mystudent" value="<%=student %>" />
<c:forEach items="${mystudent }" var="i">
	<c:out value="${i.key}" /> = 
	<span style='color:blue'><c:out value="${i.value}" />
	</span><br />
</c:forEach>













