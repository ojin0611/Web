<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.example.libs.model.StudentVO" %>
   
<jsp:useBean id="service" class="com.example.libs.service.SelectService" /> 
<%
	ArrayList<StudentVO> list = service.selectAll();	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to 쌍용고등학교</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
	<h1 class="text-center">쌍용 고등학교 성적관리프로그램</h1>
	
	<div class="container">
		<div class="row">
			<table class="table" style="border : 0px">
				<tr>
					<td>[<a href="input.html">입력하기</a>]</td>
					<td class="text-right">(<%=(list == null) ? "0" : list.size() %>)명</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="container">
	<div class="row">
	<table class="table table-bordered">
	<thead>
		<tr class="info">
			<th>등수</th><th>학번</th><th>이름</th>
			<th>국어</th><th>영어</th><th>수학</th>
		</tr>
	</thead>
	<tbody>
	<% if(list == null){ %>
		<tr>
			<td colspan="6" class="text-center">No Data</td>
		</tr>
	<% 
		}else{ 
			for(int i = 0 ; i < list.size() ; i++){
				StudentVO student = list.get(i);
				String hakbun = student.getHakbun();
	%>
		<tr>
			<td><%=i+1 %></td>
			<td><a href="view.jsp?hakbun=<%=hakbun%>"><%=hakbun %></a></td>
			<td><%=student.getName() %></td><td><%=student.getKor() %></td>
			<td><%=student.getEng() %></td><td><%=student.getMat() %></td>
		</tr>
	<%
		    } //for end
		} //if end
	%>
	</tbody>
	</table>
	</div>
	</div>
</body>
</html>