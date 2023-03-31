package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="emp_family")
public class Employee_Family {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer id;
	private String emp_code;
	private String per_name;
	private String relation;
	private String dob;
	private String dependency;
	
	
	public Employee_Family() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Employee_Family(Integer id, String emp_code, String per_name, String relation, String dob,
			String dependency) {
		super();
		this.id = id;
		this.emp_code = emp_code;
		this.per_name = per_name;
		this.relation = relation;
		this.dob = dob;
		this.dependency = dependency;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getEmp_code() {
		return emp_code;
	}


	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}


	public String getPer_name() {
		return per_name;
	}


	public void setPer_name(String per_name) {
		this.per_name = per_name;
	}


	public String getRelation() {
		return relation;
	}


	public void setRelation(String relation) {
		this.relation = relation;
	}


	public String getDob() {
		return dob;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public String getDependency() {
		return dependency;
	}


	public void setDependency(String dependency) {
		this.dependency = dependency;
	}


	@Override
	public String toString() {
		return "Employee_Family [id=" + id + ", emp_code=" + emp_code + ", per_name=" + per_name + ", relation="
				+ relation + ", dob=" + dob + ", dependency=" + dependency + "]";
	}
	
	
	
	
	
	
}
