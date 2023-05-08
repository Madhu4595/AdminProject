package com.app.entity;

import java.io.File;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="emp_allowance")
public class Employee_allowance {
	@Id
	private Integer 	request_no;
	private String 		code;
	private String 		remarks;
	private String 		completed_service;
	private String  	allowance_type;
	private Integer 	admissible_amount;
	private Integer 	amount_claimed;
	private Integer 	balance_asper_accountsslip;
	private Integer 	total;
	private Integer 	balance;
	private Integer 	closing_balance_asper_accounts;
	private String 		test_col;
	private Integer 	subsequent_deposits;
	private Integer 	subsequent_withdrawals;
	private Byte 		cea_file;
	private Byte 		gpf_withdrawal;
	private Byte 		gpf_advance;
	private String 		billno;
	private String 		billdate;
	private String 		shopname;
	private Integer 	last_claimed;
	private String 		name_class_of_child1;
	private Integer 	amount_approved;
	private Integer 	cea_amount_child1;
	private Integer 	cea_amount_child2;
	private String 		period_of_claim_child2;
	private String 		name_class_of_child2;
	private String 		cea_type_child1; 
	private String 		cea_type_child2; 
	private String 		period_of_claim_child1;
	
	private String 		status;
	private String 		siodate;
	private Integer 	amount_approve;
	private Integer 	amount_approve1;
	private Integer 	amount_approve2;
	private String 		so_no;
	private String 		generated_date;
	private String 		subject;
	private String 		note_para1;
	private String 		note_para2;
	private String 		vendor_name;
	private String 		ifd_date;
	private String 		from_date;
	private String 		to_date;
	private String 		travel_date;
	private String 		noofchilds;
	private File 		doc_image;
	private File 		getGpf_doc;
	
	private LocalDateTime entryDate;
	private LocalDateTime editDate;
	private LocalDateTime nsDate;
	private LocalDateTime soDate;
	
	private Boolean noteStatus;
	private Boolean sanctionStatus;
	
	
	
	public Employee_allowance() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Employee_allowance(Integer request_no, String code, String remarks, String completed_service,
			String allowance_type, Integer admissible_amount, Integer amount_claimed,
			Integer balance_asper_accountsslip, Integer total, Integer balance, Integer closing_balance_asper_accounts,
			String test_col, Integer subsequent_deposits, Integer subsequent_withdrawals, Byte cea_file,
			Byte gpf_withdrawal, Byte gpf_advance, String billno, String billdate, String shopname,
			Integer last_claimed, String name_class_of_child1, Integer amount_approved, Integer cea_amount_child1,
			Integer cea_amount_child2, String period_of_claim_child2, String name_class_of_child2,
			String cea_type_child1, String cea_type_child2, String period_of_claim_child1, String status,
			String siodate, Integer amount_approve, Integer amount_approve1, Integer amount_approve2, String so_no,
			String generated_date, String subject, String note_para1, String note_para2, String vendor_name,
			String ifd_date, String from_date, String to_date, String travel_date, String noofchilds, File doc_image,
			File getGpf_doc, LocalDateTime entryDate, LocalDateTime editDate, LocalDateTime nsDate,
			LocalDateTime soDate, Boolean noteStatus, Boolean sanctionStatus) {
		super();
		this.request_no = request_no;
		this.code = code;
		this.remarks = remarks;
		this.completed_service = completed_service;
		this.allowance_type = allowance_type;
		this.admissible_amount = admissible_amount;
		this.amount_claimed = amount_claimed;
		this.balance_asper_accountsslip = balance_asper_accountsslip;
		this.total = total;
		this.balance = balance;
		this.closing_balance_asper_accounts = closing_balance_asper_accounts;
		this.test_col = test_col;
		this.subsequent_deposits = subsequent_deposits;
		this.subsequent_withdrawals = subsequent_withdrawals;
		this.cea_file = cea_file;
		this.gpf_withdrawal = gpf_withdrawal;
		this.gpf_advance = gpf_advance;
		this.billno = billno;
		this.billdate = billdate;
		this.shopname = shopname;
		this.last_claimed = last_claimed;
		this.name_class_of_child1 = name_class_of_child1;
		this.amount_approved = amount_approved;
		this.cea_amount_child1 = cea_amount_child1;
		this.cea_amount_child2 = cea_amount_child2;
		this.period_of_claim_child2 = period_of_claim_child2;
		this.name_class_of_child2 = name_class_of_child2;
		this.cea_type_child1 = cea_type_child1;
		this.cea_type_child2 = cea_type_child2;
		this.period_of_claim_child1 = period_of_claim_child1;
		this.status = status;
		this.siodate = siodate;
		this.amount_approve = amount_approve;
		this.amount_approve1 = amount_approve1;
		this.amount_approve2 = amount_approve2;
		this.so_no = so_no;
		this.generated_date = generated_date;
		this.subject = subject;
		this.note_para1 = note_para1;
		this.note_para2 = note_para2;
		this.vendor_name = vendor_name;
		this.ifd_date = ifd_date;
		this.from_date = from_date;
		this.to_date = to_date;
		this.travel_date = travel_date;
		this.noofchilds = noofchilds;
		this.doc_image = doc_image;
		this.getGpf_doc = getGpf_doc;
		this.entryDate = entryDate;
		this.editDate = editDate;
		this.nsDate = nsDate;
		this.soDate = soDate;
		this.noteStatus = noteStatus;
		this.sanctionStatus = sanctionStatus;
	}



	public Integer getRequest_no() {
		return request_no;
	}



	public void setRequest_no(Integer request_no) {
		this.request_no = request_no;
	}



	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}



	public String getRemarks() {
		return remarks;
	}



	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}



	public String getCompleted_service() {
		return completed_service;
	}



	public void setCompleted_service(String completed_service) {
		this.completed_service = completed_service;
	}



	public String getAllowance_type() {
		return allowance_type;
	}



	public void setAllowance_type(String allowance_type) {
		this.allowance_type = allowance_type;
	}



	public Integer getAdmissible_amount() {
		return admissible_amount;
	}



	public void setAdmissible_amount(Integer admissible_amount) {
		this.admissible_amount = admissible_amount;
	}



	public Integer getAmount_claimed() {
		return amount_claimed;
	}



	public void setAmount_claimed(Integer amount_claimed) {
		this.amount_claimed = amount_claimed;
	}



	public Integer getBalance_asper_accountsslip() {
		return balance_asper_accountsslip;
	}



	public void setBalance_asper_accountsslip(Integer balance_asper_accountsslip) {
		this.balance_asper_accountsslip = balance_asper_accountsslip;
	}



	public Integer getTotal() {
		return total;
	}



	public void setTotal(Integer total) {
		this.total = total;
	}



	public Integer getBalance() {
		return balance;
	}



	public void setBalance(Integer balance) {
		this.balance = balance;
	}



	public Integer getClosing_balance_asper_accounts() {
		return closing_balance_asper_accounts;
	}



	public void setClosing_balance_asper_accounts(Integer closing_balance_asper_accounts) {
		this.closing_balance_asper_accounts = closing_balance_asper_accounts;
	}



	public String getTest_col() {
		return test_col;
	}



	public void setTest_col(String test_col) {
		this.test_col = test_col;
	}



	public Integer getSubsequent_deposits() {
		return subsequent_deposits;
	}



	public void setSubsequent_deposits(Integer subsequent_deposits) {
		this.subsequent_deposits = subsequent_deposits;
	}



	public Integer getSubsequent_withdrawals() {
		return subsequent_withdrawals;
	}



	public void setSubsequent_withdrawals(Integer subsequent_withdrawals) {
		this.subsequent_withdrawals = subsequent_withdrawals;
	}



	public Byte getCea_file() {
		return cea_file;
	}



	public void setCea_file(Byte cea_file) {
		this.cea_file = cea_file;
	}



	public Byte getGpf_withdrawal() {
		return gpf_withdrawal;
	}



	public void setGpf_withdrawal(Byte gpf_withdrawal) {
		this.gpf_withdrawal = gpf_withdrawal;
	}



	public Byte getGpf_advance() {
		return gpf_advance;
	}



	public void setGpf_advance(Byte gpf_advance) {
		this.gpf_advance = gpf_advance;
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



	public String getShopname() {
		return shopname;
	}



	public void setShopname(String shopname) {
		this.shopname = shopname;
	}



	public Integer getLast_claimed() {
		return last_claimed;
	}



	public void setLast_claimed(Integer last_claimed) {
		this.last_claimed = last_claimed;
	}



	public String getName_class_of_child1() {
		return name_class_of_child1;
	}



	public void setName_class_of_child1(String name_class_of_child1) {
		this.name_class_of_child1 = name_class_of_child1;
	}



	public Integer getAmount_approved() {
		return amount_approved;
	}



	public void setAmount_approved(Integer amount_approved) {
		this.amount_approved = amount_approved;
	}



	public Integer getCea_amount_child1() {
		return cea_amount_child1;
	}



	public void setCea_amount_child1(Integer cea_amount_child1) {
		this.cea_amount_child1 = cea_amount_child1;
	}



	public Integer getCea_amount_child2() {
		return cea_amount_child2;
	}



	public void setCea_amount_child2(Integer cea_amount_child2) {
		this.cea_amount_child2 = cea_amount_child2;
	}



	public String getPeriod_of_claim_child2() {
		return period_of_claim_child2;
	}



	public void setPeriod_of_claim_child2(String period_of_claim_child2) {
		this.period_of_claim_child2 = period_of_claim_child2;
	}



	public String getName_class_of_child2() {
		return name_class_of_child2;
	}



	public void setName_class_of_child2(String name_class_of_child2) {
		this.name_class_of_child2 = name_class_of_child2;
	}



	public String getCea_type_child1() {
		return cea_type_child1;
	}



	public void setCea_type_child1(String cea_type_child1) {
		this.cea_type_child1 = cea_type_child1;
	}



	public String getCea_type_child2() {
		return cea_type_child2;
	}



	public void setCea_type_child2(String cea_type_child2) {
		this.cea_type_child2 = cea_type_child2;
	}



	public String getPeriod_of_claim_child1() {
		return period_of_claim_child1;
	}



	public void setPeriod_of_claim_child1(String period_of_claim_child1) {
		this.period_of_claim_child1 = period_of_claim_child1;
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



	public Integer getAmount_approve() {
		return amount_approve;
	}



	public void setAmount_approve(Integer amount_approve) {
		this.amount_approve = amount_approve;
	}



	public Integer getAmount_approve1() {
		return amount_approve1;
	}



	public void setAmount_approve1(Integer amount_approve1) {
		this.amount_approve1 = amount_approve1;
	}



	public Integer getAmount_approve2() {
		return amount_approve2;
	}



	public void setAmount_approve2(Integer amount_approve2) {
		this.amount_approve2 = amount_approve2;
	}



	public String getSo_no() {
		return so_no;
	}



	public void setSo_no(String so_no) {
		this.so_no = so_no;
	}



	public String getGenerated_date() {
		return generated_date;
	}



	public void setGenerated_date(String generated_date) {
		this.generated_date = generated_date;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public String getNote_para1() {
		return note_para1;
	}



	public void setNote_para1(String note_para1) {
		this.note_para1 = note_para1;
	}



	public String getNote_para2() {
		return note_para2;
	}



	public void setNote_para2(String note_para2) {
		this.note_para2 = note_para2;
	}



	public String getVendor_name() {
		return vendor_name;
	}



	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}



	public String getIfd_date() {
		return ifd_date;
	}



	public void setIfd_date(String ifd_date) {
		this.ifd_date = ifd_date;
	}



	public String getFrom_date() {
		return from_date;
	}



	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}



	public String getTo_date() {
		return to_date;
	}



	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}



	public String getTravel_date() {
		return travel_date;
	}



	public void setTravel_date(String travel_date) {
		this.travel_date = travel_date;
	}



	public String getNoofchilds() {
		return noofchilds;
	}



	public void setNoofchilds(String noofchilds) {
		this.noofchilds = noofchilds;
	}



	public File getDoc_image() {
		return doc_image;
	}



	public void setDoc_image(File doc_image) {
		this.doc_image = doc_image;
	}



	public File getGetGpf_doc() {
		return getGpf_doc;
	}



	public void setGetGpf_doc(File getGpf_doc) {
		this.getGpf_doc = getGpf_doc;
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



	@Override
	public String toString() {
		return "Employee_allowance [request_no=" + request_no + ", code=" + code + ", remarks=" + remarks
				+ ", completed_service=" + completed_service + ", allowance_type=" + allowance_type
				+ ", admissible_amount=" + admissible_amount + ", amount_claimed=" + amount_claimed
				+ ", balance_asper_accountsslip=" + balance_asper_accountsslip + ", total=" + total + ", balance="
				+ balance + ", closing_balance_asper_accounts=" + closing_balance_asper_accounts + ", test_col="
				+ test_col + ", subsequent_deposits=" + subsequent_deposits + ", subsequent_withdrawals="
				+ subsequent_withdrawals + ", cea_file=" + cea_file + ", gpf_withdrawal=" + gpf_withdrawal
				+ ", gpf_advance=" + gpf_advance + ", billno=" + billno + ", billdate=" + billdate + ", shopname="
				+ shopname + ", last_claimed=" + last_claimed + ", name_class_of_child1=" + name_class_of_child1
				+ ", amount_approved=" + amount_approved + ", cea_amount_child1=" + cea_amount_child1
				+ ", cea_amount_child2=" + cea_amount_child2 + ", period_of_claim_child2=" + period_of_claim_child2
				+ ", name_class_of_child2=" + name_class_of_child2 + ", cea_type_child1=" + cea_type_child1
				+ ", cea_type_child2=" + cea_type_child2 + ", period_of_claim_child1=" + period_of_claim_child1
				+ ", status=" + status + ", siodate=" + siodate + ", amount_approve=" + amount_approve
				+ ", amount_approve1=" + amount_approve1 + ", amount_approve2=" + amount_approve2 + ", so_no=" + so_no
				+ ", generated_date=" + generated_date + ", subject=" + subject + ", note_para1=" + note_para1
				+ ", note_para2=" + note_para2 + ", vendor_name=" + vendor_name + ", ifd_date=" + ifd_date
				+ ", from_date=" + from_date + ", to_date=" + to_date + ", travel_date=" + travel_date + ", noofchilds="
				+ noofchilds + ", doc_image=" + doc_image + ", getGpf_doc=" + getGpf_doc + ", entryDate=" + entryDate
				+ ", editDate=" + editDate + ", nsDate=" + nsDate + ", soDate=" + soDate + ", noteStatus=" + noteStatus
				+ ", sanctionStatus=" + sanctionStatus + "]";
	}

	
}
