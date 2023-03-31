package com.app.entity;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="accounts_head")
public class AccountHead {
	@Id
	private String id;
	private String name;
	private String id1;
	public AccountHead() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AccountHead(String id, String name, String id1) {
		super();
		this.id = id;
		this.name = name;
		this.id1 = id1;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId1() {
		return id1;
	}
	public void setId1(String id1) {
		this.id1 = id1;
	}
	@Override
	public String toString() {
		return "AccountHead [id=" + id + ", name=" + name + ", id1=" + id1 + "]";
	}
	
}

