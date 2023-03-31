package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="medical_bills_upload")
public class Medical_Bills_upload {
	@Id
	private Integer 	request_no;
	private String 		type;
	private String 		card_no;
	private String 		doctor_name;
	private String 		disease_name;
	private String 		hospital_name;
	private String 		patient_name;
	private String 		bill_date;
	private String 	    amount_claimed;
	private String 		lab_name;
	private String 		emp_code;
	private String 		bill_no;
	private String  	amount_approved;
	private String 		period_of_treatment;
	private String 		remarks;
	private String		medical_date;
	private String		status;
	private String		siodate;
	private String		so_no;
	private String		so_date;
	
	private String totAmountClaimed;
	private String totAmountApproved;
	
	public Medical_Bills_upload() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Medical_Bills_upload(Integer request_no, String type, String card_no, String doctor_name,
			String disease_name, String hospital_name, String patient_name, String bill_date, String amount_claimed,
			String lab_name, String emp_code, String bill_no, String amount_approved, String period_of_treatment,
			String remarks, String medical_date, String status, String siodate, String so_no, String so_date,String totAmountClaimed
			,String totAmountApproved) {
		super();
		this.request_no = request_no;
		this.type = type;
		this.card_no = card_no;
		this.doctor_name = doctor_name;
		this.disease_name = disease_name;
		this.hospital_name = hospital_name;
		this.patient_name = patient_name;
		this.bill_date = bill_date;
		this.amount_claimed = amount_claimed;
		this.lab_name = lab_name;
		this.emp_code = emp_code;
		this.bill_no = bill_no;
		this.amount_approved = amount_approved;
		this.period_of_treatment = period_of_treatment;
		this.remarks = remarks;
		this.medical_date = medical_date;
		this.status = status;
		this.siodate = siodate;
		this.so_no = so_no;
		this.so_date = so_date;
		this.totAmountClaimed = totAmountClaimed;
		this.totAmountApproved = totAmountApproved;
	}

	
	public String getTotAmountClaimed() {
		return totAmountClaimed;
	}

	public void setTotAmountClaimed(String totAmountClaimed) {
		this.totAmountClaimed = totAmountClaimed;
	}

	public String getTotAmountApproved() {
		return totAmountApproved;
	}

	public void setTotAmountApproved(String totAmountApproved) {
		this.totAmountApproved = totAmountApproved;
	}

	public Integer getRequest_no() {
		return request_no;
	}

	public void setRequest_no(Integer request_no) {
		this.request_no = request_no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	public String getDoctor_name() {
		return doctor_name;
	}

	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}

	public String getDisease_name() {
		return disease_name;
	}

	public void setDisease_name(String disease_name) {
		this.disease_name = disease_name;
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

	public String getBill_date() {
		return bill_date;
	}

	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}

	public String getAmount_claimed() {
		return amount_claimed;
	}

	public void setAmount_claimed(String amount_claimed) {
		this.amount_claimed = amount_claimed;
	}

	public String getLab_name() {
		return lab_name;
	}

	public void setLab_name(String lab_name) {
		this.lab_name = lab_name;
	}

	public String getEmp_code() {
		return emp_code;
	}

	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}

	public String getBill_no() {
		return bill_no;
	}

	public void setBill_no(String bill_no) {
		this.bill_no = bill_no;
	}

	public String getAmount_approved() {
		return amount_approved;
	}

	public void setAmount_approved(String amount_approved) {
		this.amount_approved = amount_approved;
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

	public String getMedical_date() {
		return medical_date;
	}

	public void setMedical_date(String medical_date) {
		this.medical_date = medical_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSiodate() {
		return siodate;
	}

	public void setSiodate(String siodate) {
		this.siodate = siodate;
	}

	public String getSo_no() {
		return so_no;
	}

	public void setSo_no(String so_no) {
		this.so_no = so_no;
	}

	public String getSo_date() {
		return so_date;
	}

	public void setSo_date(String so_date) {
		this.so_date = so_date;
	}

	@Override
	public String toString() {
		return "Medical_Bills_upload [request_no=" + request_no + ", type=" + type + ", card_no=" + card_no
				+ ", doctor_name=" + doctor_name + ", disease_name=" + disease_name + ", hospital_name=" + hospital_name
				+ ", patient_name=" + patient_name + ", bill_date=" + bill_date + ", amount_claimed=" + amount_claimed
				+ ", lab_name=" + lab_name + ", emp_code=" + emp_code + ", bill_no=" + bill_no + ", amount_approved="
				+ amount_approved + ", period_of_treatment=" + period_of_treatment + ", remarks=" + remarks
				+ ", medical_date=" + medical_date + ", status=" + status + ", siodate=" + siodate + ", so_no=" + so_no
				+ ", so_date=" + so_date + ", totAmountClaimed=" + totAmountClaimed + ", totAmountApproved="
				+ totAmountApproved + "]";
	}

	
}
