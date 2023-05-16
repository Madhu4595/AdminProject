package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.app.entity.Medical_Bills;

public interface Medical_BillsRepo extends JpaRepository<Medical_Bills, Long>{
	
	@Query(value="select * from medic_bills where  cast(request_no as character varying)=:request_no and bill_no=:bill_no", nativeQuery = true)
	public Medical_Bills getByReqNoAndBillNo(String request_no, String bill_no);
	
	@Query(value="select * from medic_bills where  cast(request_no as character varying)=:request_no and emp_code=:emp_code", nativeQuery = true)
	public List<Medical_Bills> getByReqNoAndEmpcode(String request_no, String emp_code);
	
	@Query(value="select * from medic_bills where request_no=:request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNo(Integer request_no);
	
	@Query(value="select * from medic_bills where emp_code=:emp_code", nativeQuery = true)
	public List<Medical_Bills> getByEmpcode(String	emp_code);
	
	@Query(value = "delete from medic_bills where request_no=:request_no", nativeQuery = true)
	@Modifying
	@Transactional
	public void deleteByReqNo(Integer request_no);
	
	
	//NOTESHEET
	@Query(value="select * from medic_bills where request_no=:request_no and note_status=false order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoNS(Integer request_no);
	
	//@Query(value="select * from medic_bills where emp_code=:emp_code and note_status=false order by request_no", nativeQuery = true)
	@Query(value="select * from medic_bills where emp_code=:emp_code order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByEmpcodeNS(String emp_code);
	
	@Query(value="select * from medic_bills where  cast(request_no as character varying)=:request_no and emp_code=:emp_code and note_status=false order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoAndEmpcodeNS(String request_no, String emp_code);
	
	@Query(value="select * from medic_bills where request_no=:request_no and note_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoNSPrint(Integer request_no);
	
	//Sanction Order
	@Query(value="select * from medic_bills where request_no=:request_no and note_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoSO(Integer request_no);
	
	@Query(value="select * from medic_bills where emp_code=:emp_code and note_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByEmpcodeSO(String emp_code);
	
	@Query(value="select * from medic_bills where  cast(request_no as character varying)=:request_no and emp_code=:emp_code and note_status=true order by request_no", nativeQuery = true)
	public List<Medical_Bills> getByReqNoAndEmpcodeSO(String request_no, String emp_code);
	
	
	
	

}
