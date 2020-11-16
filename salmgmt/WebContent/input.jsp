<%@ page language="java" contentType="text/html; charset=utf-8" %>

<jsp:useBean id="emp" class="com.example.libs.model.EmployeeVO" />
<jsp:useBean id="insert" class="com.example.libs.service.InsertService" />  
 
<jsp:setProperty property="*" name="emp" />

<%
	int row = insert.insert(emp);   //insert 끝
	if(row == 0){
%>
	<script>
		alert("Failure");
		history.back();
	</script>
<% }else{ %>
	<script>
		alert("Data Insert Sucess!!!");
		location.href = "index.jsp";
	</script>	
<% } %>	
	
	
	
	
	
	