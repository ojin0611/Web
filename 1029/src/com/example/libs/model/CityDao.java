package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CityDao {
	public static ArrayList<String> getCountryCode() throws SQLException{
		DBConnection dbconn = new DBConnection();
		Connection conn = dbconn.getConnection(); // 2, 3
		Statement stmt = conn.createStatement();  // 4
		String sql = "SELECT DISTINCT Code FROM Country ORDER BY Code";
		ResultSet rs =stmt.executeQuery(sql); 		  // 5
		ArrayList<String> list = new ArrayList<String>();
		while(rs.next()) {
			String code = rs.getString("code");
			list.add(code);
		}
		DBClose.close(conn, stmt, rs); // 7
		return list;
	}

	public static ArrayList<CityVO> getCityList(String code) throws SQLException{
		DBConnection dbconn = new DBConnection();
		Connection conn = dbconn.getConnection(); // 2, 3
		String sql = "SELECT * FROM City WHERE Countrycode = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql); // 4. 아직도 불안전한 SQL문
		pstmt.setString(1, code); // 비로소 완전한 SQL문
		ResultSet rs = pstmt.executeQuery(); // 5. 실행
		ArrayList<CityVO> list = new ArrayList<CityVO>();
		while(rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String countrycode = rs.getString("countrycode");
			String district = rs.getString("district");
			int population = rs.getInt("population");
			CityVO city = new CityVO(id, name, countrycode, district, population);
			list.add(city);
		}		
		DBClose.close(conn, pstmt, rs); // 7
		return list;
	}

	public static int insertMember(String username, int age, String gender, String hobby, String city) throws SQLException {
		DBConnection dbconn = new DBConnection();
		Connection conn = dbconn.getConnection(); // 2, 3
		String sql = "INSERT INTO Member(" +
					 "username, userage, gender, hobby, city) VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);; // 4
		pstmt.setString(1, username);
		pstmt.setInt(2, age);
		pstmt.setString(3, gender);
		pstmt.setString(4, hobby);
		pstmt.setString(5, city);
		int row = pstmt.executeUpdate();  // select만 executeQuery고 나머진 다 executeUpdate
		DBClose.close(conn, pstmt); // 6
		return row;
	} 
}
