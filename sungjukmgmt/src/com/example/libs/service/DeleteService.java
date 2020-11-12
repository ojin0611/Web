package com.example.libs.service;

import java.sql.SQLException;  

import com.example.libs.model.SungjukMgmtDao;

public class DeleteService {
	
	public int deleteStudent(String hakbun) {
		int row = 0;
		try {
			row = SungjukMgmtDao.delete(hakbun);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return row;
	}
}
