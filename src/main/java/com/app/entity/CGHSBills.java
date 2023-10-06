package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="cghs_bills")
public class CGHSBills {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cghsBillsId;
	
	private String type;
	private String billNo;
	private String date;
	private String amount;
	private String doctorName;
	private String hospitalName;
	public CGHSBills() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CGHSBills(Long cghsBillsId, String type, String billNo, String date, String amount, String doctorName,
			String hospitalName) {
		super();
		this.cghsBillsId = cghsBillsId;
		this.type = type;
		this.billNo = billNo;
		this.date = date;
		this.amount = amount;
		this.doctorName = doctorName;
		this.hospitalName = hospitalName;
	}
	public Long getCghsBillsId() {
		return cghsBillsId;
	}
	public void setCghsBillsId(Long cghsBillsId) {
		this.cghsBillsId = cghsBillsId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	@Override
	public String toString() {
		return "CGHSBills [cghsBillsId=" + cghsBillsId + ", type=" + type + ", billNo=" + billNo + ", date=" + date
				+ ", amount=" + amount + ", doctorName=" + doctorName + ", hospitalName=" + hospitalName + "]";
	}
	
}
