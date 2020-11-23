package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.MemberDao;

public class DeleteService {
	public int deleteMember(String userid) {
		int row = -1;
		try {
			row = MemberDao.delete(userid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
