package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.jdbc.OracleTypes;

public class EmployeeDAO {
	public static int insert(EmployeeVO employee) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{call employee_insert(?,?,?,?,?,?,?,?,?,?,?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, employee.getSabun());
		cstmt.setInt(2, employee.getHobong());
		cstmt.setInt(3, employee.getNight());
		cstmt.setInt(4, employee.getFamily());
		cstmt.setInt(5, employee.getGibon());
		cstmt.setInt(6, employee.getMoney());
		cstmt.setInt(7, employee.getNightmoney());
		cstmt.setInt(8, employee.getFamilymoney());
		cstmt.setInt(9, employee.getSalary());
		cstmt.setInt(10, employee.getTax());
		cstmt.setInt(11, employee.getSum());
		String code = employee.getSabun().trim().substring(0, 1); //"C"
		cstmt.setString(12, code);
		int row = cstmt.executeUpdate();
		DBClose.close(conn, cstmt);
		return row;
	}
	public static int select_get_money(char grade) 	throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{call select_get_money(?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, String.valueOf(grade));
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();
		int money = rs.getInt(1);
		DBClose.close(conn, cstmt, rs);
		return money;
	}
	public static String select_get_dname(char code) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{call select_get_dname(?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, String.valueOf(code));
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();
		String dname = rs.getString(1);
		DBClose.close(conn, cstmt, rs);
		return dname;
	}
	public static Vector<EmployeeVO> select_all() throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{call employee_all_select(?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.registerOutParameter(1, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(1);
		Vector<EmployeeVO> vector = new Vector<EmployeeVO>(1,1);
		if(!rs.next()){   //레코드가 한 개도 없다면
			vector = null;
		}else{  //레코드가 있다면
			do{
				EmployeeVO employee = new EmployeeVO();
				employee.setSabun(rs.getString("sabun"));
				employee.setDepartment(rs.getString("dname"));
				employee.setGibon(rs.getInt("gibon"));
				employee.setMoney(rs.getInt("money"));
				employee.setNightmoney(rs.getInt("nightmoney"));
				employee.setFamilymoney(rs.getInt("familymoney"));
				employee.setSalary(rs.getInt("salary"));
				employee.setTax(rs.getInt("tax"));
				employee.setSum(rs.getInt("sum"));
				vector.addElement(employee);
			}while(rs.next());
		}
		DBClose.close(conn, cstmt, rs);
		return vector;
	}
}