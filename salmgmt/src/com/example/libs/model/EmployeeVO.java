package com.example.libs.model;

public class EmployeeVO {
	private String sabun; 
	private int hobong;
	private int night;
	private int family;
	private int gibon;
	private int money;
	private int nightmoney;
	private int familymoney;
	private int salary;
	private int tax;
	private int sum;
	private String department;
	
	public EmployeeVO(){}
	public EmployeeVO(String sabun, int hobong, int night, int family) {
		this.sabun = sabun;
		this.hobong = hobong;
		this.night = night;
		this.family = family;
	}
	public String getSabun() {
		return sabun;
	}
	public void setSabun(String sabun) {
		this.sabun = sabun;
	}
	public int getHobong() {
		return hobong;
	}
	public void setHobong(int hobong) {
		this.hobong = hobong;
	}
	public int getNight() {
		return night;
	}
	public void setNight(int night) {
		this.night = night;
	}
	public int getFamily() {
		return family;
	}
	public void setFamily(int family) {
		this.family = family;
	}
	public int getGibon() {
		return gibon;
	}
	public void setGibon(int gibon) {
		this.gibon = gibon;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getNightmoney() {
		return nightmoney;
	}
	public void setNightmoney(int nightmoney) {
		this.nightmoney = nightmoney;
	}
	public int getFamilymoney() {
		return familymoney;
	}
	public void setFamilymoney(int familymoney) {
		this.familymoney = familymoney;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	} 
}
