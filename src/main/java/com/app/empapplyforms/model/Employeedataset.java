package com.app.empapplyforms.model;

public class Employeedataset {

	private String employeeName;
	private String empCode;
	private String designation;
	private String office;
	private String spouse;
	
	public Employeedataset() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Employeedataset(String employeeName, String empCode, String designation, String office, String spouse) {
		super();
		this.employeeName = employeeName;
		this.empCode = empCode;
		this.designation = designation;
		this.office = office;
		this.spouse = spouse;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public String getSpouse() {
		return spouse;
	}
	public void setSpouse(String spouse) {
		this.spouse = spouse;
	}
	
}
