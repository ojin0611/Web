<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- Name : <%=request.getParameter("name") %><br />
Age : <%=request.getParameter("age") %> --%>

<%-- Name : ${param.name} <br /> 
Age : ${param.age} --%>

<%-- num1 : <%=request.getParameter("num1") %><br />
num2 : <%=request.getParameter("num2") %><br />
num1 + num2 : <%=request.getParameter("num1") + request.getParameter("num2") %> --%>

num1 : ${param.num1}<br />
num2 : ${param.num2}<br />
num1 + num2 : ${param.num1 + param.num2 }