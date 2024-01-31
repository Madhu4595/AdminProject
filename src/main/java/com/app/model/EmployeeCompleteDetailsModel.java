package com.app.model;

import java.util.List;

public class EmployeeCompleteDetailsModel {

	private String code;
	private String name;
	private String designation;
	private String basic_pay;
	private String place;
	private String email;
	private String date_of_retirement;
	private String dob;
	private String payscale;
	private String callSign;
	private String ecghsCode;
	private String phno;
	private String address;
	private String wardEntitlement;
	private String doj;
	private String doa;
	
	private List<Employee_Family> family;

	public EmployeeCompleteDetailsModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmployeeCompleteDetailsModel(String code, String name, String designation, String basic_pay, String place,
			String email, String date_of_retirement, String dob, String payscale, String callSign, String ecghsCode,
			String phno, String address, String wardEntitlement, String doj, String doa, List<Employee_Family> family) {
		super();
		this.code = code;
		this.name = name;
		this.designation = designation;
		this.basic_pay = basic_pay;
		this.place = place;
		this.email = email;
		this.date_of_retirement = date_of_retirement;
		this.dob = dob;
		this.payscale = payscale;
		this.callSign = callSign;
		this.ecghsCode = ecghsCode;
		this.phno = phno;
		this.address = address;
		this.wardEntitlement = wardEntitlement;
		this.doj = doj;
		this.doa = doa;
		this.family = family;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getBasic_pay() {
		return basic_pay;
	}

	public void setBasic_pay(String basic_pay) {
		this.basic_pay = basic_pay;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate_of_retirement() {
		return date_of_retirement;
	}

	public void setDate_of_retirement(String date_of_retirement) {
		this.date_of_retirement = date_of_retirement;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPayscale() {
		return payscale;
	}

	public void setPayscale(String payscale) {
		this.payscale = payscale;
	}

	public String getCallSign() {
		return callSign;
	}

	public void setCallSign(String callSign) {
		this.callSign = callSign;
	}

	public String getEcghsCode() {
		return ecghsCode;
	}

	public void setEcghsCode(String ecghsCode) {
		this.ecghsCode = ecghsCode;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWardEntitlement() {
		return wardEntitlement;
	}

	public void setWardEntitlement(String wardEntitlement) {
		this.wardEntitlement = wardEntitlement;
	}

	public String getDoj() {
		return doj;
	}

	public void setDoj(String doj) {
		this.doj = doj;
	}

	public String getDoa() {
		return doa;
	}

	public void setDoa(String doa) {
		this.doa = doa;
	}

	public List<Employee_Family> getFamily() {
		return family;
	}

	public void setFamily(List<Employee_Family> family) {
		this.family = family;
	}

	@Override
	public String toString() {
		return "EmployeeCompleteDetailsModel [code=" + code + ", name=" + name + ", designation=" + designation
				+ ", basic_pay=" + basic_pay + ", place=" + place + ", email=" + email + ", date_of_retirement="
				+ date_of_retirement + ", dob=" + dob + ", payscale=" + payscale + ", callSign=" + callSign
				+ ", ecghsCode=" + ecghsCode + ", phno=" + phno + ", address=" + address + ", wardEntitlement="
				+ wardEntitlement + ", doj=" + doj + ", doa=" + doa + ", family=" + family + "]";
	}

}
