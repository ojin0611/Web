<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<c:if test="${empty userid}"><%--login을 하지 않았다면 --%>
	<c:redirect url="login.jsp" />
</c:if>
<c:if test="${not empty userid}">
	<c:set var="member" value="${select.selectMember(userid)}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보보기 페이지</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-theme.css" />
<style>
	.row{
		padding:10px 400px;
	}
</style>
<script src="js/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$('#btnHome').click(function(){
			location.replace('index.html');
		});
		$('#btnUpdate').click(function(){
			if($(this).text() == '정보변경하기'){
				let email = $('#email').text();
				$('#email').replaceWith("<input id='txtEmail' type='email' value='" + email + "'/>");
				
				let city = $('#city').text();
				let str = "<select id='selCity'>" + 
	                      "<option value=\"서울\">서울</option>" +
	                      "<option value=\"부산\">부산</option>" +
	                      "<option value=\"대구\">대구</option>" +
	                      "<option value=\"대전\">대전</option>" +
	                      "<option value=\"광주\">광주</option>" +
	                      "<option value=\"인천\">인천</option>" +
	                      "<option value=\"울산\">울산</option>" +
	          			   "</select>";
				$('#city').replaceWith(str);
				let array = ["서울", "부산", "대구", "대전", "광주", "인천", "울산"];
				let idx = array.indexOf(city);
				document.getElementById("selCity").options.selectedIndex = idx;
				
				let age = $('#age').text();
				$('#age').replaceWith("<input id='txtAge' type='number' min='0' value='" + age + "' />");
				
				$('#btnUpdate').text('변경완료하기');
				$('#btnUpdate').removeClass();
				$('#btnUpdate').addClass("btn btn-danger");
			}else if($(this).text() == '변경완료하기'){
				let email = $('#txtEmail').val();
				let city = $('#selCity').val();
				let age = $('#txtAge').val();
				location.href = 
					'update.jsp?email=' + email + '&city=' + city + '&age=' + age;
			}
		});
		$('#btnDelete').click(function(){
			$('#btnDelete').on('click', function(){
				if(confirm("정말 탈퇴하시겠습니까 ? ")){
					location.replace("delete.jsp");
				}else{
					history.go(0);
				}
			});
		});
	});
</script>
</head>
<body>
	<h1 class="text-success text-center"><c:out value="${member.name}"/>님의 정보</h1>
	<div class="container">
		<div class="row">
			<table class="table table-bordered">
				<tr>
					<th class="info">아이디</th><td>${userid}</td>
				</tr>
				<tr>
					<th class="info">Email</th>
					<td><span id="email">${member.email}</span></td><%-- member.getEmail() --%>
				</tr>
				<tr>
					<th class="info">성별</th>
					<td>
						<c:if test="${member.gender eq 1}">남성</c:if>
						<c:if test="${member.gender eq 2}">여성</c:if>
					</td>
				</tr>
				<tr>
					<th class="info">거주지</th>
					<td>
						<span id="city"><c:out value="${member.city}"/></span>
					</td>
				</tr>
				<tr>
					<th class="info">나이</th>
					<td><span id="age">${member.age}</span></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<button type="button" id="btnHome" class="btn btn-success">홈으로</button>
				<button type="button" id="btnUpdate" class="btn btn-info">정보변경하기</button>
				<button type="button" id="btnDelete" class="btn btn-warning">탈퇴하기</button>
			</div>
		</div>
	</div>
</body>
</html>






