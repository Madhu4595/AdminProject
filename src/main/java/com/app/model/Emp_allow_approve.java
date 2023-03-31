package com.app.model;

public class Emp_allow_approve {
	
	private String request_no;
	private String amount_approve1;
	private String amount_approve2;
	private String  amount_approve;
	public Emp_allow_approve() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp_allow_approve(String request_no, String amount_approve1, String amount_approve2, String amount_approve) {
		super();
		this.request_no = request_no;
		this.amount_approve1 = amount_approve1;
		this.amount_approve2 = amount_approve2;
		this.amount_approve = amount_approve;
	}
	public String getRequest_no() {
		return request_no;
	}
	public void setRequest_no(String request_no) {
		this.request_no = request_no;
	}
	public String getAmount_approve1() {
		return amount_approve1;
	}
	public void setAmount_approve1(String amount_approve1) {
		this.amount_approve1 = amount_approve1;
	}
	public String getAmount_approve2() {
		return amount_approve2;
	}
	public void setAmount_approve2(String amount_approve2) {
		this.amount_approve2 = amount_approve2;
	}
	public String getAmount_approve() {
		return amount_approve;
	}
	public void setAmount_approve(String amount_approve) {
		this.amount_approve = amount_approve;
	}
	@Override
	public String toString() {
		return "Emp_allow_approve [request_no=" + request_no + ", amount_approve1=" + amount_approve1
				+ ", amount_approve2=" + amount_approve2 + ", amount_approve=" + amount_approve + "]";
	}
	
	

}
