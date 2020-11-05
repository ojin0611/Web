package com.example.libs;

public class LoginBean{
	private String userid;
	private String userpwd;
	
	public LoginBean() {}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	@Override
	public String toString() {
		return "LoginBean [userid=" + userid + ", userpwd=" + userpwd + "]";
	}
	
	
}
