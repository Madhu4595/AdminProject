package com.app.entity;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

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
	private String cghsCode;
	@Column(length = 1000)
	private byte[] cghsPhoto;
	
	@Transient
	private String familyCghsPhoto;
	
	
	public Employee_Family() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Employee_Family(Integer id, String emp_code, String per_name, String relation, String dob, String dependency,
			String cghsCode, byte[] cghsPhoto, String familyCghsPhoto) {
		super();
		this.id = id;
		this.emp_code = emp_code;
		this.per_name = per_name;
		this.relation = relation;
		this.dob = dob;
		this.dependency = dependency;
		this.cghsCode = cghsCode;
		this.cghsPhoto = cghsPhoto;
		this.familyCghsPhoto = familyCghsPhoto;
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


	public String getCghsCode() {
		return cghsCode;
	}


	public void setCghsCode(String cghsCode) {
		this.cghsCode = cghsCode;
	}


	public byte[] getCghsPhoto() {
		return cghsPhoto;
	}


	public void setCghsPhoto(byte[] cghsPhoto) {
		this.cghsPhoto = cghsPhoto;
	}


	public String getFamilyCghsPhoto() {
		return familyCghsPhoto;
	}


	public void setFamilyCghsPhoto(String familyCghsPhoto) {
		this.familyCghsPhoto = familyCghsPhoto;
	}


	@Override
	public String toString() {
		return "Employee_Family [id=" + id + ", emp_code=" + emp_code + ", per_name=" + per_name + ", relation="
				+ relation + ", dob=" + dob + ", dependency=" + dependency + ", cghsCode=" + cghsCode + ", cghsPhoto="
				+ Arrays.toString(cghsPhoto) + ", familyCghsPhoto=" + familyCghsPhoto + "]";
	}





}
