<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource dataSource="jdbc/mymariadb" var="conn"/>    
<sql:query dataSource="${conn}" var="rs">
	SELECT code FROM Country 
	ORDER BY code
</sql:query>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>국가코드별 도시 리스트</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.js"></script>
<script>
	/*let xhr = null;
	$(document).ready(function(){
		xhr = new XMLHttpRequest();   //1. 
  		$('#selCode').on('change', function(){
  			xhr.open('POST', 'getcities1.jsp', true);   //2.
  			xhr.onreadystatechange = callback;    //4
  			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
  			xhr.send('code=' + $(this).val());   //3. 
  		});
	});
	function callback(){
		if(xhr.readyState == 4 && xhr.status == 200){
			myparsor(xhr.responseText);   //매우 주의하자.
		}
	}*/
	$(function(){
		$('#selCode').on('change', function(){
			$.ajax({
				type : 'POST',
				url : 'getcities1.jsp',
				//dataType : 'json',
				data : {   //서버로 보낼 데이터
					code : $('#selCode').val()
				},
				success : function(data){   //서버가 보낸 데이터
					myparsor(data);
				}
			});
		});
	});
	
	function myparsor(serverdata){
	    let idx = serverdata.lastIndexOf(",");
	    let str = serverdata.substring(0, idx) + "]}";
	    let obj = JSON.parse(str.trim());  //문자열이 객체가 되었다.
	    let dataStr = "";
	    if(obj.code == "success"){
	      let array = obj.data;
	      for(let i = 0 ; i < array.length ;i++){
	        let city = array[i];
	        dataStr += "<tr>";
	        dataStr += "<td>" + city.id + "</td>" +
	                   "<td>" + city.name + "</td>" + 
	                   "<td>" + city['countrycode'] + "</td>" +
	                   "<td>" + city.district + "</td>" +
	                   "<td>" + city.population.toLocaleString() + "</td>";
	        dataStr += "</tr>";
	      }
	      $('tbody').html(dataStr);
	    }
	}
</script>
</head>
<body>
  <div class="text-center">
  	<h1>국가코드별 도시 리스트</h1>
  	<select id="selCode">
  		<option>--코드선택--</option>
  		<c:forEach items="${rs.rows}" var="row">
  			<option value="${row.code}">${row.code}</option>
  		</c:forEach>
  	</select>
  </div>
  <div class="container">
    <div class="row">
      <table class="table table-hover">
        <thead>
          <tr>
            <th>일련번호</th>
            <th>도시명</th>
            <th>국가코드</th>
            <th>지역</th>
            <th>인구수</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
</body>
</html>