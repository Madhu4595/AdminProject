package com.app.dto;


public class AuthenticationRequest {

	private String username,password,loginType;
	 

	public AuthenticationRequest() {
		super();
	}


	public AuthenticationRequest(String username, String password, String loginType) {
		super();
		this.username = username;
		this.password = password;
		this.loginType = loginType;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getLoginType() {
		return loginType;
	}


	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}


	@Override
	public String toString() {
		return "AuthenticationRequest [username=" + username + ", password=" + password + ", loginType=" + loginType
				+ "]";
	}

	 
	
}
