package com.app.model;

import java.util.List;

public class ResponseParams {

	List<Employee_Family> family;
	
	private Long id;
	private String childNameOne;
	private String childAcadamicYearOne;
	private String childSchoolNameOne;
	
	
	private String childNameTwo;
	private String childAcadamicYearTwo;
	private String childSchoolNameTwo;
	
	private String empName;
	private String spouseName;
	
	private String empCode;
	private String designation;
	private String empOffice;
	
	private String spouseId;
	private String spouseOrg;
	private String spouseDesg;
	private String spouseAddress;
	private String callSign;
	
	private Integer serialNo;
	private String sequenceNo;
	private String childName;
	private String dob;
	private String age;
	
	private String childAcadamicYear;
	private String childSchoolName;
	
	private String distanceHostel;
	private String hostelSubsidy;
	
	private String disableChild;
	private String disableNature;
	private String disableCertificateDate;
	private String disablePercentage;
	
	private String bonafideCertificate;
	private String bonafideAmtAttached;
	private String bonafideAmt;
	
	private String acadamicYear;
	
	private String todayDate;
	
	public ResponseParams() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResponseParams(List<Employee_Family> family, Long id, String childNameOne, String childAcadamicYearOne,
			String childSchoolNameOne, String childNameTwo, String childAcadamicYearTwo, String childSchoolNameTwo,
			String empName, String spouseName, String empCode, String designation, String empOffice, String spouseId,
			String spouseOrg, String spouseDesg, String spouseAddress, String callSign, Integer serialNo,
			String sequenceNo, String childName, String dob, String age, String childAcadamicYear,
			String childSchoolName, String distanceHostel, String hostelSubsidy, String disableChild,
			String disableNature, String disableCertificateDate, String disablePercentage, String bonafideCertificate,
			String bonafideAmtAttached, String bonafideAmt, String acadamicYear, String todayDate) {
		super();
		this.family = family;
		this.id = id;
		this.childNameOne = childNameOne;
		this.childAcadamicYearOne = childAcadamicYearOne;
		this.childSchoolNameOne = childSchoolNameOne;
		this.childNameTwo = childNameTwo;
		this.childAcadamicYearTwo = childAcadamicYearTwo;
		this.childSchoolNameTwo = childSchoolNameTwo;
		this.empName = empName;
		this.spouseName = spouseName;
		this.empCode = empCode;
		this.designation = designation;
		this.empOffice = empOffice;
		this.spouseId = spouseId;
		this.spouseOrg = spouseOrg;
		this.spouseDesg = spouseDesg;
		this.spouseAddress = spouseAddress;
		this.callSign = callSign;
		this.serialNo = serialNo;
		this.sequenceNo = sequenceNo;
		this.childName = childName;
		this.dob = dob;
		this.age = age;
		this.childAcadamicYear = childAcadamicYear;
		this.childSchoolName = childSchoolName;
		this.distanceHostel = distanceHostel;
		this.hostelSubsidy = hostelSubsidy;
		this.disableChild = disableChild;
		this.disableNature = disableNature;
		this.disableCertificateDate = disableCertificateDate;
		this.disablePercentage = disablePercentage;
		this.bonafideCertificate = bonafideCertificate;
		this.bonafideAmtAttached = bonafideAmtAttached;
		this.bonafideAmt = bonafideAmt;
		this.acadamicYear = acadamicYear;
		this.todayDate = todayDate;
	}

	public List<Employee_Family> getFamily() {
		return family;
	}

	public void setFamily(List<Employee_Family> family) {
		this.family = family;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getChildNameOne() {
		return childNameOne;
	}

	public void setChildNameOne(String childNameOne) {
		this.childNameOne = childNameOne;
	}

	public String getChildAcadamicYearOne() {
		return childAcadamicYearOne;
	}

	public void setChildAcadamicYearOne(String childAcadamicYearOne) {
		this.childAcadamicYearOne = childAcadamicYearOne;
	}

	public String getChildSchoolNameOne() {
		return childSchoolNameOne;
	}

	public void setChildSchoolNameOne(String childSchoolNameOne) {
		this.childSchoolNameOne = childSchoolNameOne;
	}

	public String getChildNameTwo() {
		return childNameTwo;
	}

	public void setChildNameTwo(String childNameTwo) {
		this.childNameTwo = childNameTwo;
	}

	public String getChildAcadamicYearTwo() {
		return childAcadamicYearTwo;
	}

	public void setChildAcadamicYearTwo(String childAcadamicYearTwo) {
		this.childAcadamicYearTwo = childAcadamicYearTwo;
	}

	public String getChildSchoolNameTwo() {
		return childSchoolNameTwo;
	}

	public void setChildSchoolNameTwo(String childSchoolNameTwo) {
		this.childSchoolNameTwo = childSchoolNameTwo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getSpouseName() {
		return spouseName;
	}

	public void setSpouseName(String spouseName) {
		this.spouseName = spouseName;
	}

	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getEmpOffice() {
		return empOffice;
	}

	public void setEmpOffice(String empOffice) {
		this.empOffice = empOffice;
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

	public String getCallSign() {
		return callSign;
	}

	public void setCallSign(String callSign) {
		this.callSign = callSign;
	}

	public Integer getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(Integer serialNo) {
		this.serialNo = serialNo;
	}

	public String getSequenceNo() {
		return sequenceNo;
	}

	public void setSequenceNo(String sequenceNo) {
		this.sequenceNo = sequenceNo;
	}

	public String getChildName() {
		return childName;
	}

	public void setChildName(String childName) {
		this.childName = childName;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getChildAcadamicYear() {
		return childAcadamicYear;
	}

	public void setChildAcadamicYear(String childAcadamicYear) {
		this.childAcadamicYear = childAcadamicYear;
	}

	public String getChildSchoolName() {
		return childSchoolName;
	}

	public void setChildSchoolName(String childSchoolName) {
		this.childSchoolName = childSchoolName;
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

	public String getAcadamicYear() {
		return acadamicYear;
	}

	public void setAcadamicYear(String acadamicYear) {
		this.acadamicYear = acadamicYear;
	}

	public String getTodayDate() {
		return todayDate;
	}

	public void setTodayDate(String todayDate) {
		this.todayDate = todayDate;
	}

	@Override
	public String toString() {
		return "ResponseParams [family=" + family + ", id=" + id + ", childNameOne=" + childNameOne
				+ ", childAcadamicYearOne=" + childAcadamicYearOne + ", childSchoolNameOne=" + childSchoolNameOne
				+ ", childNameTwo=" + childNameTwo + ", childAcadamicYearTwo=" + childAcadamicYearTwo
				+ ", childSchoolNameTwo=" + childSchoolNameTwo + ", empName=" + empName + ", spouseName=" + spouseName
				+ ", empCode=" + empCode + ", designation=" + designation + ", empOffice=" + empOffice + ", spouseId="
				+ spouseId + ", spouseOrg=" + spouseOrg + ", spouseDesg=" + spouseDesg + ", spouseAddress="
				+ spouseAddress + ", callSign=" + callSign + ", serialNo=" + serialNo + ", sequenceNo=" + sequenceNo
				+ ", childName=" + childName + ", dob=" + dob + ", age=" + age + ", childAcadamicYear="
				+ childAcadamicYear + ", childSchoolName=" + childSchoolName + ", distanceHostel=" + distanceHostel
				+ ", hostelSubsidy=" + hostelSubsidy + ", disableChild=" + disableChild + ", disableNature="
				+ disableNature + ", disableCertificateDate=" + disableCertificateDate + ", disablePercentage="
				+ disablePercentage + ", bonafideCertificate=" + bonafideCertificate + ", bonafideAmtAttached="
				+ bonafideAmtAttached + ", bonafideAmt=" + bonafideAmt + ", acadamicYear=" + acadamicYear
				+ ", todayDate=" + todayDate + "]";
	}


	 

}