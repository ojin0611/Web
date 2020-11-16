package com.example.libs.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.example.libs.model.DBClose;
import com.example.libs.model.DBConnection;
import com.example.libs.model.EmployeeVO;
import com.example.libs.model.EmployeeDAO;

public class InsertService {
	private CalcService calc;
	public InsertService() {
		this.calc = new CalcService();
	}
	
	public int insert(EmployeeVO employee){
		int row = 0;
		try{
			this.calc.calc(employee);
			row = EmployeeDAO.insert(employee);
		}catch(SQLException ex){
			System.out.println(ex);
		}
		return row;
	}
}
