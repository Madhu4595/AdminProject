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
@Table(name="ltc")
public class LTC {
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ltc_seq")
    @GenericGenerator(
        name = "ltc_seq", 
        strategy = "com.app.util.StringPrefixedSequenceIdGenerator", 
        parameters = {
            @Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "LTC_"),
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
	private String sanctionorderno;
	private String totalfare;
	
	
	public LTC() {
		super();
		// TODO Auto-generated constructor stub
	}


	public LTC(String requestno, String empcode, String blockyear, String location, String visitplace,
			String claimedfor, String visitperiod, String leavedetails, String encashment, String amountadvance,
			String sanctionorderno, String totalfare) {
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
		this.sanctionorderno = sanctionorderno;
		this.totalfare = totalfare;
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


	public String getSanctionorderno() {
		return sanctionorderno;
	}


	public void setSanctionorderno(String sanctionorderno) {
		this.sanctionorderno = sanctionorderno;
	}


	public String getTotalfare() {
		return totalfare;
	}


	public void setTotalfare(String totalfare) {
		this.totalfare = totalfare;
	}


	@Override
	public String toString() {
		return "LTC [requestno=" + requestno + ", empcode=" + empcode + ", blockyear=" + blockyear + ", location="
				+ location + ", visitplace=" + visitplace + ", claimedfor=" + claimedfor + ", visitperiod="
				+ visitperiod + ", leavedetails=" + leavedetails + ", encashment=" + encashment + ", amountadvance="
				+ amountadvance + ", sanctionorderno=" + sanctionorderno + ", totalfare=" + totalfare + "]";
	}


	 
	
}
