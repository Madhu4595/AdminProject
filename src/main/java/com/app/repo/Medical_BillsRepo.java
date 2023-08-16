package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.app.entity.Medical_Bills;

public interface Medical_BillsRepo extends JpaRepository<Medical_Bills, Long> {

	@Query(value = "select * from medic_bills where  cast(request_no as character varying)=:request_no and bill_no=:bill_no", nativeQuery = true)
	public Medical_Bills getByReqNoAndBillNo(String request_no, String bill_no);

	@Query(value = "select * from medic_bills where  cast(request_no as character varying)=:request_no and emp_code=:emp_code", nativeQuery = true)
	public List<Medical_Bills> getByReqNoAndEmpcode(String request_no, String emp_code);

	@Query(value = "select * from medic_bills where request_no=:request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNo(Integer request_no);

	@Query(value = "select * from medic_bills where emp_code=:emp_code", nativeQuery = true)
	public List<Medical_Bills> getByEmpcode(String emp_code);

	@Query(value = "delete from medic_bills where request_no=:request_no", nativeQuery = true)
	@Modifying
	@Transactional
	public void deleteByReqNo(Integer request_no);

	// ==========================NOTESHEET=============================
	@Query(value = "select * from medic_bills where request_no=:request_no and note_status=false order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoNS(Integer request_no);

	// @Query(value="select * from medic_bills where emp_code=:emp_code and
	// note_status=false order by request_no", nativeQuery = true)
	@Query(value = "select * from medic_bills where emp_code=:emp_code order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByEmpcodeNS(String emp_code);

	@Query(value = "select * from medic_bills where  cast(request_no as character varying)=:request_no and emp_code=:emp_code and note_status=false order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoAndEmpcodeNS(String request_no, String emp_code);

	@Query(value = "select * from medic_bills where request_no=:request_no and note_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoNSPrint(Integer request_no);

	// Sanction Order
	@Query(value = "select * from medic_bills where request_no=:request_no and note_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoSO(Integer request_no);

	@Query(value = "select * from medic_bills where emp_code=:emp_code and note_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByEmpcodeSO(String emp_code);

	@Query(value = "select * from medic_bills where  cast(request_no as character varying)=:request_no and emp_code=:emp_code and note_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoAndEmpcodeSO(String request_no, String emp_code);

	// Medical Bills by Patient Name
	@Query(value = "select * from medic_bills where patient_name = ?", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByPatienctName(String patient_name);

	// Medical Bills by Patient Name and request Number
	@Query(value = "select * from medic_bills where emp_code = ? and patient_name = ? and request_no = ?", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByPatienctNameandReqNo(String emp_code, String patient_name,
			Integer request_no);

	// All Medical Bills by Request No
	@Query(value = "select * from medic_bills where request_no=:request_no", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByReqNoNS2(Integer request_no);

	// All Medical Bills by Request No
	// for notesheet
	@Query(value = "select * from medic_bills where note_status=false order by request_no ", nativeQuery = true)
	public List<Medical_Bills> getAllMedicBills();

	// for sanction order
	@Query(value = "select * from medic_bills where note_status=true order by request_no ", nativeQuery = true)
	public List<Medical_Bills> getAllMedicBillss();

	// Sanction Order Queries

	// Medical Bills by Patient Name
	@Query(value = "select * from medic_bills where patient_name = ? and note_status=true", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByPatienctNameSO(String patient_name);

	// Medical Bills by Patient Name and request Number
	@Query(value = "select * from medic_bills where emp_code = ? and patient_name = ? and request_no = ? and note_status=true", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByPatienctNameandReqNoSO(String emp_code, String patient_name,
			Integer request_no);

	// Medical Bills by Request No
	@Query(value = "select * from medic_bills where request_no=:request_no and note_status=true", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByReqNoSO2(Integer request_no);

	// Notesheet Queries
	@Query(value = "select * from medic_bills where request_no=:request_no and note_status=false", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByReqNoNS(Integer request_no);

	@Query(value = "select * from medic_bills where patient_name = ? and emp_code=? and note_status=false", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByPatienctName2(String patient_name, String emp_code);

	@Query(value = "select * from medic_bills where emp_code = ? and patient_name = ? and request_no = ? and note_status=false", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByPatienctNameandReqNo2(String emp_code, String patient_name,
			Integer request_no);

	// Prints Notesheet Queries
	@Query(value = "select * from medic_bills where note_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsForNSPrint();

	@Query(value = "select * from medic_bills where note_status=true and ns_number=? order by request_no", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsByNotenumber(String ns_number);

//Sanction Order Prints Queries
	@Query(value = "select * from medic_bills where sanction_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsForSOPrint();
	
	@Query(value = "select * from medic_bills where sanction_status=true and so_number=? order by request_no", nativeQuery = true)
	public List<Medical_Bills> getMedicBillsForSOPrintbySoNumber(String soNumber);
	

}
