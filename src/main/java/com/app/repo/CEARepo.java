package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.CEA;
import com.app.model.DistinctNoteNumbers;
import com.app.model.DistinctSanctionOrderNumbers;

public interface CEARepo extends JpaRepository<CEA, String>{

	//========================EDIT=======================
	@Query(value="select * from cea where note_status = false order by requestno", nativeQuery = true)
	List<CEA> getAllCEAsForEdit();
	
	@Query(value="select * from cea where note_status = false and requestno=:requestno  order by requestno", nativeQuery = true)
	CEA getCEAForEditById(String requestno);
	
	
	//===========================NOTESHEET================
	@Query(value="select * from cea where note_status = false order by requestno", nativeQuery = true)
	List<CEA> getCEAsForNS();
	
	//============================SANCTION ORDER===========
	@Query(value="select * from cea where note_status = true and sanction_status = false order by requestno", nativeQuery = true)
	List<CEA> getCEAsForSO();
	
	//====================Duplicate Sanction Order Number
	List<CEA> findBySanctionNumber(String sanctionNumber);
	
	//===========Print Notesheet
	@Query(value="SELECT note_number, STRING_AGG(requestno, ', ') AS requestno FROM cea where note_status = true GROUP BY note_number",nativeQuery = true)
	public List<DistinctNoteNumbers> getDistinctNotenumbers();
	
	@Query(value="SELECT note_number, STRING_AGG(requestno, ', ') AS requestno FROM cea where note_status = true and note_number=:noteNumber GROUP BY note_number",nativeQuery = true)
	public DistinctNoteNumbers getDistinctNotenumbersbyNoteNumber(Long noteNumber);
	
	@Query(value="select * from cea where note_status = true and note_number = note_number order by requestno",nativeQuery = true)
	List<CEA> findByNoteNumber(Long noteNumber);
	
	//============Print Sanction Order
	@Query(value="SELECT sanction_number, STRING_AGG(requestno, ', ') AS requestno FROM cea where note_status = true and sanction_status = true GROUP BY sanction_number",nativeQuery = true)
	public List<DistinctSanctionOrderNumbers> getDistinctSanctionOrderNumbers();
	
	@Query(value="SELECT sanction_number, STRING_AGG(requestno, ', ') AS requestno FROM cea where note_status = true and sanction_status = true and sanction_number=:sanction_number GROUP BY sanction_number",nativeQuery = true)
	public DistinctSanctionOrderNumbers getDistinctSanctionOrderNumbersbySanctionNumber(String sanction_number);
	
	
	
	
	
	
	
	
}
