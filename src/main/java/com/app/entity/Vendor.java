package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vendor_master")
public class Vendor {
 
	@Id
	private String code;
	private String name;
	private String pan_no;
	private String bank_acno;
	private String ifsc_code;
	private String address;
	private String gst_no;
	private String bank_name;
	private String bank_address;
	
	
	public Vendor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Vendor(String code, String name, String pan_no, String bank_acno, String ifsc_code,
			String address, String gst_no, String bank_name, String bank_address) {
		super();
		 
		this.code = code;
		this.name = name;
		this.pan_no = pan_no;
		this.bank_acno = bank_acno;
		this.ifsc_code = ifsc_code;
		this.address = address;
		this.gst_no = gst_no;
		this.bank_name = bank_name;
		this.bank_address = bank_address;
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


	public String getPan_no() {
		return pan_no;
	}


	public void setPan_no(String pan_no) {
		this.pan_no = pan_no;
	}


	public String getBank_acno() {
		return bank_acno;
	}


	public void setBank_acno(String bank_acno) {
		this.bank_acno = bank_acno;
	}


	public String getIfsc_code() {
		return ifsc_code;
	}


	public void setIfsc_code(String ifsc_code) {
		this.ifsc_code = ifsc_code;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getGst_no() {
		return gst_no;
	}


	public void setGst_no(String gst_no) {
		this.gst_no = gst_no;
	}


	public String getBank_name() {
		return bank_name;
	}


	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}


	public String getBank_address() {
		return bank_address;
	}


	public void setBank_address(String bank_address) {
		this.bank_address = bank_address;
	}

	@Override
	public String toString() {
		return "Vendor [code=" + code + ", name=" + name + ", pan_no=" + pan_no + ", bank_acno=" + bank_acno
				+ ", ifsc_code=" + ifsc_code + ", address=" + address + ", gst_no=" + gst_no + ", bank_name="
				+ bank_name + ", bank_address=" + bank_address + "]";
	}


	 

	

}
