package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.GEM;

public interface GEM_Repo extends JpaRepository<GEM, String>{
	
	//==================================VEHICLE===================================
	
	//For Edit
	@Query(value="select * from gem where type = 'V' and note_status = false order by requestno", nativeQuery = true)
	public List<GEM> getAllGemVehicleForEdit();
	
	//For Edit Request Number
	@Query(value="select * from gem where type = 'V' and note_status = false and requestno =:requestno order by requestno", nativeQuery = true)
	public GEM getGemVehicleForEdit(String requestno);
	
	//For NoteSheet
	@Query(value="select * from gem where type = 'V' and note_status = false and sanction_status = false order by requestno", nativeQuery = true)
	public List<GEM> getAllGemVehicleForNS();
	
	//For NoteSheet -single record
	@Query(value="select * from gem where type = 'V' and note_status = false and sanction_status = false and requestno =:requestno order by requestno", nativeQuery = true)
	public GEM getGemVehicleForNS(String requestno);
	
	//For Sanction Order
	@Query(value="select * from gem where type = 'V' and note_status = true and sanction_status = false order by requestno", nativeQuery = true)
	public List<GEM> getAllGemVehicleForSO();
	
	//For NoteSheet -single record
	@Query(value="select * from gem where type = 'V' and note_status = true and sanction_status = false and requestno =:requestno order by requestno", nativeQuery = true)
	public GEM getGemVehicleForSO(String requestno);
	
	//Checking Sanction Order
	@Query(value="select * from gem where sanction_number=:sanction_number", nativeQuery = true)
	public GEM getBySanctionNumber(String sanction_number);
	
	//====================================OUT SOURCING====================================
	//For Edit 
	@Query(value="select * from gem where type = 'O' and note_status = false order by requestno", nativeQuery = true)
	public List<GEM> getAllGemOutsourceForEdit();
	
	//For Edit Request Number
	@Query(value="select * from gem where type = 'O' and note_status = false and requestno =:requestno order by requestno", nativeQuery = true)
	public GEM getGemOutsourceForEdit(String requestno);
	
	//For NoteSheet
	@Query(value="select * from gem where type = 'O' and note_status = false and sanction_status = false order by requestno", nativeQuery = true)
	public List<GEM> getAllGemOutsourceForNS();
		
	//For NoteSheet -single record
	@Query(value="select * from gem where type = 'O' and note_status = false and sanction_status = false and requestno =:requestno order by requestno", nativeQuery = true)
	public GEM getGemOutsourceForNS(String requestno);
	
	//For Sanction Order
	@Query(value="select * from gem where type = 'O' and note_status = true and sanction_status = false order by requestno", nativeQuery = true)
	public List<GEM> getAllGemOutsourceForSO();
		
	//For NoteSheet -single record
	@Query(value="select * from gem where type = 'O' and note_status = true and sanction_status = false and requestno =:requestno order by requestno", nativeQuery = true)
	public GEM getGemOutsourceForSO(String requestno);
	
	//=========PRINTS===========VEHICLE==========NOTESHEET
	@Query(value="select * from gem where type = 'V' and note_status = true order by requestno", nativeQuery = true)
	public List<GEM> getAllGemVehicleForNSPrints();
	@Query(value="select * from gem where type = 'V' and note_status = true and requestno =:requestno", nativeQuery = true)
	public GEM getGemVehicleForNSPrints(String requestno);
	
	//=========PRINTS===========OUTSOURCE==========NOTESHEET
	@Query(value="select * from gem where type = 'O' and note_status = true order by requestno", nativeQuery = true)
	public List<GEM> getAllGemOutsourceForNSPrints();
	@Query(value="select * from gem where type = 'O' and note_status = true and requestno =:requestno", nativeQuery = true)
	public GEM getGemOutsourceNSPrints(String requestno);
	
	//=========PRINTS===========VEHICLE==========SANCTION ORDER
	@Query(value="select * from gem where type = 'V' and note_status = true and sanction_status = true order by requestno", nativeQuery = true)
	public List<GEM> getAllGemVehicleForSOPrints();
	@Query(value="select * from gem where type = 'V' and note_status = true and sanction_status = true and  requestno =:requestno", nativeQuery = true)
	public GEM getGemVehicleForSOPrints(String requestno);
		
	//=========PRINTS===========OUTSOURCE==========SANCTION ORDER
	@Query(value="select * from gem where type = 'O' and note_status = true and sanction_status = true order by requestno", nativeQuery = true)
	public List<GEM> getAllGemOutsourceForSOPrints();
	@Query(value="select * from gem where type = 'O' and note_status = true and sanction_status = true and requestno =:requestno", nativeQuery = true)
	public GEM getGemOutsourceSOPrints(String requestno);
		
	
 
	
	
	

}
