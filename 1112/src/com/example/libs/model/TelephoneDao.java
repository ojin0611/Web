package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class TelephoneDao {
	
	public static ArrayList<TelephoneVO> select() throws SQLException {
		Connection conn = DBConnection.getConnection();	//2, 3 step	//Apache의 DBCP로 돌아가는 Connection
		Statement stmt = conn.createStatement();		//4step.		
		String sql = "SELECT * FROM Telephone ORDER BY seq";
		ResultSet rs = stmt.executeQuery(sql);		//5step : 실행
		
		ArrayList<TelephoneVO> list = new ArrayList<TelephoneVO>();
		if(rs.next()) {		//data가 있다면 next 됨
			do{					//위에서 rs.next()한번 했으므로 첫번째 줄에 커서 위치... 첫번째 줄부터 실행하기 위해 do while로 실행.
				TelephoneVO telephone = new TelephoneVO(rs.getInt("kind"),
																rs.getString("tel"), rs.getString("name"),
																rs.getInt("quantity"), rs.getInt("defaultfee"),
																rs.getInt("fee"), rs.getInt("tax"),
																rs.getInt("total"));
				telephone.setSeq(rs.getInt("seq"));
				list.add(telephone);		//담기.
			}while(rs.next());			//다음에 담을 것 있으면 21행으로.
		}else {		//data 없으면 next 안됨.
			list = null;
		}
		
		DBClose.close(conn, stmt);		//6step
		return list;
	}
	
	public static String getCurrentDate() throws SQLException {
		Connection conn = DBConnection.getConnection();	//2, 3 step	//Apache의 DBCP로 돌아가는 Connection
		Statement stmt = conn.createStatement();		//4step.		
		String sql = "SELECT DATE_FORMAT(Now(), '%Y-%m-%d %T')";			//MariaDB에서 지금 날짜 : Now()
		ResultSet rs = stmt.executeQuery(sql);		//5step : 실행해서 rs에 담기.
		rs.next();	
		String date = rs.getString(1);
		
		DBClose.close(conn, stmt);		//6step
		return date;
	}
	
	public static int insert(TelephoneVO telephone) throws SQLException {
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO Telephone(kind, tel, name, quantity, defaultFee, fee, tax, total) "
								+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);		//불완전한 SQL문장.
		pstmt.setInt(1, telephone.getKind());
		pstmt.setString(2, telephone.getTel());
		pstmt.setString(3, telephone.getName());
		pstmt.setInt(4, telephone.getQuantity());
		pstmt.setInt(5, telephone.getDefaultFee());
		pstmt.setInt(6, telephone.getFee());
		pstmt.setInt(7, telephone.getTax());
		pstmt.setInt(8, telephone.getTotal());
		
		//실행
		int row = pstmt.executeUpdate();		//INSERT이므로 executeUpdate().		
		DBClose.close(conn, pstmt);
		return row;
	}
	
}
