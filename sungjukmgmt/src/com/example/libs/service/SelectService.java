package com.example.libs.service;

import java.sql.SQLException;  
import java.util.ArrayList;

import com.example.libs.model.StudentVO;
import com.example.libs.model.SungjukMgmtDao;

public class SelectService {
	
	public ArrayList<StudentVO> selectAll(){
		ArrayList<StudentVO> list = null;
		try {
			list = SungjukMgmtDao.select();
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return list;
	}
	
	public StudentVO select(String hakbun) {
		StudentVO student = null;
		try {
			student = SungjukMgmtDao.selectOne(hakbun);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return student;
	}
}




