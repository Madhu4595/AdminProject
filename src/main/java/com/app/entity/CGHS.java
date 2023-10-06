package com.app.entity;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.app.util.StringPrefixedSequenceIdGenerator;
@Entity
@Table(name="cghs")
public class CGHS {
	
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cghs_seq")
    @GenericGenerator(
        name = "cghs_seq", 
        strategy = "com.app.util.StringPrefixedSequenceIdGenerator", 
        parameters = {
            @Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "CGHS"),
            @Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%04d") })
	private String cghsId;
	
	private String empCode;
	private String patientId;

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
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="cghsBillsFk")
	private Set<CGHSBills> cGHSBills = new HashSet<CGHSBills>();
	
	private byte[] document;
	
	
	public CGHS() {
		super();
		// TODO Auto-generated constructor stub
	}


	public CGHS(String cghsId, String empCode, String patientId, String wardEntitlement, String hospitalName,
			String empalledUnderCGHS, String opdTreatment, String indoorTreatment, String emergencyTreatment,
			String treatmentPermission, String medicalAdvanceDetails, String healthMedicalInsuranceScheme,
			String healthMedicalInsuranceSchemeIfYes, Set<CGHSBills> cGHSBills, byte[] document) {
		super();
		this.cghsId = cghsId;
		this.empCode = empCode;
		this.patientId = patientId;
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
		this.document = document;
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


	public String getPatientId() {
		return patientId;
	}


	public void setPatientId(String patientId) {
		this.patientId = patientId;
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


	public byte[] getDocument() {
		return document;
	}


	public void setDocument(byte[] document) {
		this.document = document;
	}


	@Override
	public String toString() {
		return "CGHS [cghsId=" + cghsId + ", empCode=" + empCode + ", patientId=" + patientId + ", wardEntitlement="
				+ wardEntitlement + ", hospitalName=" + hospitalName + ", empalledUnderCGHS=" + empalledUnderCGHS
				+ ", opdTreatment=" + opdTreatment + ", indoorTreatment=" + indoorTreatment + ", emergencyTreatment="
				+ emergencyTreatment + ", treatmentPermission=" + treatmentPermission + ", medicalAdvanceDetails="
				+ medicalAdvanceDetails + ", healthMedicalInsuranceScheme=" + healthMedicalInsuranceScheme
				+ ", healthMedicalInsuranceSchemeIfYes=" + healthMedicalInsuranceSchemeIfYes + ", cGHSBills="
				+ cGHSBills + ", document=" + Arrays.toString(document) + "]";
	}

}
