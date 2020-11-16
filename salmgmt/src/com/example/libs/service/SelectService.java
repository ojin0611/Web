package com.example.libs.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import com.example.libs.model.DBClose;
import com.example.libs.model.DBConnection;
import com.example.libs.model.EmployeeVO;
import com.example.libs.model.EmployeeDAO;

public class SelectService {
	
	public Vector<EmployeeVO> select_all(){
		Vector<EmployeeVO> vector = null;
		try{
			vector = EmployeeDAO.select_all();
		}catch(SQLException ex){
			System.out.println(ex);
		}
		return vector;
	}
}










