package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.LTC;


public interface LTCRepo extends JpaRepository<LTC, String>{
	
	@Query(value="select * from public.ltc where sanctionorderno= :sanctionorderno order by requestno", nativeQuery = true)
	public LTC checkSO(String sanctionorderno);
	
	
	@Query(value="select * from public.ltc where note_status = false and requestno=:requestno order by requestno",nativeQuery = true)
	public LTC getLTCForNS(String requestno);
	
	@Query(value="select * from public.ltc where note_status = false order by requestno",nativeQuery = true)
	public List<LTC> getAllLTCForNS();
	
	
	@Query(value="select * from public.ltc where note_status = true and sanction_status = false and requestno=:requestno order by requestno",nativeQuery = true)
	public LTC getLTCForSO(String requestno);
	
	@Query(value="select * from public.ltc where note_status = true and sanction_status = false order by requestno",nativeQuery = true)
	public List<LTC> getAllLTCForSO( );
	
	public LTC getLTCBySanctionorderno(String sanctionorderno);
	
	//===========================LTC - Encashment=============================
	@Query(value="select * from ltc where note_status = false and encashment is not null",nativeQuery = true)
	public List<LTC> getAllLTCEncashForEdit();
	
	@Query(value="select * from ltc where note_status = false and encashment is not null and requestno=:requestno",nativeQuery = true)
	public LTC getLTCEncashForEdit(String requestno);
	
	@Query(value="select * from ltc where note_status = false and encashment is not null",nativeQuery = true)
	public List<LTC> getAllLTCEncashForNS();
	
	@Query(value="select * from ltc where note_status = false and encashment is not null and requestno=:requestno",nativeQuery = true)
	public LTC getLTCEncashForNS(String requestno);
	
	//===================================LTC-Advance====================
	@Query(value="select * from ltc where note_status = false and encashment is null",nativeQuery = true)
	public List<LTC> getAllLTCAdvanceForEdit();
	
	@Query(value="select * from ltc where note_status = false and encashment is null and requestno=:requestno",nativeQuery = true)
	public LTC getLTCAdvanceForEdit(String requestno);
	
	@Query(value="select * from ltc where note_status = true and sanction_status  = false and encashment is null",nativeQuery = true)
	public List<LTC> getAllLTCAdvanceForSO();
	
	@Query(value="select * from ltc where note_status = true and encashment is null and requestno=:requestno",nativeQuery = true)
	public LTC getLTCAdvanceForSO(String requestno);
	
	
	//======PRINTS====LTC=======Encashment==========NOTESHEET
	@Query(value="select * from ltc where note_status = true and encashment is not null",nativeQuery = true)
	public List<LTC> getAllLTCEncashForNSPrints();
	
	@Query(value="select * from ltc where note_status = true and encashment is not null and requestno=:requestno",nativeQuery = true)
	public LTC getLTCEncashForNSPrints(String requestno);
	
	//=======PRINTS LTC ENCASHMENT SANCTION ORDER
	@Query(value="select * from ltc where note_status = true and sanction_status  = true and encashment is not null",nativeQuery = true)
	public List<LTC> getAllLTCEncashForSOPrints();
	
	@Query(value="select * from ltc where note_status = true and sanction_status = true and encashment is not null and requestno=:requestno",nativeQuery = true)
	public LTC getLTCEncashForSOPrints(String requestno);
	
	
	//======PRINTS=====LTC=========Advance==========NOTESHEET
	@Query(value="select * from ltc where note_status = true and encashment is null",nativeQuery = true)
	public List<LTC> getAllLTCAdvanceForNSPrints();
	
	@Query(value="select * from ltc where note_status = true and encashment is null and requestno=:requestno",nativeQuery = true)
	public LTC getLTCAdvanceForNSPrints(String requestno);
	//======PRINTS=====LTC=========Advance==========SANCTION ORDER
	@Query(value="select * from ltc where note_status = true and sanction_status = true and encashment is null",nativeQuery = true)
	public List<LTC> getAllLTCAdvanceForSOPrints();
	
	@Query(value="select * from ltc where note_status = true and sanction_status = true and encashment is null and requestno=:requestno",nativeQuery = true)
	public LTC getLTCAdvanceForSOPrints(String requestno);
	
	
	
	
	

}
