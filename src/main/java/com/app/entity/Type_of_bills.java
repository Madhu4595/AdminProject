package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="type_of_bills")
public class Type_of_bills {

	@Id
	private Integer tid;
	private String name;
	public Type_of_bills() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Type_of_bills(Integer tid, String name) {
		super();
		this.tid = tid;
		this.name = name;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Type_of_billss [tid=" + tid + ", name=" + name + "]";
	}
	
	
	
}
