<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.model.StudentVO"%>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<%
	String hakbun = request.getParameter("hakbun");
	StudentVO student = select.select(hakbun);   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 상세 보기</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$('#btnList').on('click', function(){
			location.href = "list.jsp";
		});
		$('#btnUpdate').on('click', function(){
			location.href = "update.jsp?hakbun=<%=hakbun%>";
		});
		$('#btnDelete').on('click', function(){
			if(confirm("정말 삭제하시겠습니까?"))
				location.href = "delete.jsp?hakbun=<%=hakbun%>";
			else history.go(0);
		});
	});
</script>
</head>
<body>
	<div class="container">
	<div class="row">
		<h1 class="text-left">
		<%=student.getName() %>(<%=student.getHakbun() %>)'s Information</h1>
		<ul>
			<li>국어 : <%=student.getKor() %></li>
			<li>영어 : <%=student.getEng() %></li>
			<li>수학 : <%=student.getMat() %></li>
			<li>총점 : <%=student.getTot() %></li>
			<li>평균 : <%=student.getAvg() %></li>
			<li>평점 : <%=student.getGrade() %></li>
		</ul>
	
		<div><button type="button" class="btn btn-info" id="btnList">목록으로</button>
			<button type="button" class="btn btn-success" id="btnUpdate">수정하기</button>
			<button type="button" class="btn btn-danger" id="btnDelete">삭제하기</button>
		</div>
	</div>
	</div>
</body>
</html>





