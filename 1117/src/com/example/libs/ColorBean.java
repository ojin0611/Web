package com.example.libs;

public class ColorBean {
	private String username;
	private String color;
	
	public ColorBean() {   //Default Constructor's Overriding
		this.username = "Unknown";
		this.color = "black";
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	
}
