package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.GEM;
import com.app.entity.GPF;

public interface GPF_Repo extends JpaRepository<GPF, String>{
	
	//==============================withdraw=========================
	
	//EDIT
	@Query(value="select * from gpf where type='withdraw' and note_status = false order by request_no", nativeQuery = true)
	public List<GPF> getAllGPFWithdrawForEdit();
	
	@Query(value="select * from gpf where type='withdraw' and note_status = false and request_no =:request_no", nativeQuery = true)
	public GPF getGPFWithdrawForEdit(String request_no);
	
	//Notesheet
	@Query(value="select * from gpf where type='withdraw' and note_status = false order by request_no", nativeQuery = true)
	public List<GPF> getAllGPFWithdrawForNS();
	
	@Query(value="select * from gpf where type='withdraw' and note_status = false and request_no =:request_no", nativeQuery = true)
	public GPF getGPFWithdrawForNS(String request_no);
	
	//sanction order
	@Query(value="select * from gpf where type='withdraw' and note_status = true and sanction_status = false order by request_no", nativeQuery = true)
	public List<GPF> getAllGPFWithdrawForSO();
	
	@Query(value="select * from gpf where type='withdraw' and note_status = true and sanction_status = false and request_no =:request_no", nativeQuery = true)
	public GPF getGPFWithdrawForSO(String request_no);
	
	//Checking Sanction Order
	@Query(value="select * from gpf where sanction_number=:sanction_number", nativeQuery = true)
	public GEM getBySanctionNumber(String sanction_number);
	
	
	//===============For GPF Withdraw Notesheet Print==================
	@Query(value="select * from gpf where type='withdraw' and note_status = true order by request_no", nativeQuery = true)
	public List<GPF> getAllGPFWithdrawForNSPrint();
 
	
	//=====================For Sanction Order Print========================
	//sanction order
	@Query(value="select * from gpf where type='withdraw' and note_status = true and sanction_status = true order by request_no", nativeQuery = true)
	public List<GPF> getAllGPFWithdrawForSOPrint();
	
	
	
	

}
