<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.model.StudentVO" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<jsp:useBean id="update" class="com.example.libs.service.UpdateService" />
<%
	String hakbun = request.getParameter("hakbun");
	StudentVO student = select.select(hakbun);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 점수 수정 페이지</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$('#txtKor').val(<%=student.getKor()%>);
		$('#txtEng').val(<%=student.getEng()%>);
		$('#txtMat').val(<%=student.getMat()%>);
		$('#txtTot').val(<%=student.getTot()%>);
		$('#txtAvg').val(<%=student.getAvg()%>);
		$('#txtGrade').val('<%=student.getGrade()%>');
		$("button[type='button']").on('click', function(){
			history.back();
		});
	});
</script>
</head>
<body>
	<div class="container">
	<div class="row">
	<h1 class="text-left">
		<%=student.getName() %>(<%=student.getHakbun() %>)'s 수정 페이지</h1>
	<form action="update_ok.jsp" method="POST">
		<input type="hidden" name="hakbun" value="<%=hakbun %>" />
		<ul>
			<li>국어 : <input type="number" max="100" min="0" name="kor" id="txtKor" /></li>
			<li>영어 : <input type="number" max="100" min="0" name="eng" id="txtEng" /></li>
			<li>수학 : <input type="number" max="100" min="0" name="mat" id="txtMat" /></li>
			<li>총점 : <input type="text" id="txtTot" readonly /></li>
			<li>평균 : <input type="text" id="txtAvg" readonly /></li>
			<li>평점 : <input type="text" id="txtGrade" readonly /></li>
			<li><button type="submit" class="btn btn-warning">수정하기</button>
			    <button type="button" class="btn btn-danger">취소하기</button>
			</li>
		</ul>
	</form>
	</div>
	</div>
</body>
</html>