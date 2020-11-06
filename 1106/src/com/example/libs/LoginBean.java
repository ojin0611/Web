package com.example.libs;

public class LoginBean {
	private String userid;
	private String userpwd;
	
	public LoginBean() {
		this.userid = "jimin";
		this.userpwd = "1234567";
	}

	public String getUserid() {
		return userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

}
