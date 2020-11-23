<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.html" var="myheader" scope="session"/>
<c:import url="footer.html" var="footer" scope="session"/>
<c:import url="forTokendsdemo.jsp" var="mytoken" />
<c:import url="forEachdemo.jsp" var="gugudan" />

${myheader}
${mytoken}
${gugudan}
<!-- <div><a href="importdemo1.jsp">다른 페이지로 이동하기</a></div> -->
<c:redirect url="importdemo1.jsp" />
${footer}