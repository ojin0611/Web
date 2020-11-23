package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.MemberDao;
import com.example.libs.model.MemberVO;

public class UpdateService {
	public int updateMember(MemberVO member) {
		int row = -1;
		try {
			row = MemberDao.update(member);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
