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
@Table(name="gem")
public class GEM {
	
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gem_seq")
    @GenericGenerator(
        name = "gem_seq", 
        strategy = "com.app.util.StringPrefixedSequenceIdGenerator", 
        parameters = {
            @Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "GEM"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%04d") })
	private String requestno;
	
	private String monthYear;
	private String period;
	private String billno;
	private String billdate;
	private String amount;
	
	private String type;
	
	private LocalDateTime entryDate;
	private LocalDateTime editDate;
	
	private LocalDateTime nsDate;
	private LocalDateTime soDate;
	
	private Boolean noteStatus;
	private Boolean sanctionStatus;
	
	private String sanctionNumber;
	private Integer noteNumber;

	public GEM() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GEM(String requestno, String monthYear, String period, String billno, String billdate, String amount,
			String type, LocalDateTime entryDate, LocalDateTime editDate, LocalDateTime nsDate, LocalDateTime soDate,
			Boolean noteStatus, Boolean sanctionStatus, String sanctionNumber, Integer noteNumber) {
		super();
		this.requestno = requestno;
		this.monthYear = monthYear;
		this.period = period;
		this.billno = billno;
		this.billdate = billdate;
		this.amount = amount;
		this.type = type;
		this.entryDate = entryDate;
		this.editDate = editDate;
		this.nsDate = nsDate;
		this.soDate = soDate;
		this.noteStatus = noteStatus;
		this.sanctionStatus = sanctionStatus;
		this.sanctionNumber = sanctionNumber;
		this.noteNumber = noteNumber;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public LocalDateTime getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(LocalDateTime entryDate) {
		this.entryDate = entryDate;
	}

	public LocalDateTime getEditDate() {
		return editDate;
	}

	public void setEditDate(LocalDateTime editDate) {
		this.editDate = editDate;
	}

	public LocalDateTime getNsDate() {
		return nsDate;
	}

	public void setNsDate(LocalDateTime nsDate) {
		this.nsDate = nsDate;
	}

	public LocalDateTime getSoDate() {
		return soDate;
	}

	public void setSoDate(LocalDateTime soDate) {
		this.soDate = soDate;
	}

	public Boolean getNoteStatus() {
		return noteStatus;
	}

	public void setNoteStatus(Boolean noteStatus) {
		this.noteStatus = noteStatus;
	}

	public Boolean getSanctionStatus() {
		return sanctionStatus;
	}

	public void setSanctionStatus(Boolean sanctionStatus) {
		this.sanctionStatus = sanctionStatus;
	}

	public String getSanctionNumber() {
		return sanctionNumber;
	}

	public void setSanctionNumber(String sanctionNumber) {
		this.sanctionNumber = sanctionNumber;
	}

	public Integer getNoteNumber() {
		return noteNumber;
	}

	public void setNoteNumber(Integer noteNumber) {
		this.noteNumber = noteNumber;
	}

	@Override
	public String toString() {
		return "GEM [requestno=" + requestno + ", monthYear=" + monthYear + ", period=" + period + ", billno=" + billno
				+ ", billdate=" + billdate + ", amount=" + amount + ", type=" + type + ", entryDate=" + entryDate
				+ ", editDate=" + editDate + ", nsDate=" + nsDate + ", soDate=" + soDate + ", noteStatus=" + noteStatus
				+ ", sanctionStatus=" + sanctionStatus + ", sanctionNumber=" + sanctionNumber + ", noteNumber="
				+ noteNumber + "]";
	}

}
