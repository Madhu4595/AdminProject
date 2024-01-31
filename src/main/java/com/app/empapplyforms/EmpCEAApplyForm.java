package com.app.empapplyforms;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="empceaapplications")
public class EmpCEAApplyForm {
	
	@Id
	@GeneratedValue
	private Long id;
	private Integer empCode;
	
	private String spouseId;
	private String spouseOrg;
	private String spouseDesg;
	private String spouseAddress;
	
	private String noOfChilds;
	
	private String childId1;
	private String childAcademicYear1;
	private String childSchoolName1;
	private String claimfor1;
	
	private String childId2;
	private String childAcademicYear2;
	private String childSchoolName2;
	private String claimfor2;
	
	private String distanceHostel;
	private String hostelSubsidy;
	
	private String disableChild;
	private String disableNature;
	private String disableCertificateDate;
	private String disablePercentage;
	
	private String bonafideCertificate;
	private String bonafideAmtAttached;
	private String bonafideAmt;
	
	private String financialYear;
	
	
	public EmpCEAApplyForm() {
		super();
		// TODO Auto-generated constructor stub
	}


	public EmpCEAApplyForm(Long id, Integer empCode, String spouseId, String spouseOrg, String spouseDesg,
			String spouseAddress, String noOfChilds, String childId1, String childAcademicYear1,
			String childSchoolName1, String claimfor1, String childId2, String childAcademicYear2,
			String childSchoolName2, String claimfor2, String distanceHostel, String hostelSubsidy, String disableChild,
			String disableNature, String disableCertificateDate, String disablePercentage, String bonafideCertificate,
			String bonafideAmtAttached, String bonafideAmt, String financialYear) {
		super();
		this.id = id;
		this.empCode = empCode;
		this.spouseId = spouseId;
		this.spouseOrg = spouseOrg;
		this.spouseDesg = spouseDesg;
		this.spouseAddress = spouseAddress;
		this.noOfChilds = noOfChilds;
		this.childId1 = childId1;
		this.childAcademicYear1 = childAcademicYear1;
		this.childSchoolName1 = childSchoolName1;
		this.claimfor1 = claimfor1;
		this.childId2 = childId2;
		this.childAcademicYear2 = childAcademicYear2;
		this.childSchoolName2 = childSchoolName2;
		this.claimfor2 = claimfor2;
		this.distanceHostel = distanceHostel;
		this.hostelSubsidy = hostelSubsidy;
		this.disableChild = disableChild;
		this.disableNature = disableNature;
		this.disableCertificateDate = disableCertificateDate;
		this.disablePercentage = disablePercentage;
		this.bonafideCertificate = bonafideCertificate;
		this.bonafideAmtAttached = bonafideAmtAttached;
		this.bonafideAmt = bonafideAmt;
		this.financialYear = financialYear;
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


	public String getSpouseId() {
		return spouseId;
	}


	public void setSpouseId(String spouseId) {
		this.spouseId = spouseId;
	}


	public String getSpouseOrg() {
		return spouseOrg;
	}


	public void setSpouseOrg(String spouseOrg) {
		this.spouseOrg = spouseOrg;
	}


	public String getSpouseDesg() {
		return spouseDesg;
	}


	public void setSpouseDesg(String spouseDesg) {
		this.spouseDesg = spouseDesg;
	}


	public String getSpouseAddress() {
		return spouseAddress;
	}


	public void setSpouseAddress(String spouseAddress) {
		this.spouseAddress = spouseAddress;
	}


	public String getNoOfChilds() {
		return noOfChilds;
	}


	public void setNoOfChilds(String noOfChilds) {
		this.noOfChilds = noOfChilds;
	}


	public String getChildId1() {
		return childId1;
	}


	public void setChildId1(String childId1) {
		this.childId1 = childId1;
	}


	public String getChildAcademicYear1() {
		return childAcademicYear1;
	}


	public void setChildAcademicYear1(String childAcademicYear1) {
		this.childAcademicYear1 = childAcademicYear1;
	}


	public String getChildSchoolName1() {
		return childSchoolName1;
	}


	public void setChildSchoolName1(String childSchoolName1) {
		this.childSchoolName1 = childSchoolName1;
	}


	public String getClaimfor1() {
		return claimfor1;
	}


	public void setClaimfor1(String claimfor1) {
		this.claimfor1 = claimfor1;
	}


	public String getChildId2() {
		return childId2;
	}


	public void setChildId2(String childId2) {
		this.childId2 = childId2;
	}


	public String getChildAcademicYear2() {
		return childAcademicYear2;
	}


	public void setChildAcademicYear2(String childAcademicYear2) {
		this.childAcademicYear2 = childAcademicYear2;
	}


	public String getChildSchoolName2() {
		return childSchoolName2;
	}


	public void setChildSchoolName2(String childSchoolName2) {
		this.childSchoolName2 = childSchoolName2;
	}


	public String getClaimfor2() {
		return claimfor2;
	}


	public void setClaimfor2(String claimfor2) {
		this.claimfor2 = claimfor2;
	}


	public String getDistanceHostel() {
		return distanceHostel;
	}


	public void setDistanceHostel(String distanceHostel) {
		this.distanceHostel = distanceHostel;
	}


	public String getHostelSubsidy() {
		return hostelSubsidy;
	}


	public void setHostelSubsidy(String hostelSubsidy) {
		this.hostelSubsidy = hostelSubsidy;
	}


	public String getDisableChild() {
		return disableChild;
	}


	public void setDisableChild(String disableChild) {
		this.disableChild = disableChild;
	}


	public String getDisableNature() {
		return disableNature;
	}


	public void setDisableNature(String disableNature) {
		this.disableNature = disableNature;
	}


	public String getDisableCertificateDate() {
		return disableCertificateDate;
	}


	public void setDisableCertificateDate(String disableCertificateDate) {
		this.disableCertificateDate = disableCertificateDate;
	}


	public String getDisablePercentage() {
		return disablePercentage;
	}


	public void setDisablePercentage(String disablePercentage) {
		this.disablePercentage = disablePercentage;
	}


	public String getBonafideCertificate() {
		return bonafideCertificate;
	}


	public void setBonafideCertificate(String bonafideCertificate) {
		this.bonafideCertificate = bonafideCertificate;
	}


	public String getBonafideAmtAttached() {
		return bonafideAmtAttached;
	}


	public void setBonafideAmtAttached(String bonafideAmtAttached) {
		this.bonafideAmtAttached = bonafideAmtAttached;
	}


	public String getBonafideAmt() {
		return bonafideAmt;
	}


	public void setBonafideAmt(String bonafideAmt) {
		this.bonafideAmt = bonafideAmt;
	}


	public String getFinancialYear() {
		return financialYear;
	}


	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}


	@Override
	public String toString() {
		return "EmpCEAApplyForm [id=" + id + ", empCode=" + empCode + ", spouseId=" + spouseId + ", spouseOrg="
				+ spouseOrg + ", spouseDesg=" + spouseDesg + ", spouseAddress=" + spouseAddress + ", noOfChilds="
				+ noOfChilds + ", childId1=" + childId1 + ", childAcademicYear1=" + childAcademicYear1
				+ ", childSchoolName1=" + childSchoolName1 + ", claimfor1=" + claimfor1 + ", childId2=" + childId2
				+ ", childAcademicYear2=" + childAcademicYear2 + ", childSchoolName2=" + childSchoolName2
				+ ", claimfor2=" + claimfor2 + ", distanceHostel=" + distanceHostel + ", hostelSubsidy=" + hostelSubsidy
				+ ", disableChild=" + disableChild + ", disableNature=" + disableNature + ", disableCertificateDate="
				+ disableCertificateDate + ", disablePercentage=" + disablePercentage + ", bonafideCertificate="
				+ bonafideCertificate + ", bonafideAmtAttached=" + bonafideAmtAttached + ", bonafideAmt=" + bonafideAmt
				+ ", financialYear=" + financialYear + "]";
	}


}
