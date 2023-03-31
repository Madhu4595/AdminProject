package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bills_upload")
public class Bills_Upload {
	@Id
	private Integer request_no;
	private String amount_approved;
	private String amount_claimed;
	private String bill_date;
	private String bill_no;
	private String card_no;
	private String disease_name;
	private String doctor_name;
	private String emp_code;
	private String hospital_name;
	private String lab_name;
	private String patient_name;
	private String period_of_treatment;
	private String remarks;
	private String type;
	
	public Bills_Upload() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Bills_Upload(Integer request_no, String amount_approved, String amount_claimed, String bill_date,
			String bill_no, String card_no, String disease_name, String doctor_name, String emp_code,
			String hospital_name, String lab_name, String patient_name, String period_of_treatment, String remarks,
			String type) {
		super();
		this.request_no = request_no;
		this.amount_approved = amount_approved;
		this.amount_claimed = amount_claimed;
		this.bill_date = bill_date;
		this.bill_no = bill_no;
		this.card_no = card_no;
		this.disease_name = disease_name;
		this.doctor_name = doctor_name;
		this.emp_code = emp_code;
		this.hospital_name = hospital_name;
		this.lab_name = lab_name;
		this.patient_name = patient_name;
		this.period_of_treatment = period_of_treatment;
		this.remarks = remarks;
		this.type = type;
	}

	public Integer getRequest_no() {
		return request_no;
	}

	public void setRequest_no(Integer request_no) {
		this.request_no = request_no;
	}

	public String getAmount_approved() {
		return amount_approved;
	}

	public void setAmount_approved(String amount_approved) {
		this.amount_approved = amount_approved;
	}

	public String getAmount_claimed() {
		return amount_claimed;
	}

	public void setAmount_claimed(String amount_claimed) {
		this.amount_claimed = amount_claimed;
	}

	public String getBill_date() {
		return bill_date;
	}

	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}

	public String getBill_no() {
		return bill_no;
	}

	public void setBill_no(String bill_no) {
		this.bill_no = bill_no;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	public String getDisease_name() {
		return disease_name;
	}

	public void setDisease_name(String disease_name) {
		this.disease_name = disease_name;
	}

	public String getDoctor_name() {
		return doctor_name;
	}

	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}

	public String getEmp_code() {
		return emp_code;
	}

	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}

	public String getLab_name() {
		return lab_name;
	}

	public void setLab_name(String lab_name) {
		this.lab_name = lab_name;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

	public String getPeriod_of_treatment() {
		return period_of_treatment;
	}

	public void setPeriod_of_treatment(String period_of_treatment) {
		this.period_of_treatment = period_of_treatment;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Bills_Upload [request_no=" + request_no + ", amount_approved=" + amount_approved + ", amount_claimed="
				+ amount_claimed + ", bill_date=" + bill_date + ", bill_no=" + bill_no + ", card_no=" + card_no
				+ ", disease_name=" + disease_name + ", doctor_name=" + doctor_name + ", emp_code=" + emp_code
				+ ", hospital_name=" + hospital_name + ", lab_name=" + lab_name + ", patient_name=" + patient_name
				+ ", period_of_treatment=" + period_of_treatment + ", remarks=" + remarks + ", type=" + type + "]";
	}

	
	
	
}
