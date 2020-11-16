package com.example.libs.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.example.libs.model.DBClose;
import com.example.libs.model.DBConnection;
import com.example.libs.model.EmployeeVO;
import com.example.libs.model.EmployeeDAO;

public class CalcService {
	
	public void calc(EmployeeVO employee){
		int gibon = employee.getHobong() * 10000;  //기본급
		employee.setGibon(gibon);
		int nightmoney = employee.getNight() * 15000;  //야근수당
		employee.setNightmoney(nightmoney);
		int familymoney = employee.getFamily() * 15000;  //가족수당
		employee.setFamilymoney(familymoney);
		String sabun = employee.getSabun();
		int money = 0;
		try{
			String department = EmployeeDAO.select_get_dname(sabun.charAt(0));
			employee.setDepartment(department);
			money = EmployeeDAO.select_get_money(sabun.charAt(1));
			employee.setMoney(money);
		}catch(SQLException ex){
			System.out.println(ex);
		}
		int salary = gibon + nightmoney + familymoney + money;  //총지급액
		employee.setSalary(salary);
		int tax = (int)(salary * 0.1);  //소득세
		employee.setTax(tax);
		int sum = salary - tax;  //실수령액
		employee.setSum(sum);
	}
}
