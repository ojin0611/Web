<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.example.libs.model.EmployeeVO" %> 
<%@ page import="java.util.Vector" %>    
<jsp:useBean id="list" class="com.example.libs.service.SelectService" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>사원 봉급 정보 출력창</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
	.container{
		padding : 0% 10%;
	}
</style>
</head>
<%
	Vector<EmployeeVO> vector = list.select_all();
%>
<body>
	<h1 class="text-center">사원 봉급 정보 리스트</h1>
	<div class="container">
	<div class="row">
	<table class="table">
		<tr>
			<td><a href="input.html">입력하기</a></td>
			<td class="text-right">
			<%
				if(vector != null){
			%>
			[<%=vector.size() + "명 데이타"%>]
			<%
				}else{
			%>
			0명 데이터
			<%
				}
			%>
			</td>
		</tr>
	</table>
	</div>
	</div>
	<div class="container">
	<div class="row">
	<table class="table table-bordered">
		<tr class="success">
			<th>사번</th><th>부서</th><th>기본급</th>
			<th>직무급</th><th>야근수당</th><th>가족수당</th>
			<th>총지급액</th><th>소득세</th><th>실수령액</th>
		</tr>
	<%
		if(vector == null){  //데이타가 없다면
	%>
		<tr>
			<td colspan="9" class="text-center">
				데이타가 없습니다.
			</td>
		</tr>
	<%
		}else{
		for(int i = 0 ; i < vector.size() ; i++){
			EmployeeVO emp = vector.get(i);
	%>
		<tr>
			<td class="text-center"><%=emp.getSabun() %></td>
			<td class="text-center"><%=emp.getDepartment() %></td>
			<td class="text-center"><%=emp.getGibon() %></td>
			<td class="text-center"><%=String.format("%,d", emp.getMoney()) %></td>
			<td class="text-center"><%=String.format("%,d", emp.getNightmoney()) %></td>
			<td class="text-center"><%=String.format("%,d", emp.getFamilymoney()) %></td>
			<td class="text-center"><%=String.format("%,d", emp.getSalary()) %></td>
			<td class="text-center"><%=String.format("%,d", emp.getTax()) %></td>
			<td class="text-center"><%=String.format("%,d", emp.getSum()) %></td>
		</tr>
	<%  }//for end
		} //else end
	   %>
	</table>
	</div>
	</div>
</body>
</html>