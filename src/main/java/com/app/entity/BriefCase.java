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
@Table(name="briefcase")
public class BriefCase {
	
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cea_seq")
    @GenericGenerator(
        name = "cea_seq", 
        strategy = "com.app.util.StringPrefixedSequenceIdGenerator", 
        parameters = {
            @Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "BRI"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%04d") })
	private String requestno;
	private String 	empCode;
	private String invoiceNo;
	private String invoiceDate;
	private String amountClaimed;
	private String shopName;
	private String amountApproved;
	
	private LocalDateTime entryDate;
	private LocalDateTime editDate;
	
	private LocalDateTime nsDate;
	private LocalDateTime soDate;
	
	private Boolean noteStatus;
	private Boolean sanctionStatus;
	
	private String sanctionNumber;
	private String noteNumber;
	public BriefCase() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BriefCase(String requestno, String empCode, String invoiceNo, String invoiceDate, String amountClaimed,
			String shopName, String amountApproved, LocalDateTime entryDate, LocalDateTime editDate,
			LocalDateTime nsDate, LocalDateTime soDate, Boolean noteStatus, Boolean sanctionStatus,
			String sanctionNumber, String noteNumber) {
		super();
		this.requestno = requestno;
		this.empCode = empCode;
		this.invoiceNo = invoiceNo;
		this.invoiceDate = invoiceDate;
		this.amountClaimed = amountClaimed;
		this.shopName = shopName;
		this.amountApproved = amountApproved;
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
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public String getAmountClaimed() {
		return amountClaimed;
	}
	public void setAmountClaimed(String amountClaimed) {
		this.amountClaimed = amountClaimed;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getAmountApproved() {
		return amountApproved;
	}
	public void setAmountApproved(String amountApproved) {
		this.amountApproved = amountApproved;
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
	public String getNoteNumber() {
		return noteNumber;
	}
	public void setNoteNumber(String noteNumber) {
		this.noteNumber = noteNumber;
	}
	@Override
	public String toString() {
		return "BriefCase [requestno=" + requestno + ", empCode=" + empCode + ", invoiceNo=" + invoiceNo
				+ ", invoiceDate=" + invoiceDate + ", amountClaimed=" + amountClaimed + ", shopName=" + shopName
				+ ", amountApproved=" + amountApproved + ", entryDate=" + entryDate + ", editDate=" + editDate
				+ ", nsDate=" + nsDate + ", soDate=" + soDate + ", noteStatus=" + noteStatus + ", sanctionStatus="
				+ sanctionStatus + ", sanctionNumber=" + sanctionNumber + ", noteNumber=" + noteNumber + "]";
	}
}
