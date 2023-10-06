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
@Table(name="gpf")
public class GPF {
	
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gpf_seq")
    @GenericGenerator(
        name = "gpf_seq", 
        strategy = "com.app.util.StringPrefixedSequenceIdGenerator", 
        parameters = {
            @Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "GPF"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%04d") })
	private String requestNo;
	
	private String empCode;
	private String gpfNo;
	private String purpose;
	private String withDrawAmt;
	private String netBalance;
	
	private String type;
	
	private LocalDateTime entryDate;
	private LocalDateTime editDate;
	
	private LocalDateTime nsDate;
	private LocalDateTime soDate;
	
	private Boolean noteStatus;
	private Boolean sanctionStatus;
	
	private String sanctionNumber;
	private Integer noteNumber;

	public GPF() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GPF(String requestNo, String empCode, String gpfNo, String purpose, String withDrawAmt, String netBalance,
			String type, LocalDateTime entryDate, LocalDateTime editDate, LocalDateTime nsDate, LocalDateTime soDate,
			Boolean noteStatus, Boolean sanctionStatus, String sanctionNumber, Integer noteNumber) {
		super();
		this.requestNo = requestNo;
		this.empCode = empCode;
		this.gpfNo = gpfNo;
		this.purpose = purpose;
		this.withDrawAmt = withDrawAmt;
		this.netBalance = netBalance;
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
		return "GPF [requestNo=" + requestNo + ", empCode=" + empCode + ", gpfNo=" + gpfNo + ", purpose=" + purpose
				+ ", withDrawAmt=" + withDrawAmt + ", netBalance=" + netBalance + ", type=" + type + ", entryDate="
				+ entryDate + ", editDate=" + editDate + ", nsDate=" + nsDate + ", soDate=" + soDate + ", noteStatus="
				+ noteStatus + ", sanctionStatus=" + sanctionStatus + ", sanctionNumber=" + sanctionNumber
				+ ", noteNumber=" + noteNumber + "]";
	}


	 


}
