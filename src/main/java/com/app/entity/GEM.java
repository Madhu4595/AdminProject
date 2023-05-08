package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.app.util.StringPrefixedSequenceIdGenerator;

@Entity
@Table(name="gem")
public class GEM {
	
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gem_seq")
    @GenericGenerator(
        name = "gem_seq", 
        strategy = "com.app.util.StringPrefixedSequenceIdGenerator", 
        parameters = {
            @Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "GEM_"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%04d") })
	private String requestno;
	
	private String monthYear;
	private String period;
	private String billno;
	private String billdate;
	private String amount;
	
	private String record_status;
	private String SONum;
	private String type;

	public GEM() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GEM(String requestno, String monthYear, String period, String billno, String billdate, String amount,
			String record_status, String sONum, String type) {
		super();
		this.requestno = requestno;
		this.monthYear = monthYear;
		this.period = period;
		this.billno = billno;
		this.billdate = billdate;
		this.amount = amount;
		this.record_status = record_status;
		SONum = sONum;
		this.type = type;
	}

	public String getRequestno() {
		return requestno;
	}

	public void setRequestno(String requestno) {
		this.requestno = requestno;
	}

	public String getMonthYear() {
		return monthYear;
	}

	public void setMonthYear(String monthYear) {
		this.monthYear = monthYear;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getBillno() {
		return billno;
	}

	public void setBillno(String billno) {
		this.billno = billno;
	}

	public String getBilldate() {
		return billdate;
	}

	public void setBilldate(String billdate) {
		this.billdate = billdate;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getRecord_status() {
		return record_status;
	}

	public void setRecord_status(String record_status) {
		this.record_status = record_status;
	}

	public String getSONum() {
		return SONum;
	}

	public void setSONum(String sONum) {
		SONum = sONum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "GEM [requestno=" + requestno + ", monthYear=" + monthYear + ", period=" + period + ", billno=" + billno
				+ ", billdate=" + billdate + ", amount=" + amount + ", record_status=" + record_status + ", SONum="
				+ SONum + ", type=" + type + "]";
	}

	

	 
	
	

}
