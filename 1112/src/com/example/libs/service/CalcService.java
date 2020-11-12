package com.example.libs.service;

import com.example.libs.model.TelephoneVO;

public class CalcService {
	
	public void calc(TelephoneVO telephone) {
		switch(telephone.getKind()) {			//VO의 메소드 이용해서 kind값 가져옴.
			case 1 : telephone.setDefaultFee(6000);		break;
			case 2 : telephone.setDefaultFee(4800);		break;
			case 3 : telephone.setDefaultFee(3000);		break;
		}
		int fee = telephone.getQuantity() * 12;		//통화료 = 통화량 * 12
		int tax = (int)((telephone.getDefaultFee() + fee) * 0.1);		//세금 = (기본요금 + 통화료) * 0.1
		int total = telephone.getDefaultFee() + fee + tax;		//총합 = 기본요금 + 통화료 + 세금
		//위에서 계산된 값을 setting.
		telephone.setFee(fee);
		telephone.setTax(tax);
		telephone.setTotal(total);
	}

}