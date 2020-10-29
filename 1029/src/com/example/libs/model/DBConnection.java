package com.example.libs.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {	
	private static final String DBDRIVER="org.mariadb.jdbc.Driver";
	private static final String DBURL = "jdbc:mariadb://localhost:3306/world";
	private static final String DBUSER = "root";
	private static final String DBPWD = "javamariadb";
	public Connection getConnection() {

		try {
			Class.forName(DBDRIVER);  
		} catch (ClassNotFoundException e) {
			System.out.println("Oracle Driver Loading Failure");
		}    

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD);
		} catch (SQLException e) {
			System.out.println("Connection Failure");
		}
		return conn;
	}
}
