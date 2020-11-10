package com.example.libs.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class SungjukMgmtDao {

	public static ArrayList<StudentVO> select(String path) throws SQLException{
		DBConnection dbconn = new DBConnection(path);
		Connection conn = dbconn.getConnection();  //2,3
		String sql = "{ call sp_select_all(?) }";
		
		DBClose.close(conn);  //7
		return null;
	}

}
