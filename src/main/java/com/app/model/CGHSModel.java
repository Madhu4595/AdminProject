package com.app.model;

import java.util.HashSet;
import java.util.Set;

import com.app.entity.CGHSBills;

public class CGHSModel {
	
	private String cghsId;
	
	private String empCode;
	private String empName;
	private String ecghsCode;
	private String address;
	
	private String patientId;
	private String patientName;
	private String patientCghsCode;
	private String patientRelation;

	private String wardEntitlement;

	private String hospitalName;
	private String empalledUnderCGHS;
	private String opdTreatment;
	private String indoorTreatment;
	private String emergencyTreatment;
	private String treatmentPermission;
	private String medicalAdvanceDetails;
	private String healthMedicalInsuranceScheme;
	private String healthMedicalInsuranceSchemeIfYes;
	
	private Set<CGHSBills> cGHSBills = new HashSet<CGHSBills>();
	
	private Integer opdTotal;
	private Integer indoorTotal;
	private Integer testsTotal;
	private Integer procedureTotal;
	
	private String date;
	private String place;
	
	private String strDoc;
	
	public CGHSModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CGHSModel(String cghsId, String empCode, String empName, String ecghsCode, String address, String patientId,
			String patientName, String patientCghsCode, String patientRelation, String wardEntitlement,
			String hospitalName, String empalledUnderCGHS, String opdTreatment, String indoorTreatment,
			String emergencyTreatment, String treatmentPermission, String medicalAdvanceDetails,
			String healthMedicalInsuranceScheme, String healthMedicalInsuranceSchemeIfYes, Set<CGHSBills> cGHSBills,
			Integer opdTotal, Integer indoorTotal, Integer testsTotal, Integer procedureTotal, String date,
			String place, String strDoc) {
		super();
		this.cghsId = cghsId;
		this.empCode = empCode;
		this.empName = empName;
		this.ecghsCode = ecghsCode;
		this.address = address;
		this.patientId = patientId;
		this.patientName = patientName;
		this.patientCghsCode = patientCghsCode;
		this.patientRelation = patientRelation;
		this.wardEntitlement = wardEntitlement;
		this.hospitalName = hospitalName;
		this.empalledUnderCGHS = empalledUnderCGHS;
		this.opdTreatment = opdTreatment;
		this.indoorTreatment = indoorTreatment;
		this.emergencyTreatment = emergencyTreatment;
		this.treatmentPermission = treatmentPermission;
		this.medicalAdvanceDetails = medicalAdvanceDetails;
		this.healthMedicalInsuranceScheme = healthMedicalInsuranceScheme;
		this.healthMedicalInsuranceSchemeIfYes = healthMedicalInsuranceSchemeIfYes;
		this.cGHSBills = cGHSBills;
		this.opdTotal = opdTotal;
		this.indoorTotal = indoorTotal;
		this.testsTotal = testsTotal;
		this.procedureTotal = procedureTotal;
		this.date = date;
		this.place = place;
		this.strDoc = strDoc;
	}

	public String getCghsId() {
		return cghsId;
	}

	public void setCghsId(String cghsId) {
		this.cghsId = cghsId;
	}

	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEcghsCode() {
		return ecghsCode;
	}

	public void setEcghsCode(String ecghsCode) {
		this.ecghsCode = ecghsCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientCghsCode() {
		return patientCghsCode;
	}

	public void setPatientCghsCode(String patientCghsCode) {
		this.patientCghsCode = patientCghsCode;
	}

	public String getPatientRelation() {
		return patientRelation;
	}

	public void setPatientRelation(String patientRelation) {
		this.patientRelation = patientRelation;
	}

	public String getWardEntitlement() {
		return wardEntitlement;
	}

	public void setWardEntitlement(String wardEntitlement) {
		this.wardEntitlement = wardEntitlement;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getEmpalledUnderCGHS() {
		return empalledUnderCGHS;
	}

	public void setEmpalledUnderCGHS(String empalledUnderCGHS) {
		this.empalledUnderCGHS = empalledUnderCGHS;
	}

	public String getOpdTreatment() {
		return opdTreatment;
	}

	public void setOpdTreatment(String opdTreatment) {
		this.opdTreatment = opdTreatment;
	}

	public String getIndoorTreatment() {
		return indoorTreatment;
	}

	public void setIndoorTreatment(String indoorTreatment) {
		this.indoorTreatment = indoorTreatment;
	}

	public String getEmergencyTreatment() {
		return emergencyTreatment;
	}

	public void setEmergencyTreatment(String emergencyTreatment) {
		this.emergencyTreatment = emergencyTreatment;
	}

	public String getTreatmentPermission() {
		return treatmentPermission;
	}

	public void setTreatmentPermission(String treatmentPermission) {
		this.treatmentPermission = treatmentPermission;
	}

	public String getMedicalAdvanceDetails() {
		return medicalAdvanceDetails;
	}

	public void setMedicalAdvanceDetails(String medicalAdvanceDetails) {
		this.medicalAdvanceDetails = medicalAdvanceDetails;
	}

	public String getHealthMedicalInsuranceScheme() {
		return healthMedicalInsuranceScheme;
	}

	public void setHealthMedicalInsuranceScheme(String healthMedicalInsuranceScheme) {
		this.healthMedicalInsuranceScheme = healthMedicalInsuranceScheme;
	}

	public String getHealthMedicalInsuranceSchemeIfYes() {
		return healthMedicalInsuranceSchemeIfYes;
	}

	public void setHealthMedicalInsuranceSchemeIfYes(String healthMedicalInsuranceSchemeIfYes) {
		this.healthMedicalInsuranceSchemeIfYes = healthMedicalInsuranceSchemeIfYes;
	}

	public Set<CGHSBills> getcGHSBills() {
		return cGHSBills;
	}

	public void setcGHSBills(Set<CGHSBills> cGHSBills) {
		this.cGHSBills = cGHSBills;
	}

	public Integer getOpdTotal() {
		return opdTotal;
	}

	public void setOpdTotal(Integer opdTotal) {
		this.opdTotal = opdTotal;
	}

	public Integer getIndoorTotal() {
		return indoorTotal;
	}

	public void setIndoorTotal(Integer indoorTotal) {
		this.indoorTotal = indoorTotal;
	}

	public Integer getTestsTotal() {
		return testsTotal;
	}

	public void setTestsTotal(Integer testsTotal) {
		this.testsTotal = testsTotal;
	}

	public Integer getProcedureTotal() {
		return procedureTotal;
	}

	public void setProcedureTotal(Integer procedureTotal) {
		this.procedureTotal = procedureTotal;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getStrDoc() {
		return strDoc;
	}

	public void setStrDoc(String strDoc) {
		this.strDoc = strDoc;
	}

	@Override
	public String toString() {
		return "CGHSModel [cghsId=" + cghsId + ", empCode=" + empCode + ", empName=" + empName + ", ecghsCode="
				+ ecghsCode + ", address=" + address + ", patientId=" + patientId + ", patientName=" + patientName
				+ ", patientCghsCode=" + patientCghsCode + ", patientRelation=" + patientRelation + ", wardEntitlement="
				+ wardEntitlement + ", hospitalName=" + hospitalName + ", empalledUnderCGHS=" + empalledUnderCGHS
				+ ", opdTreatment=" + opdTreatment + ", indoorTreatment=" + indoorTreatment + ", emergencyTreatment="
				+ emergencyTreatment + ", treatmentPermission=" + treatmentPermission + ", medicalAdvanceDetails="
				+ medicalAdvanceDetails + ", healthMedicalInsuranceScheme=" + healthMedicalInsuranceScheme
				+ ", healthMedicalInsuranceSchemeIfYes=" + healthMedicalInsuranceSchemeIfYes + ", cGHSBills="
				+ cGHSBills + ", opdTotal=" + opdTotal + ", indoorTotal=" + indoorTotal + ", testsTotal=" + testsTotal
				+ ", procedureTotal=" + procedureTotal + ", date=" + date + ", place=" + place + ", strDoc=" + strDoc
				+ "]";
	}

	

}
