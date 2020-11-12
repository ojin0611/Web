<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); 	%>		<%-- 한글로 입력받기 위해. --%>
<jsp:useBean  id = "telephone"  class = "com.example.libs.model.TelephoneVO" />
		<%-- TelephoneVO의 기본생성자 호출--%>
<jsp:setProperty  property = "*"   name = "telephone" />
		<%-- set은 jsp태그 사용 --%>

<jsp:useBean  id = "insert"  class = "com.example.libs.service.InsertService" />
		<%--InsertService의 기본 생성자 호출.  --%>
<%
	int row = insert.insertTelephone(telephone);
	if(row == 1) {
		response.sendRedirect("list.jsp");		//insert성공하면 row = 1 ... list.jsp로 다시 이동.
	}else {
%>
		<script>
			alert("입력 실패");
			history.back();		
		</script>
<% }		//if end %>