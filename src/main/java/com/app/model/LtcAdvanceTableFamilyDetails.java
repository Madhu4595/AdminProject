package com.app.model;

public class LtcAdvanceTableFamilyDetails {
	
	private int sno;
	private String per_name;
	private String age;
	private String relation;
	public LtcAdvanceTableFamilyDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LtcAdvanceTableFamilyDetails(int sno, String per_name, String age, String relation) {
		super();
		this.sno = sno;
		this.per_name = per_name;
		this.age = age;
		this.relation = relation;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getPer_name() {
		return per_name;
	}
	public void setPer_name(String per_name) {
		this.per_name = per_name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	@Override
	public String toString() {
		return "LtcAdvanceTableFamilyDetails [sno=" + sno + ", per_name=" + per_name + ", age=" + age + ", relation="
				+ relation + "]";
	}
	
	
	

}
