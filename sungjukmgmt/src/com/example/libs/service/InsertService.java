package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.StudentVO;
import com.example.libs.model.SungjukMgmtDao;  
public class InsertService {  
	
	public int insertStudent(StudentVO student) {
		int row = 0;
		try {
			row = SungjukMgmtDao.insert(student);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return row;
	}
}
