package com.example.libs;

public class Member {
	private String name;    //property
	private int age;
	private boolean flag;
	
	
	/*
	 * public Member(String name, int age) { this.name = name; this.age = age; }
	 */
	
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
