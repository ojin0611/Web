package com.example.libs.model;

import java.sql.CallableStatement;  
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SungjukMgmtDao {

	public static ArrayList<StudentVO> select() throws SQLException{
		Connection conn = DBConnection.getConnection();  //2,3
		String sql = "{ call sp_select_all(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);  //4
		cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.execute();     //5, 매우 주의하자.
		ResultSet rs = (ResultSet)cstmt.getObject(1);
		ArrayList<StudentVO> list = new ArrayList<StudentVO>();
		if(rs.next()) {
			do {
				String hakbun = rs.getString("hakbun");
				String name = rs.getString("name");
				int kor = rs.getInt("kor");
				int eng = rs.getInt("eng");
				int mat = rs.getInt("mat");
				StudentVO student = new StudentVO(hakbun, name, kor, eng, mat);
				list.add(student);
			}while(rs.next());
		}else {  //data가 없다면
			list = null;
		}
		DBClose.close(conn, cstmt, rs);  //7
		return list;
	}

	public static int insert(StudentVO student) throws SQLException {
		Connection conn = DBConnection.getConnection();  //2,3
		String sql = "{ call sp_student_insert(?, ?, ?, ?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);   //4
		cstmt.setString(1, student.getHakbun());
		cstmt.setString(2, student.getName());
		cstmt.setInt(3, student.getKor());
		cstmt.setInt(4, student.getEng());
		cstmt.setInt(5, student.getMat());
		int row = cstmt.executeUpdate();   //5
		DBClose.close(conn, cstmt);  //6
		return row;
	}

	public static StudentVO selectOne(String hakbun) throws SQLException{
		Connection conn = DBConnection.getConnection();  //2,3
		String sql = "{ call sp_select(?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);   //4
		cstmt.setString(1, hakbun);
		cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.execute();      //5, 매우 주의하자.
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();
		StudentVO student = new StudentVO(rs.getString("hakbun"), rs.getString("name"),
				            rs.getInt("kor"), rs.getInt("eng"), rs.getInt("mat"));
		student.setTot(rs.getInt("tot"));
		student.setAvg(rs.getDouble("avg"));
		student.setGrade(rs.getString("grade"));
		DBClose.close(conn, cstmt, rs);  //7
		return student;
	}
	
	public static int delete(String hakbun) throws SQLException {
		Connection conn = DBConnection.getConnection();  //2,3
		String sql = "{ call sp_delete(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);   //4
		cstmt.setString(1, hakbun);
		int row = cstmt.executeUpdate();   //5
		DBClose.close(conn, cstmt);  //6
		return row;
	}
	
	public static int update(StudentVO student) throws SQLException {
		Connection conn = DBConnection.getConnection();  //2,3
		String sql = "{ call sp_update(?, ?, ?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);   //4
		cstmt.setString(1, student.getHakbun());
		cstmt.setInt(2, student.getKor());
		cstmt.setInt(3, student.getEng());
		cstmt.setInt(4, student.getMat());
		int row = cstmt.executeUpdate();   //5
		DBClose.close(conn, cstmt);  //6
		return row;
	}
}







