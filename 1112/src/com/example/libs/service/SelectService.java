package com.example.libs.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.example.libs.model.TelephoneDao;
import com.example.libs.model.TelephoneVO;

public class SelectService {
	
	public ArrayList<TelephoneVO> selectTelephone() {
		ArrayList<TelephoneVO> list = null;
		try {
			list = TelephoneDao.select();		//model의 select()로부터 list받아옴.
		} catch (SQLException e) {
			System.out.println(e);
		}			
		return list;
	}
	
	public String getCurrentDate() {
		String date = null;
		try {
			date = TelephoneDao.getCurrentDate();		//TelephoneDao에서 SQLException을 이쪽으로 던졌으므로, 여기서 try catch로 받아야함.
		} catch (SQLException e) {
			System.out.println(e);
		}
		return date;
	}
	
}
