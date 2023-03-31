package com.app.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="transactions")
public class Transactions {

	@Id
	private Integer request_no;
	private String 	vendor_no;
	private String 	bill_no;
	private String 	bill_date;
	private String 	from_date;
	private String 	to_date;
	private String 	description;
	private Integer type_of_bill;
	private String 	bill_process_date;
	private String 	subject;
	private String 	ifd_no;
	private String 	ifd_date;
	private String 	generated_date;
	private String 	amount_approved;
	private String 	labname;
	private Integer amount_claimed;
	private String 	status;
	private String 	siodate;
	private String 	gem_no;
	private String 	gem_date;
	private String 	contract_no;
	private String 	contract_date;
	private String 	note_para1;
	private String 	note_para2;
	private String 	acc_head;
	private String 	date;
	private String 	emp_name;
	private String 	vendor_name;
	private String 	so_no;
	private String 	so_date;
	public Transactions() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Transactions(Integer request_no, String vendor_no, String bill_no, String bill_date, String from_date,
			String to_date, String description, Integer type_of_bill, String bill_process_date, String subject,
			String ifd_no, String ifd_date, String generated_date, String amount_approved, String labname,
			Integer amount_claimed, String status, String siodate, String gem_no, String gem_date, String contract_no,
			String contract_date, String note_para1, String note_para2, String acc_head, String date, String emp_name,
			String vendor_name, String so_no, String so_date) {
		super();
		this.request_no = request_no;
		this.vendor_no = vendor_no;
		this.bill_no = bill_no;
		this.bill_date = bill_date;
		this.from_date = from_date;
		this.to_date = to_date;
		this.description = description;
		this.type_of_bill = type_of_bill;
		this.bill_process_date = bill_process_date;
		this.subject = subject;
		this.ifd_no = ifd_no;
		this.ifd_date = ifd_date;
		this.generated_date = generated_date;
		this.amount_approved = amount_approved;
		this.labname = labname;
		this.amount_claimed = amount_claimed;
		this.status = status;
		this.siodate = siodate;
		this.gem_no = gem_no;
		this.gem_date = gem_date;
		this.contract_no = contract_no;
		this.contract_date = contract_date;
		this.note_para1 = note_para1;
		this.note_para2 = note_para2;
		this.acc_head = acc_head;
		this.date = date;
		this.emp_name = emp_name;
		this.vendor_name = vendor_name;
		this.so_no = so_no;
		this.so_date = so_date;
	}
	public Integer getRequest_no() {
		return request_no;
	}
	public void setRequest_no(Integer request_no) {
		this.request_no = request_no;
	}
	public String getVendor_no() {
		return vendor_no;
	}
	public void setVendor_no(String vendor_no) {
		this.vendor_no = vendor_no;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getType_of_bill() {
		return type_of_bill;
	}
	public void setType_of_bill(Integer type_of_bill) {
		this.type_of_bill = type_of_bill;
	}
	public String getBill_process_date() {
		return bill_process_date;
	}
	public void setBill_process_date(String bill_process_date) {
		this.bill_process_date = bill_process_date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getIfd_no() {
		return ifd_no;
	}
	public void setIfd_no(String ifd_no) {
		this.ifd_no = ifd_no;
	}
	public String getIfd_date() {
		return ifd_date;
	}
	public void setIfd_date(String ifd_date) {
		this.ifd_date = ifd_date;
	}
	public String getGenerated_date() {
		return generated_date;
	}
	public void setGenerated_date(String generated_date) {
		this.generated_date = generated_date;
	}
	public String getAmount_approved() {
		return amount_approved;
	}
	public void setAmount_approved(String amount_approved) {
		this.amount_approved = amount_approved;
	}
	public String getLabname() {
		return labname;
	}
	public void setLabname(String labname) {
		this.labname = labname;
	}
	public Integer getAmount_claimed() {
		return amount_claimed;
	}
	public void setAmount_claimed(Integer amount_claimed) {
		this.amount_claimed = amount_claimed;
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
	public String getGem_no() {
		return gem_no;
	}
	public void setGem_no(String gem_no) {
		this.gem_no = gem_no;
	}
	public String getGem_date() {
		return gem_date;
	}
	public void setGem_date(String gem_date) {
		this.gem_date = gem_date;
	}
	public String getContract_no() {
		return contract_no;
	}
	public void setContract_no(String contract_no) {
		this.contract_no = contract_no;
	}
	public String getContract_date() {
		return contract_date;
	}
	public void setContract_date(String contract_date) {
		this.contract_date = contract_date;
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
	public String getAcc_head() {
		return acc_head;
	}
	public void setAcc_head(String acc_head) {
		this.acc_head = acc_head;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getVendor_name() {
		return vendor_name;
	}
	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}
	public String getSo_no() {
		return so_no;
	}
	public void setSo_no(String so_no) {
		this.so_no = so_no;
	}
	public String getSo_date() {
		return so_date;
	}
	public void setSo_date(String so_date) {
		this.so_date = so_date;
	}
	@Override
	public String toString() {
		return "Transactions [request_no=" + request_no + ", vendor_no=" + vendor_no + ", bill_no=" + bill_no
				+ ", bill_date=" + bill_date + ", from_date=" + from_date + ", to_date=" + to_date + ", description="
				+ description + ", type_of_bill=" + type_of_bill + ", bill_process_date=" + bill_process_date
				+ ", subject=" + subject + ", ifd_no=" + ifd_no + ", ifd_date=" + ifd_date + ", generated_date="
				+ generated_date + ", amount_approved=" + amount_approved + ", labname=" + labname + ", amount_claimed="
				+ amount_claimed + ", status=" + status + ", siodate=" + siodate + ", gem_no=" + gem_no + ", gem_date="
				+ gem_date + ", contract_no=" + contract_no + ", contract_date=" + contract_date + ", note_para1="
				+ note_para1 + ", note_para2=" + note_para2 + ", acc_head=" + acc_head + ", date=" + date
				+ ", emp_name=" + emp_name + ", vendor_name=" + vendor_name + ", so_no=" + so_no + ", so_date="
				+ so_date + "]";
	}
	
	
}
