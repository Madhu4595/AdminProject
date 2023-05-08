package com.app.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="medicBills")
public class Medical_Bills {

	@Id
	@GeneratedValue
	private Long id;
	
	private String 	bill_no;
	private String 	bill_date;
	private String 	amount_claimed;
	private String 	lab_name;
	
	private Integer	request_no;
	private String	emp_code;
	
	private boolean noteStatus;
	private boolean sanctionStatus;
	
	private LocalDate noteDate;
	private LocalDate sanctionDate;
	
	private LocalDateTime entryDate;
	
	private LocalDate notesheetDate;
	private LocalDateTime nsDate;
	
	private LocalDateTime sanctionorderDate;
	
	private LocalDateTime updatedTime;
	
	private String  amount_approved;
	
	private String remarks;
	
	private String soNumber;
	
	
	public Medical_Bills() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Medical_Bills(Long id, String bill_no, String bill_date, String amount_claimed, String lab_name,
			Integer request_no, String emp_code, boolean noteStatus, boolean sanctionStatus, LocalDate noteDate,
			LocalDate sanctionDate, LocalDateTime entryDate, LocalDate notesheetDate, LocalDateTime nsDate,
			LocalDateTime sanctionorderDate, LocalDateTime updatedTime, String amount_approved, String remarks,
			String soNumber) {
		super();
		this.id = id;
		this.bill_no = bill_no;
		this.bill_date = bill_date;
		this.amount_claimed = amount_claimed;
		this.lab_name = lab_name;
		this.request_no = request_no;
		this.emp_code = emp_code;
		this.noteStatus = noteStatus;
		this.sanctionStatus = sanctionStatus;
		this.noteDate = noteDate;
		this.sanctionDate = sanctionDate;
		this.entryDate = entryDate;
		this.notesheetDate = notesheetDate;
		this.nsDate = nsDate;
		this.sanctionorderDate = sanctionorderDate;
		this.updatedTime = updatedTime;
		this.amount_approved = amount_approved;
		this.remarks = remarks;
		this.soNumber = soNumber;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getBill_no() {
		return bill_no;
	}


	public void setBill_no(String bill_no) {
		this.bill_no = bill_no;
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


	public Integer getRequest_no() {
		return request_no;
	}


	public void setRequest_no(Integer request_no) {
		this.request_no = request_no;
	}


	public String getEmp_code() {
		return emp_code;
	}


	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}


	public boolean isNoteStatus() {
		return noteStatus;
	}


	public void setNoteStatus(boolean noteStatus) {
		this.noteStatus = noteStatus;
	}


	public boolean isSanctionStatus() {
		return sanctionStatus;
	}


	public void setSanctionStatus(boolean sanctionStatus) {
		this.sanctionStatus = sanctionStatus;
	}


	public LocalDate getNoteDate() {
		return noteDate;
	}


	public void setNoteDate(LocalDate noteDate) {
		this.noteDate = noteDate;
	}


	public LocalDate getSanctionDate() {
		return sanctionDate;
	}


	public void setSanctionDate(LocalDate sanctionDate) {
		this.sanctionDate = sanctionDate;
	}


	public LocalDateTime getEntryDate() {
		return entryDate;
	}


	public void setEntryDate(LocalDateTime entryDate) {
		this.entryDate = entryDate;
	}


	public LocalDate getNotesheetDate() {
		return notesheetDate;
	}


	public void setNotesheetDate(LocalDate notesheetDate) {
		this.notesheetDate = notesheetDate;
	}


	public LocalDateTime getNsDate() {
		return nsDate;
	}


	public void setNsDate(LocalDateTime nsDate) {
		this.nsDate = nsDate;
	}


	public LocalDateTime getSanctionorderDate() {
		return sanctionorderDate;
	}


	public void setSanctionorderDate(LocalDateTime sanctionorderDate) {
		this.sanctionorderDate = sanctionorderDate;
	}


	public LocalDateTime getUpdatedTime() {
		return updatedTime;
	}


	public void setUpdatedTime(LocalDateTime updatedTime) {
		this.updatedTime = updatedTime;
	}


	public String getAmount_approved() {
		return amount_approved;
	}


	public void setAmount_approved(String amount_approved) {
		this.amount_approved = amount_approved;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public String getSoNumber() {
		return soNumber;
	}


	public void setSoNumber(String soNumber) {
		this.soNumber = soNumber;
	}


	@Override
	public String toString() {
		return "Medical_Bills [id=" + id + ", bill_no=" + bill_no + ", bill_date=" + bill_date + ", amount_claimed="
				+ amount_claimed + ", lab_name=" + lab_name + ", request_no=" + request_no + ", emp_code=" + emp_code
				+ ", noteStatus=" + noteStatus + ", sanctionStatus=" + sanctionStatus + ", noteDate=" + noteDate
				+ ", sanctionDate=" + sanctionDate + ", entryDate=" + entryDate + ", notesheetDate=" + notesheetDate
				+ ", nsDate=" + nsDate + ", sanctionorderDate=" + sanctionorderDate + ", updatedTime=" + updatedTime
				+ ", amount_approved=" + amount_approved + ", remarks=" + remarks + ", soNumber=" + soNumber + "]";
	}


}
