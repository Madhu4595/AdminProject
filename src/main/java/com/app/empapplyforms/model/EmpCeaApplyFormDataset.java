package com.app.empapplyforms.model;

public class EmpCeaApplyFormDataset {

	private String colOne;
	private String colTwo;
	private String colThree;
	public EmpCeaApplyFormDataset() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmpCeaApplyFormDataset(String colOne, String colTwo, String colThree) {
		super();
		this.colOne = colOne;
		this.colTwo = colTwo;
		this.colThree = colThree;
	}
	public String getColOne() {
		return colOne;
	}
	public void setColOne(String colOne) {
		this.colOne = colOne;
	}
	public String getColTwo() {
		return colTwo;
	}
	public void setColTwo(String colTwo) {
		this.colTwo = colTwo;
	}
	public String getColThree() {
		return colThree;
	}
	public void setColThree(String colThree) {
		this.colThree = colThree;
	}
	@Override
	public String toString() {
		return "EmpCeaApplyFormDataset [colOne=" + colOne + ", colTwo=" + colTwo + ", colThree=" + colThree + "]";
	}
	
	
}
