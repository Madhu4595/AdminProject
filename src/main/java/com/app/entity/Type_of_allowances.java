package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="type_of_allowances")
public class Type_of_allowances {
	@Id
	private Integer id;
	private String name;
	private Integer type;
	
	public Type_of_allowances() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Type_of_allowances(Integer id, String name, Integer type) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Type_of_allowances [id=" + id + ", name=" + name + ", type=" + type + "]";
	}
	

}
