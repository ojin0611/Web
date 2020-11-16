package com.example.libs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetEmployee {
	public static String getEmp(String ename) {
		//System.out.println("ename = " + ename);
		Connection conn = DBConnection.getConnection();  //2, 3
		String sql = "SELECT sal, job, hiredate, dname, loc " +
		                 "FROM emp INNER JOIN dept USING(deptno) " +
				         "WHERE ename = ?";
		String str = "<ul>";
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement(sql);     //4
			pstmt.setString(1, ename.toUpperCase());
			rs = pstmt.executeQuery();                         //5
			rs.next();
			str += "<li>이름 : " + ename + "</li>" +
	                  "<li>월급 : " + rs.getDouble("sal") + "</li>" + 
	                  "<li>직무 : " + rs.getString("job") + "</li>" + 
	                  "<li>입사일 : " + rs.getDate("hiredate") + "</li>" + 
	                  "<li>소속 부서명 : " + rs.getString("dname") + "</li>" + 
	                  "<li>근무지 : " + rs.getString("loc") + "</li>" + 
	                  "</ul>";
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		DBClose.close(conn);   //7
		return str;
	}
}
