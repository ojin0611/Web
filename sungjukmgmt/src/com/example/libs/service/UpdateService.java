package com.example.libs.service;

import java.sql.SQLException;  

import com.example.libs.model.StudentVO;
import com.example.libs.model.SungjukMgmtDao;

public class UpdateService {
	
	public int updateStudent(StudentVO student) {
		int row = 0;
		try {
			row = SungjukMgmtDao.update(student);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return row;
	}
}
