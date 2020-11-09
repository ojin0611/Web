<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%!
	private static String DBURL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	private static String DBUSER = "scott";
	private static String DBPWD = "tiger";
%>    
<%
	Class.forName(DBDRIVER);   //2
	Connection conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD); //3
	Statement stmt = conn.createStatement();   //4
	String sql = "SELECT TO_CHAR(sysdate, 'yyyy-mm-dd') FROM dual";
	ResultSet rs = stmt.executeQuery(sql);    //5
	rs.next();
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Now is <%=rs.getString(1) %>.
</body>
</html>
<%
	if(rs != null) rs.close();   //7
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
%>



