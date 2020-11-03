<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.util.GregorianCalendar" %>
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	cal = new GregorianCalendar(year, month - 1, 1);
	int yoil = cal.get(Calendar.DAY_OF_WEEK);   //요일, 1:일요일, ~ 7:토요일
	int lastDay = cal.getActualMaximum(Calendar.DATE);    //일의 가장 큰 값, 즉 달의 마지막 날
	int count = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar(<%=year %>년 <%=month + 1 %>월)</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
	<h1><%=year %>年 <%=month %>月</h1>
	<table border="1">
		<thead>
			<tr>
				<th>日</th><th>月</th><th>火</th><th>水</th><th>木</th><th>金</th><th>土</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<% 
				//달력의 첫 줄 공백
				for(int i = 1 ; i < yoil ; i++){ 
			%>
				<td>&nbsp;</td>
			<% 
					count++;
				} 
			%>
			<%
				//1일부터 마지막 날까지
				for(int i = 1 ;i <= lastDay ; i++){
					if(count % 7 == 0)  //매주 일요일마다
						out.print("<td><span class='sunday'>" + i + "</span></td>");
					else if(count % 7 == 6)  //매주 토요일마다
						out.print("<td><span class='saturday'>" + i + "</span></td>");
					else
						out.print("<td>" + i + "</td>");
					count++;
					if(count % 7 == 0){  //매주 토요일마다
						out.println("</tr><tr>");  //7번마다 새 열
						count = 0;
					}
				}
				//달력의 마지막 줄 
				if(count != 0){
					for(int i = 0 ; i < 7 - count ; i++){
						out.print("<td>&nbsp;</td>");
					}
				}
			%>
		</tbody>
	</table>
</body>
</html>