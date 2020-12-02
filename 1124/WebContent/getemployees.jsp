<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, oracle.jdbc.OracleTypes" %>
<%@ page import="com.example.libs.DBClose, com.example.libs.DBConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "{ call sp_department_info(?) }";
	CallableStatement cstmt = conn.prepareCall(sql);
	cstmt.registerOutParameter(1, OracleTypes.CURSOR);
	cstmt.execute();  //매우 주의하자.
	ResultSet rs = (ResultSet)cstmt.getObject(1);
	ArrayList<String> list = new ArrayList<String>();
	while(rs.next()){
		int deptid = rs.getInt(1);;
		String deptname = rs.getString(2);
		int cnt = rs.getInt(3);
		double avg_sal = rs.getDouble(4);
		int avg_year = rs.getInt(5);
		list.add("" + deptid + "," + deptname + "," + cnt + "," + avg_sal + "," + avg_year);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th, td{border:1px solid black; }
	th { background-color:cyan;}
	td { text-align:center;}
</style>
</head>
<body>
	<h1 style="text-align:center">쌍용주식회사 부서별 통계</h1>
	<table border="1" style="width:500px;margin:auto;border:1px solid black">
		<thead>
			<tr>
				<th>부서번호</th><th>부서명</th><th>부서별 인원수</th>
				<th>평균 봉급</th><th>평균 재직기간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="<%=list %>" var="row">
			<tr>
				<c:forTokens items="${row}" delims="," var="i">
					<td>${i}</td>
				</c:forTokens>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
<% DBClose.close(conn, cstmt, rs);  %>