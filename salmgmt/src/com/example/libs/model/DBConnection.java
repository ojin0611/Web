package com.example.libs.model;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	public static Connection getConnection(){
		Connection conn = null;
		try{
			Context context = new InitialContext();
			Context env = (Context)context.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/salary");
			conn = ds.getConnection();
		}catch(NamingException ex){
			System.out.println(ex);
		}catch(SQLException ex){
			System.out.println(ex); 
		}
		return conn;
	}
}
