<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="com.example.libs.model.StudentVO" />
<jsp:setProperty name="student" property="*" />

<jsp:useBean id="update" class="com.example.libs.service.UpdateService" />
<%
	int row = update.updateStudent(student);
	if(row == 1) response.sendRedirect("view.jsp?hakbun=" + student.getHakbun());
	else{
%>
	<script>
		alert("학생 점수 수정 실패");
		history.back();
	</script>
<% } %>