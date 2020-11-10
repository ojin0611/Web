package com.example.libs.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.example.libs.model.StudentVO;
import com.example.libs.model.SungjukMgmtDao;

public class SelectService {
	private String path;   //property

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	public ArrayList<StudentVO> selectAll(){
		ArrayList<StudentVO> list = null;
		try {
			list = SungjukMgmtDao.select(this.path);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return list;
	}
}
