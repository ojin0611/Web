<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result = 0;    //지역변수
	result = add(5, 9);
%>
   값은 <%=result %> 입니다.


<%!
	static String msg = "Hello, World";  //스태틱변수
%>
<%!
	int add(int a, int b){
		return a + b;
	}
%>