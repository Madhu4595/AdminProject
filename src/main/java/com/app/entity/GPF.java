package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.app.util.StringPrefixedSequenceIdGenerator;

@Entity
public class GPF {
	
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gpf_seq")
    @GenericGenerator(
        name = "gpf_seq", 
        strategy = "com.app.util.StringPrefixedSequenceIdGenerator", 
        parameters = {
            @Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "GPF_"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%04d") })
	private String requestNo;
	
	private String empCode;
	private String gpfNo;
	private String purpose;
	private String withDrawAmt;
	private String netBalance;
	
	private String type;
	private String recordStatus;
	
	private String NSDate;
	private String SODate;
	
	private String soNum;
	

	public GPF() {
		super();
		// TODO Auto-generated constructor stub
	}


	public GPF(String requestNo, String empCode, String gpfNo, String purpose, String withDrawAmt, String netBalance,
			String type, String recordStatus, String nSDate, String sODate, String soNum) {
		super();
		this.requestNo = requestNo;
		this.empCode = empCode;
		this.gpfNo = gpfNo;
		this.purpose = purpose;
		this.withDrawAmt = withDrawAmt;
		this.netBalance = netBalance;
		this.type = type;
		this.recordStatus = recordStatus;
		NSDate = nSDate;
		SODate = sODate;
		this.soNum = soNum;
	}


	public String getRequestNo() {
		return requestNo;
	}


	public void setRequestNo(String requestNo) {
		this.requestNo = requestNo;
	}


	public String getEmpCode() {
		return empCode;
	}


	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}


	public String getGpfNo() {
		return gpfNo;
	}


	public void setGpfNo(String gpfNo) {
		this.gpfNo = gpfNo;
	}


	public String getPurpose() {
		return purpose;
	}


	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}


	public String getWithDrawAmt() {
		return withDrawAmt;
	}


	public void setWithDrawAmt(String withDrawAmt) {
		this.withDrawAmt = withDrawAmt;
	}


	public String getNetBalance() {
		return netBalance;
	}


	public void setNetBalance(String netBalance) {
		this.netBalance = netBalance;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getRecordStatus() {
		return recordStatus;
	}


	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}


	public String getNSDate() {
		return NSDate;
	}


	public void setNSDate(String nSDate) {
		NSDate = nSDate;
	}


	public String getSODate() {
		return SODate;
	}


	public void setSODate(String sODate) {
		SODate = sODate;
	}


	public String getSoNum() {
		return soNum;
	}


	public void setSoNum(String soNum) {
		this.soNum = soNum;
	}


	@Override
	public String toString() {
		return "GPF [requestNo=" + requestNo + ", empCode=" + empCode + ", gpfNo=" + gpfNo + ", purpose=" + purpose
				+ ", withDrawAmt=" + withDrawAmt + ", netBalance=" + netBalance + ", type=" + type + ", recordStatus="
				+ recordStatus + ", NSDate=" + NSDate + ", SODate=" + SODate + ", soNum=" + soNum + "]";
	}


}
