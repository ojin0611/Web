package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.MemberDao;
import com.example.libs.model.MemberVO;

public class InsertService {
	public int insertMember(MemberVO member) {
		int row = -1;
		try {
			row = MemberDao.register(member);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
