package com.app.empapplyforms;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="gpfadvanceapplyforms")
public class EmpGPFAdvanceApplyForm {

	@Id
	@GeneratedValue
	private Long id;
	private Integer empCode;
	
	private String gpfAccNo;
	private String financialYear;
	private String closingBalance;
	private String creditOnAccountFrom;
	private String creditOnAccountTo;
	private String creditOnAccountRs;
	private String refundFrom;
	private String refundTo;
	private String refundRs;
	private String total;
	private String withdrawPeriodFrom;
	private String withdrawPeriodTo;
	private String withdrawAmt;
	private String netCreditBalance;
	private String amtAdvanceOutstanding;
	private String amtAdvanceRequired;
	private String advancePurpose;
	private String requestRulesCovered;
	private String plotLocAndMeasure;
	private String plotFreehold;
	private String planForConstruction;
	private String platPurchaseSociety;
	private String costOfConstruction;
	private String platPurchaseBoard;
	private String nameOfSChildren;
	private String childrenInstitution;
	private String scholarOrHostler;
	private String patientNameAndRelation;
	private String hospitalName;
	private String indoorOrOutdoor;
	private String reimbursement;
	private String advanceAmt;
	private String installments;
	private String pecuniaryCircumstances;
	public EmpGPFAdvanceApplyForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmpGPFAdvanceApplyForm(Long id, Integer empCode, String gpfAccNo, String financialYear,
			String closingBalance, String creditOnAccountFrom, String creditOnAccountTo, String creditOnAccountRs,
			String refundFrom, String refundTo, String refundRs, String total, String withdrawPeriodFrom,
			String withdrawPeriodTo, String withdrawAmt, String netCreditBalance, String amtAdvanceOutstanding,
			String amtAdvanceRequired, String advancePurpose, String requestRulesCovered, String plotLocAndMeasure,
			String plotFreehold, String planForConstruction, String platPurchaseSociety, String costOfConstruction,
			String platPurchaseBoard, String nameOfSChildren, String childrenInstitution, String scholarOrHostler,
			String patientNameAndRelation, String hospitalName, String indoorOrOutdoor, String reimbursement,
			String advanceAmt, String installments, String pecuniaryCircumstances) {
		super();
		this.id = id;
		this.empCode = empCode;
		this.gpfAccNo = gpfAccNo;
		this.financialYear = financialYear;
		this.closingBalance = closingBalance;
		this.creditOnAccountFrom = creditOnAccountFrom;
		this.creditOnAccountTo = creditOnAccountTo;
		this.creditOnAccountRs = creditOnAccountRs;
		this.refundFrom = refundFrom;
		this.refundTo = refundTo;
		this.refundRs = refundRs;
		this.total = total;
		this.withdrawPeriodFrom = withdrawPeriodFrom;
		this.withdrawPeriodTo = withdrawPeriodTo;
		this.withdrawAmt = withdrawAmt;
		this.netCreditBalance = netCreditBalance;
		this.amtAdvanceOutstanding = amtAdvanceOutstanding;
		this.amtAdvanceRequired = amtAdvanceRequired;
		this.advancePurpose = advancePurpose;
		this.requestRulesCovered = requestRulesCovered;
		this.plotLocAndMeasure = plotLocAndMeasure;
		this.plotFreehold = plotFreehold;
		this.planForConstruction = planForConstruction;
		this.platPurchaseSociety = platPurchaseSociety;
		this.costOfConstruction = costOfConstruction;
		this.platPurchaseBoard = platPurchaseBoard;
		this.nameOfSChildren = nameOfSChildren;
		this.childrenInstitution = childrenInstitution;
		this.scholarOrHostler = scholarOrHostler;
		this.patientNameAndRelation = patientNameAndRelation;
		this.hospitalName = hospitalName;
		this.indoorOrOutdoor = indoorOrOutdoor;
		this.reimbursement = reimbursement;
		this.advanceAmt = advanceAmt;
		this.installments = installments;
		this.pecuniaryCircumstances = pecuniaryCircumstances;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getEmpCode() {
		return empCode;
	}
	public void setEmpCode(Integer empCode) {
		this.empCode = empCode;
	}
	public String getGpfAccNo() {
		return gpfAccNo;
	}
	public void setGpfAccNo(String gpfAccNo) {
		this.gpfAccNo = gpfAccNo;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public String getClosingBalance() {
		return closingBalance;
	}
	public void setClosingBalance(String closingBalance) {
		this.closingBalance = closingBalance;
	}
	public String getCreditOnAccountFrom() {
		return creditOnAccountFrom;
	}
	public void setCreditOnAccountFrom(String creditOnAccountFrom) {
		this.creditOnAccountFrom = creditOnAccountFrom;
	}
	public String getCreditOnAccountTo() {
		return creditOnAccountTo;
	}
	public void setCreditOnAccountTo(String creditOnAccountTo) {
		this.creditOnAccountTo = creditOnAccountTo;
	}
	public String getCreditOnAccountRs() {
		return creditOnAccountRs;
	}
	public void setCreditOnAccountRs(String creditOnAccountRs) {
		this.creditOnAccountRs = creditOnAccountRs;
	}
	public String getRefundFrom() {
		return refundFrom;
	}
	public void setRefundFrom(String refundFrom) {
		this.refundFrom = refundFrom;
	}
	public String getRefundTo() {
		return refundTo;
	}
	public void setRefundTo(String refundTo) {
		this.refundTo = refundTo;
	}
	public String getRefundRs() {
		return refundRs;
	}
	public void setRefundRs(String refundRs) {
		this.refundRs = refundRs;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getWithdrawPeriodFrom() {
		return withdrawPeriodFrom;
	}
	public void setWithdrawPeriodFrom(String withdrawPeriodFrom) {
		this.withdrawPeriodFrom = withdrawPeriodFrom;
	}
	public String getWithdrawPeriodTo() {
		return withdrawPeriodTo;
	}
	public void setWithdrawPeriodTo(String withdrawPeriodTo) {
		this.withdrawPeriodTo = withdrawPeriodTo;
	}
	public String getWithdrawAmt() {
		return withdrawAmt;
	}
	public void setWithdrawAmt(String withdrawAmt) {
		this.withdrawAmt = withdrawAmt;
	}
	public String getNetCreditBalance() {
		return netCreditBalance;
	}
	public void setNetCreditBalance(String netCreditBalance) {
		this.netCreditBalance = netCreditBalance;
	}
	public String getAmtAdvanceOutstanding() {
		return amtAdvanceOutstanding;
	}
	public void setAmtAdvanceOutstanding(String amtAdvanceOutstanding) {
		this.amtAdvanceOutstanding = amtAdvanceOutstanding;
	}
	public String getAmtAdvanceRequired() {
		return amtAdvanceRequired;
	}
	public void setAmtAdvanceRequired(String amtAdvanceRequired) {
		this.amtAdvanceRequired = amtAdvanceRequired;
	}
	public String getAdvancePurpose() {
		return advancePurpose;
	}
	public void setAdvancePurpose(String advancePurpose) {
		this.advancePurpose = advancePurpose;
	}
	public String getRequestRulesCovered() {
		return requestRulesCovered;
	}
	public void setRequestRulesCovered(String requestRulesCovered) {
		this.requestRulesCovered = requestRulesCovered;
	}
	public String getPlotLocAndMeasure() {
		return plotLocAndMeasure;
	}
	public void setPlotLocAndMeasure(String plotLocAndMeasure) {
		this.plotLocAndMeasure = plotLocAndMeasure;
	}
	public String getPlotFreehold() {
		return plotFreehold;
	}
	public void setPlotFreehold(String plotFreehold) {
		this.plotFreehold = plotFreehold;
	}
	public String getPlanForConstruction() {
		return planForConstruction;
	}
	public void setPlanForConstruction(String planForConstruction) {
		this.planForConstruction = planForConstruction;
	}
	public String getPlatPurchaseSociety() {
		return platPurchaseSociety;
	}
	public void setPlatPurchaseSociety(String platPurchaseSociety) {
		this.platPurchaseSociety = platPurchaseSociety;
	}
	public String getCostOfConstruction() {
		return costOfConstruction;
	}
	public void setCostOfConstruction(String costOfConstruction) {
		this.costOfConstruction = costOfConstruction;
	}
	public String getPlatPurchaseBoard() {
		return platPurchaseBoard;
	}
	public void setPlatPurchaseBoard(String platPurchaseBoard) {
		this.platPurchaseBoard = platPurchaseBoard;
	}
	public String getNameOfSChildren() {
		return nameOfSChildren;
	}
	public void setNameOfSChildren(String nameOfSChildren) {
		this.nameOfSChildren = nameOfSChildren;
	}
	public String getChildrenInstitution() {
		return childrenInstitution;
	}
	public void setChildrenInstitution(String childrenInstitution) {
		this.childrenInstitution = childrenInstitution;
	}
	public String getScholarOrHostler() {
		return scholarOrHostler;
	}
	public void setScholarOrHostler(String scholarOrHostler) {
		this.scholarOrHostler = scholarOrHostler;
	}
	public String getPatientNameAndRelation() {
		return patientNameAndRelation;
	}
	public void setPatientNameAndRelation(String patientNameAndRelation) {
		this.patientNameAndRelation = patientNameAndRelation;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getIndoorOrOutdoor() {
		return indoorOrOutdoor;
	}
	public void setIndoorOrOutdoor(String indoorOrOutdoor) {
		this.indoorOrOutdoor = indoorOrOutdoor;
	}
	public String getReimbursement() {
		return reimbursement;
	}
	public void setReimbursement(String reimbursement) {
		this.reimbursement = reimbursement;
	}
	public String getAdvanceAmt() {
		return advanceAmt;
	}
	public void setAdvanceAmt(String advanceAmt) {
		this.advanceAmt = advanceAmt;
	}
	public String getInstallments() {
		return installments;
	}
	public void setInstallments(String installments) {
		this.installments = installments;
	}
	public String getPecuniaryCircumstances() {
		return pecuniaryCircumstances;
	}
	public void setPecuniaryCircumstances(String pecuniaryCircumstances) {
		this.pecuniaryCircumstances = pecuniaryCircumstances;
	}
	@Override
	public String toString() {
		return "EmpGPFAdvanceApplyForm [id=" + id + ", empCode=" + empCode + ", gpfAccNo=" + gpfAccNo
				+ ", financialYear=" + financialYear + ", closingBalance=" + closingBalance + ", creditOnAccountFrom="
				+ creditOnAccountFrom + ", creditOnAccountTo=" + creditOnAccountTo + ", creditOnAccountRs="
				+ creditOnAccountRs + ", refundFrom=" + refundFrom + ", refundTo=" + refundTo + ", refundRs=" + refundRs
				+ ", total=" + total + ", withdrawPeriodFrom=" + withdrawPeriodFrom + ", withdrawPeriodTo="
				+ withdrawPeriodTo + ", withdrawAmt=" + withdrawAmt + ", netCreditBalance=" + netCreditBalance
				+ ", amtAdvanceOutstanding=" + amtAdvanceOutstanding + ", amtAdvanceRequired=" + amtAdvanceRequired
				+ ", advancePurpose=" + advancePurpose + ", requestRulesCovered=" + requestRulesCovered
				+ ", plotLocAndMeasure=" + plotLocAndMeasure + ", plotFreehold=" + plotFreehold
				+ ", planForConstruction=" + planForConstruction + ", platPurchaseSociety=" + platPurchaseSociety
				+ ", costOfConstruction=" + costOfConstruction + ", platPurchaseBoard=" + platPurchaseBoard
				+ ", nameOfSChildren=" + nameOfSChildren + ", childrenInstitution=" + childrenInstitution
				+ ", scholarOrHostler=" + scholarOrHostler + ", patientNameAndRelation=" + patientNameAndRelation
				+ ", hospitalName=" + hospitalName + ", indoorOrOutdoor=" + indoorOrOutdoor + ", reimbursement="
				+ reimbursement + ", advanceAmt=" + advanceAmt + ", installments=" + installments
				+ ", pecuniaryCircumstances=" + pecuniaryCircumstances + "]";
	}
	
}
