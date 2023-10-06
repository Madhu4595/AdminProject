package com.app.entity;

import java.time.LocalDateTime;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.app.util.StringPrefixedSequenceIdGenerator;

@Entity
@Table(name="cea")
public class CEA {
	
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cea_seq")
    @GenericGenerator(
        name = "cea_seq", 
        strategy = "com.app.util.StringPrefixedSequenceIdGenerator", 
        parameters = {
            @Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "CEA"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%04d") })
	private String requestno;
	
	private String 	empCode;
	private String 	noofchilds;
	
	private String 	name_class_of_child1;
	private String 	period_of_claim_child1;
	private String 	cea_type_child1; 
	private Integer cea_amount_child1;
	private Integer amount_approve1;
	
	private String 	name_class_of_child2;
	private String 	period_of_claim_child2;
	private String 	cea_type_child2;
	private Integer cea_amount_child2;
	private Integer amount_approve2;
	
	private Integer amount_claimed;
	private Integer amount_approved;
	
	private LocalDateTime entryDate;
	private LocalDateTime editDate;
	
	private LocalDateTime nsDate;
	private LocalDateTime soDate;
	
	private Boolean noteStatus;
	private Boolean sanctionStatus;
	
	private String sanctionNumber;
	private Long noteNumber;
	
	private byte[] document;
	
	public CEA() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CEA(String requestno, String empCode, String noofchilds, String name_class_of_child1,
			String period_of_claim_child1, String cea_type_child1, Integer cea_amount_child1, Integer amount_approve1,
			String name_class_of_child2, String period_of_claim_child2, String cea_type_child2,
			Integer cea_amount_child2, Integer amount_approve2, Integer amount_claimed, Integer amount_approved,
			LocalDateTime entryDate, LocalDateTime editDate, LocalDateTime nsDate, LocalDateTime soDate,
			Boolean noteStatus, Boolean sanctionStatus, String sanctionNumber, Long noteNumber, byte[] document) {
		super();
		this.requestno = requestno;
		this.empCode = empCode;
		this.noofchilds = noofchilds;
		this.name_class_of_child1 = name_class_of_child1;
		this.period_of_claim_child1 = period_of_claim_child1;
		this.cea_type_child1 = cea_type_child1;
		this.cea_amount_child1 = cea_amount_child1;
		this.amount_approve1 = amount_approve1;
		this.name_class_of_child2 = name_class_of_child2;
		this.period_of_claim_child2 = period_of_claim_child2;
		this.cea_type_child2 = cea_type_child2;
		this.cea_amount_child2 = cea_amount_child2;
		this.amount_approve2 = amount_approve2;
		this.amount_claimed = amount_claimed;
		this.amount_approved = amount_approved;
		this.entryDate = entryDate;
		this.editDate = editDate;
		this.nsDate = nsDate;
		this.soDate = soDate;
		this.noteStatus = noteStatus;
		this.sanctionStatus = sanctionStatus;
		this.sanctionNumber = sanctionNumber;
		this.noteNumber = noteNumber;
		this.document = document;
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

	public String getNoofchilds() {
		return noofchilds;
	}

	public void setNoofchilds(String noofchilds) {
		this.noofchilds = noofchilds;
	}

	public String getName_class_of_child1() {
		return name_class_of_child1;
	}

	public void setName_class_of_child1(String name_class_of_child1) {
		this.name_class_of_child1 = name_class_of_child1;
	}

	public String getPeriod_of_claim_child1() {
		return period_of_claim_child1;
	}

	public void setPeriod_of_claim_child1(String period_of_claim_child1) {
		this.period_of_claim_child1 = period_of_claim_child1;
	}

	public String getCea_type_child1() {
		return cea_type_child1;
	}

	public void setCea_type_child1(String cea_type_child1) {
		this.cea_type_child1 = cea_type_child1;
	}

	public Integer getCea_amount_child1() {
		return cea_amount_child1;
	}

	public void setCea_amount_child1(Integer cea_amount_child1) {
		this.cea_amount_child1 = cea_amount_child1;
	}

	public Integer getAmount_approve1() {
		return amount_approve1;
	}

	public void setAmount_approve1(Integer amount_approve1) {
		this.amount_approve1 = amount_approve1;
	}

	public String getName_class_of_child2() {
		return name_class_of_child2;
	}

	public void setName_class_of_child2(String name_class_of_child2) {
		this.name_class_of_child2 = name_class_of_child2;
	}

	public String getPeriod_of_claim_child2() {
		return period_of_claim_child2;
	}

	public void setPeriod_of_claim_child2(String period_of_claim_child2) {
		this.period_of_claim_child2 = period_of_claim_child2;
	}

	public String getCea_type_child2() {
		return cea_type_child2;
	}

	public void setCea_type_child2(String cea_type_child2) {
		this.cea_type_child2 = cea_type_child2;
	}

	public Integer getCea_amount_child2() {
		return cea_amount_child2;
	}

	public void setCea_amount_child2(Integer cea_amount_child2) {
		this.cea_amount_child2 = cea_amount_child2;
	}

	public Integer getAmount_approve2() {
		return amount_approve2;
	}

	public void setAmount_approve2(Integer amount_approve2) {
		this.amount_approve2 = amount_approve2;
	}

	public Integer getAmount_claimed() {
		return amount_claimed;
	}

	public void setAmount_claimed(Integer amount_claimed) {
		this.amount_claimed = amount_claimed;
	}

	public Integer getAmount_approved() {
		return amount_approved;
	}

	public void setAmount_approved(Integer amount_approved) {
		this.amount_approved = amount_approved;
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

	public Long getNoteNumber() {
		return noteNumber;
	}

	public void setNoteNumber(Long noteNumber) {
		this.noteNumber = noteNumber;
	}

	public byte[] getDocument() {
		return document;
	}

	public void setDocument(byte[] document) {
		this.document = document;
	}

	@Override
	public String toString() {
		return "CEA [requestno=" + requestno + ", empCode=" + empCode + ", noofchilds=" + noofchilds
				+ ", name_class_of_child1=" + name_class_of_child1 + ", period_of_claim_child1="
				+ period_of_claim_child1 + ", cea_type_child1=" + cea_type_child1 + ", cea_amount_child1="
				+ cea_amount_child1 + ", amount_approve1=" + amount_approve1 + ", name_class_of_child2="
				+ name_class_of_child2 + ", period_of_claim_child2=" + period_of_claim_child2 + ", cea_type_child2="
				+ cea_type_child2 + ", cea_amount_child2=" + cea_amount_child2 + ", amount_approve2=" + amount_approve2
				+ ", amount_claimed=" + amount_claimed + ", amount_approved=" + amount_approved + ", entryDate="
				+ entryDate + ", editDate=" + editDate + ", nsDate=" + nsDate + ", soDate=" + soDate + ", noteStatus="
				+ noteStatus + ", sanctionStatus=" + sanctionStatus + ", sanctionNumber=" + sanctionNumber
				+ ", noteNumber=" + noteNumber + ", document=" + Arrays.toString(document) + "]";
	}

}
