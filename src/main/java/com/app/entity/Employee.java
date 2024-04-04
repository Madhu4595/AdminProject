package com.app.entity;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee_master")
public class Employee {
	@Id
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
	
	@Column(length = 1000)
	private byte[] empPhoto;
	
	@Column(length = 1000)
	private byte[] empCghsPhoto;
	
	private String phno;
	private String address;
	
	private String wardEntitlement;
	
	private String doj;
	private String doa;
	private String gpfaccno;
	
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee(String code, String name, String designation, String basic_pay, String place, String email,
			String date_of_retirement, String dob, String payscale, String callSign, String ecghsCode, byte[] empPhoto,
			byte[] empCghsPhoto, String phno, String address, String wardEntitlement, String doj, String doa,
			String gpfaccno) {
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
		this.empPhoto = empPhoto;
		this.empCghsPhoto = empCghsPhoto;
		this.phno = phno;
		this.address = address;
		this.wardEntitlement = wardEntitlement;
		this.doj = doj;
		this.doa = doa;
		this.gpfaccno = gpfaccno;
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

	public byte[] getEmpPhoto() {
		return empPhoto;
	}

	public void setEmpPhoto(byte[] empPhoto) {
		this.empPhoto = empPhoto;
	}

	public byte[] getEmpCghsPhoto() {
		return empCghsPhoto;
	}

	public void setEmpCghsPhoto(byte[] empCghsPhoto) {
		this.empCghsPhoto = empCghsPhoto;
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

	public String getGpfaccno() {
		return gpfaccno;
	}

	public void setGpfaccno(String gpfaccno) {
		this.gpfaccno = gpfaccno;
	}

	@Override
	public String toString() {
		return "Employee [code=" + code + ", name=" + name + ", designation=" + designation + ", basic_pay=" + basic_pay
				+ ", place=" + place + ", email=" + email + ", date_of_retirement=" + date_of_retirement + ", dob="
				+ dob + ", payscale=" + payscale + ", callSign=" + callSign + ", ecghsCode=" + ecghsCode + ", empPhoto="
				+ Arrays.toString(empPhoto) + ", empCghsPhoto=" + Arrays.toString(empCghsPhoto) + ", phno=" + phno
				+ ", address=" + address + ", wardEntitlement=" + wardEntitlement + ", doj=" + doj + ", doa=" + doa
				+ ", gpfaccno=" + gpfaccno + "]";
	}

}
