<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>
<sql:query dataSource="${conn}" var="rs1">
	SELECT deptno FROM dept ORDER BY deptno
</sql:query>
<sql:query dataSource="${conn}" var="rs2">
	SELECT loc FROM dept ORDER BY loc
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.js"></script>
<script>
	$(function(){
		let search = null;
		let deptno = null;
		let loc = null;
		$('#selDeptno').on('change', function(){
			search = $(this).val();
			
		});
		$('#selLoc').on('change', function(){
			search = $(this).val();
			console.log("search = " + search);
		});
		$('#btnSearch').on('click', function(){
			$.ajax({
				method : 'POST',
				url : 'https://www.naver.com',
				data : {    //서버에 보낼 데이터
					search : search
				},
				success : function(data){  //서버에서 받아온 데이터
					myparsor(data);
				}
			});
		});
	}); 
	function myparsor(serverdata){
		let str = "";
		let idx = serverdata.lastIndexOf(",");
		let server = null;
		if(idx > -1) server = serverdata.substring(0, idx) + "]}";  //comma의 위치를 찾았다면
		else server = serverdata;
		
		server = server.trim();
		let obj = JSON.parse(server);  //문자열에서 객체로 변환
		if(obj.code == "failure"){
			str += "<tr><td colspan='5' class='text-center'>No Data</td></tr>";
		}else{
			let array = obj.data;   //배열데이터
			for(let i = 0 ; i < array.length ; i++){
				str += "<tr>";
				str += "<td>" + array[i].empno + "</td><td>" + array[i].ename + "</td>" +
				       "<td>" + array[i].deptno + "</td><td>" + array[i].dname + "</td>" +
				       "<td>" + array[i].loc + "</td>";
				str += "</tr>";
			}
		}
		$('tbody').html(str);
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				부서번호 : <select id="selDeptno">
					<option>--부서번호선택--</option>
					<c:forEach items="${rs1.rows}" var="row">
						<option value="${row.deptno}">${row.deptno}</option>
					</c:forEach>
				</select>&nbsp;&nbsp;&nbsp;
				부서위치 : <select id="selLoc">
					<option>--부서위치선택--</option>
					<c:forEach items="${rs2.rows}" var="row">
						<option value="${row.loc}">${row.loc}</option>
					</c:forEach>
				</select>&nbsp;&nbsp;&nbsp;
				<button id="btnSearch">검색</button>
			</div>
			<br />
			<table class="table table-bordered">
				<thead>
					<tr class="info">
						<th>사원번호</th><th>사원이름</th>
						<th>부서번호</th><th>부서명</th><th>부서위치</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</body>
</html>



