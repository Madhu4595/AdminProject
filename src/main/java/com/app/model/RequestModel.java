package com.app.model;

public class RequestModel {

	private String username;
	private String doj;
	
	public RequestModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RequestModel(String username, String doj) {
		super();
		this.username = username;
		this.doj = doj;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	@Override
	public String toString() {
		return "RequestModel [username=" + username + ", doj=" + doj + "]";
	}
	
	
}
