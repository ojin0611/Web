<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.CallableStatement" %>
<%@ page import="java.sql.ResultSet" %>   <%-- 1 --%>

<%
	int deptno = 0;
	String deptnoStr = request.getParameter("deptno");
	if(deptnoStr != null){  //두번째 이상 방문한 페이지일 경우
		deptno = Integer.parseInt(deptnoStr);
	}else{  //첫 방문 페이지일 경우
		deptnoStr = "";
	}
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	if(!deptnoStr.equals("")){  //두번째 이상 방문한 페이지일 경우
		Class.forName(application.getInitParameter("db.driver"));  //2
		conn = DriverManager.getConnection(
				application.getInitParameter("db.url"), 
				application.getInitParameter("db.user"), 
				application.getInitParameter("db.password"));      //3
		String sql = "{ call sp_test(?) }";
		cstmt = conn.prepareCall(sql);                             //4
		cstmt.setInt(1, deptno);     //비로소 완전한 SQL문 완성
		rs = cstmt.executeQuery();                                 //5
	}
	
%>    
<link rel="stylesheet" href="css/style.css" />
<script src="js/application.js"></script>

<form>
	부서번호 : <select name="deptno">
	           <option>--선택--</option>
	           <option value="10" 
	           	<% if(deptnoStr.equals("10")){
	           		out.println("selected");
	           	   } 
	           	%>>10번부서</option>
	           <option value="20"
	           	<% if(deptnoStr.equals("20")){
	           		out.println("selected");
	           	   } 
	           	%>>20번부서</option>
	           <option value="30"
	           	<% if(deptnoStr.equals("30")){
	           		out.println("selected");
	           	   } 
	           	%>
	           >30번부서</option>
			 </select>
</form>
<hr/>
<table border="1">
	<thead>
		<tr>
			<th>사원번호</th><th>사원이름</th><th>직무</th><th>부서번호</th>
			<th>부서명</th><th>부서위치</th>
		</tr>
	</thead>
	<tbody>
		<% if(rs != null){ %>
			<%  while(rs.next()){   %>
				<tr>	
					<td><%=rs.getInt("empno") %></td>
					<td><%=rs.getString("ename") %></td>
					<td><%=rs.getString("job") %></td>
					<td><%=rs.getInt("deptno") %></td>
					<td><%=rs.getString("dname") %></td>
					<td><%=rs.getString("loc") %></td>
				</tr>
			<% } //while end %>
		<% }else{ //if end %>
			<tr><td colspan="6">No Data</td></tr>
		<% } %>
	</tbody>
</table>
<%
	if(rs != null) rs.close();                          //7
	if(cstmt != null) cstmt.close();
	if(conn != null) conn.close();
%>