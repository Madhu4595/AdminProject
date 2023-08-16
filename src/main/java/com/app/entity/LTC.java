package com.app.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.app.util.StringPrefixedSequenceIdGenerator;

@Entity
@Table(name="ltc")
public class LTC {
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ltc_seq")
    @GenericGenerator(
        name = "ltc_seq", 
        strategy = "com.app.util.StringPrefixedSequenceIdGenerator", 
        parameters = {
            @Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "LTC"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%04d") })
	private String requestno;
	
	private String empcode;
	private String blockyear;
	private String location;
	private String visitplace;
	private String claimedfor;
	private String visitperiod;
	private String leavedetails;
	private String encashment;
	private String amountadvance;
	private String totalfare;
	
	
	private Integer note_number;
	private String sanctionorderno;
	
	private LocalDateTime entry_date;
	private LocalDateTime edit_date;
	
	private LocalDateTime note_date;
	private LocalDateTime sanction_date;
	
	private Boolean note_status;
	private Boolean sanction_status;
	
	
	public LTC() {
		super();
		// TODO Auto-generated constructor stub
	}


	public LTC(String requestno, String empcode, String blockyear, String location, String visitplace,
			String claimedfor, String visitperiod, String leavedetails, String encashment, String amountadvance,
			String totalfare, Integer note_number, String sanctionorderno, LocalDateTime entry_date,
			LocalDateTime edit_date, LocalDateTime note_date, LocalDateTime sanction_date, Boolean note_status,
			Boolean sanction_status) {
		super();
		this.requestno = requestno;
		this.empcode = empcode;
		this.blockyear = blockyear;
		this.location = location;
		this.visitplace = visitplace;
		this.claimedfor = claimedfor;
		this.visitperiod = visitperiod;
		this.leavedetails = leavedetails;
		this.encashment = encashment;
		this.amountadvance = amountadvance;
		this.totalfare = totalfare;
		this.note_number = note_number;
		this.sanctionorderno = sanctionorderno;
		this.entry_date = entry_date;
		this.edit_date = edit_date;
		this.note_date = note_date;
		this.sanction_date = sanction_date;
		this.note_status = note_status;
		this.sanction_status = sanction_status;
	}


	public String getRequestno() {
		return requestno;
	}


	public void setRequestno(String requestno) {
		this.requestno = requestno;
	}


	public String getEmpcode() {
		return empcode;
	}


	public void setEmpcode(String empcode) {
		this.empcode = empcode;
	}


	public String getBlockyear() {
		return blockyear;
	}


	public void setBlockyear(String blockyear) {
		this.blockyear = blockyear;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getVisitplace() {
		return visitplace;
	}


	public void setVisitplace(String visitplace) {
		this.visitplace = visitplace;
	}


	public String getClaimedfor() {
		return claimedfor;
	}


	public void setClaimedfor(String claimedfor) {
		this.claimedfor = claimedfor;
	}


	public String getVisitperiod() {
		return visitperiod;
	}


	public void setVisitperiod(String visitperiod) {
		this.visitperiod = visitperiod;
	}


	public String getLeavedetails() {
		return leavedetails;
	}


	public void setLeavedetails(String leavedetails) {
		this.leavedetails = leavedetails;
	}


	public String getEncashment() {
		return encashment;
	}


	public void setEncashment(String encashment) {
		this.encashment = encashment;
	}


	public String getAmountadvance() {
		return amountadvance;
	}


	public void setAmountadvance(String amountadvance) {
		this.amountadvance = amountadvance;
	}


	public String getTotalfare() {
		return totalfare;
	}


	public void setTotalfare(String totalfare) {
		this.totalfare = totalfare;
	}


	public Integer getNote_number() {
		return note_number;
	}


	public void setNote_number(Integer note_number) {
		this.note_number = note_number;
	}


	public String getSanctionorderno() {
		return sanctionorderno;
	}


	public void setSanctionorderno(String sanctionorderno) {
		this.sanctionorderno = sanctionorderno;
	}


	public LocalDateTime getEntry_date() {
		return entry_date;
	}


	public void setEntry_date(LocalDateTime entry_date) {
		this.entry_date = entry_date;
	}


	public LocalDateTime getEdit_date() {
		return edit_date;
	}


	public void setEdit_date(LocalDateTime edit_date) {
		this.edit_date = edit_date;
	}


	public LocalDateTime getNote_date() {
		return note_date;
	}


	public void setNote_date(LocalDateTime note_date) {
		this.note_date = note_date;
	}


	public LocalDateTime getSanction_date() {
		return sanction_date;
	}


	public void setSanction_date(LocalDateTime sanction_date) {
		this.sanction_date = sanction_date;
	}


	public Boolean getNote_status() {
		return note_status;
	}


	public void setNote_status(Boolean note_status) {
		this.note_status = note_status;
	}


	public Boolean getSanction_status() {
		return sanction_status;
	}


	public void setSanction_status(Boolean sanction_status) {
		this.sanction_status = sanction_status;
	}


	@Override
	public String toString() {
		return "LTC [requestno=" + requestno + ", empcode=" + empcode + ", blockyear=" + blockyear + ", location="
				+ location + ", visitplace=" + visitplace + ", claimedfor=" + claimedfor + ", visitperiod="
				+ visitperiod + ", leavedetails=" + leavedetails + ", encashment=" + encashment + ", amountadvance="
				+ amountadvance + ", totalfare=" + totalfare + ", note_number=" + note_number + ", sanctionorderno="
				+ sanctionorderno + ", entry_date=" + entry_date + ", edit_date=" + edit_date + ", note_date="
				+ note_date + ", sanction_date=" + sanction_date + ", note_status=" + note_status + ", sanction_status="
				+ sanction_status + "]";
	}


	

	
	 
	
}
