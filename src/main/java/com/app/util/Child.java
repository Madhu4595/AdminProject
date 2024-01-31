package com.app.util;


public class Child {
	
	private long slno;
	private String sequence;
	private String name;
	private String dob;
	private String age;
	
	public Child() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Child(long slno, String sequence, String name, String dob, String age) {
		super();
		this.slno = slno;
		this.sequence = sequence;
		this.name = name;
		this.dob = dob;
		this.age = age;
	}
	public long getSlno() {
		return slno;
	}
	public void setSlno(long slno) {
		this.slno = slno;
	}
	public String getSequence() {
		return sequence;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}

}

