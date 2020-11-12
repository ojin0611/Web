package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.TelephoneDao;
import com.example.libs.model.TelephoneVO;

public class InsertService {

	private CalcService calc;
	
	public InsertService() {				//기본 생성자 호출하면 calc만들게끔.
		this.calc = new CalcService();		
	}
	
	public int insertTelephone(TelephoneVO telephone) {		//jsp에서 telephone받음.
		int row = 0;
		try {
			calc.calc(telephone);	//미리 계산.		//계산 후, insert해야함.
			row = TelephoneDao.insert(telephone);		//계산 된 값을 dao에 넣고, 반환받음.
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
	}
	
}