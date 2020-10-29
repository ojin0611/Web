package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.CityDao;

public class InsertService {

	public static int insertMember(String username, int age, String gender, String hobby, String city) {
		int row = 0;
		try {
			row = CityDao.insertMember(username, age, gender, hobby, city);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return row;
	}

}
