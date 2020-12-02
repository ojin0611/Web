<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>
<sql:query dataSource="${conn}" var="rs">
	SELECT DISTINCT sido FROM zipcode ORDER BY sido
</sql:query>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Ajax Demo</title>
<script src="js/jquery-3.5.1.js"></script>
<script>
	var xhr = null;
	$(document).ready(function(){
		xhr = new XMLHttpRequest();  //1. 객체 생성
		$('#selSido').on('change', function(){
			xhr.onreadystatechange = getGugun;     //4
			xhr.open('POST', 'getGugunlist.jsp', true);  //2. open()
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
			xhr.send('sido=' + $(this).val());     //3.
		});
		$('#btnSearch').on('click', function(){
			xhr.onreadystatechange = getAddress;    //4.
			xhr.open('POST', 'getAddresslist.jsp', true);   //2. open()
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
			let param = 'dong=' + $('#txtDong').val().trim() + 
			            '&sido=' + $('#selSido').val().trim() +
			            '&gugun=' + $('#selGugun').val().trim();
			xhr.send(param);   //3. send()
		});
	});
	function getGugun(){
		if(xhr.readyState == 4 && xhr.status == 200){
			$('#gugunDiv').html(xhr.responseText.trim());
		}
	}
	function getAddress(){
		if(xhr.readyState == 4 && xhr.status == 200){
			$('#result').html(xhr.responseText.trim());
		}
	}
</script>
</head>
<body>
	<form id="frmZip" name="frmZip">
		<table width="800" cellpadding="3" cellspacing="0">
			<tr>
				<td>
					<select name="sido" id="selSido">
						<option value="">--시도선택--</option>
						<c:forEach items="${rs.rows}" var="row">
							<option value="${row.sido}">${row.sido}</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<div id="gugunDiv">
						<select name="" id="selGugun">
							<option value="">--구군선택--</option>
						</select>
					</div>
				</td>
				<td>
					읍/면/동이름 : <input type="text" name="dong" id="txtDong"/>&nbsp;&nbsp;
					<input type="button" value="우편번호검색" id="btnSearch"/>
				</td>
			</tr>
		</table>
	</form>
	<div id="result"></div>
</body>
</html>