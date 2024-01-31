package com.app.empapplyforms;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="empgpfapplications")
public class EmpGPFApplyForm {
	
	@Id
	@GeneratedValue
	private Long id;
	private Integer empCode;
	
	private String gpfAccNo;
	private String closingBalanceyear;
	private String closingBalanceRs;
	
	private String creditFrom;
	private String creditTo;
	private String creditRs;
	
	private String refundRs;
	
	private String withdrawPeriodFrom;
	private String withdrawPeriodTo;
	private String withdrawPeriodRs;
	
	private String netCreditDate;
	private String netCreditRs;
	
	private String withdrawPurpose;
	private String withdrawRule;
	
	private String earlierWithdrawRs;
	private String earlierWithdrawYear;
	
	private String pfAccount;

	public EmpGPFApplyForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmpGPFApplyForm(Long id, Integer empCode, String gpfAccNo, String closingBalanceyear,
			String closingBalanceRs, String creditFrom, String creditTo, String creditRs, String refundRs,
			String withdrawPeriodFrom, String withdrawPeriodTo, String withdrawPeriodRs, String netCreditDate,
			String netCreditRs, String withdrawPurpose, String withdrawRule, String earlierWithdrawRs,
			String earlierWithdrawYear, String pfAccount) {
		super();
		this.id = id;
		this.empCode = empCode;
		this.gpfAccNo = gpfAccNo;
		this.closingBalanceyear = closingBalanceyear;
		this.closingBalanceRs = closingBalanceRs;
		this.creditFrom = creditFrom;
		this.creditTo = creditTo;
		this.creditRs = creditRs;
		this.refundRs = refundRs;
		this.withdrawPeriodFrom = withdrawPeriodFrom;
		this.withdrawPeriodTo = withdrawPeriodTo;
		this.withdrawPeriodRs = withdrawPeriodRs;
		this.netCreditDate = netCreditDate;
		this.netCreditRs = netCreditRs;
		this.withdrawPurpose = withdrawPurpose;
		this.withdrawRule = withdrawRule;
		this.earlierWithdrawRs = earlierWithdrawRs;
		this.earlierWithdrawYear = earlierWithdrawYear;
		this.pfAccount = pfAccount;
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

	public String getClosingBalanceyear() {
		return closingBalanceyear;
	}

	public void setClosingBalanceyear(String closingBalanceyear) {
		this.closingBalanceyear = closingBalanceyear;
	}

	public String getClosingBalanceRs() {
		return closingBalanceRs;
	}

	public void setClosingBalanceRs(String closingBalanceRs) {
		this.closingBalanceRs = closingBalanceRs;
	}

	public String getCreditFrom() {
		return creditFrom;
	}

	public void setCreditFrom(String creditFrom) {
		this.creditFrom = creditFrom;
	}

	public String getCreditTo() {
		return creditTo;
	}

	public void setCreditTo(String creditTo) {
		this.creditTo = creditTo;
	}

	public String getCreditRs() {
		return creditRs;
	}

	public void setCreditRs(String creditRs) {
		this.creditRs = creditRs;
	}

	public String getRefundRs() {
		return refundRs;
	}

	public void setRefundRs(String refundRs) {
		this.refundRs = refundRs;
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

	public String getWithdrawPeriodRs() {
		return withdrawPeriodRs;
	}

	public void setWithdrawPeriodRs(String withdrawPeriodRs) {
		this.withdrawPeriodRs = withdrawPeriodRs;
	}

	public String getNetCreditDate() {
		return netCreditDate;
	}

	public void setNetCreditDate(String netCreditDate) {
		this.netCreditDate = netCreditDate;
	}

	public String getNetCreditRs() {
		return netCreditRs;
	}

	public void setNetCreditRs(String netCreditRs) {
		this.netCreditRs = netCreditRs;
	}

	public String getWithdrawPurpose() {
		return withdrawPurpose;
	}

	public void setWithdrawPurpose(String withdrawPurpose) {
		this.withdrawPurpose = withdrawPurpose;
	}

	public String getWithdrawRule() {
		return withdrawRule;
	}

	public void setWithdrawRule(String withdrawRule) {
		this.withdrawRule = withdrawRule;
	}

	public String getEarlierWithdrawRs() {
		return earlierWithdrawRs;
	}

	public void setEarlierWithdrawRs(String earlierWithdrawRs) {
		this.earlierWithdrawRs = earlierWithdrawRs;
	}

	public String getEarlierWithdrawYear() {
		return earlierWithdrawYear;
	}

	public void setEarlierWithdrawYear(String earlierWithdrawYear) {
		this.earlierWithdrawYear = earlierWithdrawYear;
	}

	public String getPfAccount() {
		return pfAccount;
	}

	public void setPfAccount(String pfAccount) {
		this.pfAccount = pfAccount;
	}

	@Override
	public String toString() {
		return "EmpGPFApplyForm [id=" + id + ", empCode=" + empCode + ", gpfAccNo=" + gpfAccNo + ", closingBalanceyear="
				+ closingBalanceyear + ", closingBalanceRs=" + closingBalanceRs + ", creditFrom=" + creditFrom
				+ ", creditTo=" + creditTo + ", creditRs=" + creditRs + ", refundRs=" + refundRs
				+ ", withdrawPeriodFrom=" + withdrawPeriodFrom + ", withdrawPeriodTo=" + withdrawPeriodTo
				+ ", withdrawPeriodRs=" + withdrawPeriodRs + ", netCreditDate=" + netCreditDate + ", netCreditRs="
				+ netCreditRs + ", withdrawPurpose=" + withdrawPurpose + ", withdrawRule=" + withdrawRule
				+ ", earlierWithdrawRs=" + earlierWithdrawRs + ", earlierWithdrawYear=" + earlierWithdrawYear
				+ ", pfAccount=" + pfAccount + "]";
	}
	

}
