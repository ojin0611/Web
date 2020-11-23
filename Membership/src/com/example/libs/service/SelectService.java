package com.example.libs.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.example.libs.model.MemberDao;
import com.example.libs.model.MemberVO;

public class SelectService {
	public int loginMember(String userid, String passwd) {
		int key = -2;
		try {
			key = MemberDao.login(userid, passwd);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return key;
	}
	
	public MemberVO selectMember(String userid) {
		MemberVO member = null;
		try {
			member = MemberDao.select(userid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return member;
	}
	
	public ArrayList<MemberVO> selectAll(){
		ArrayList<MemberVO> list = null;
		try {
			list = MemberDao.selectAll();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return list;
	}
}
