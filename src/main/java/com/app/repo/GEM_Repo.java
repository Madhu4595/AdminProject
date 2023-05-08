package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.GEM;

public interface GEM_Repo extends JpaRepository<GEM, String>{
	
	@Query(value="select * from gem where record_status = 'NS' order by requestno", nativeQuery = true)
	public List<GEM> getGemsForSO();
	
	//Get all Outsourcing GEMs
	@Query(value="select * from gem where type='O' order by requestno", nativeQuery = true)
	public List<GEM> getAllOutsourcingGEMs();
	
	//Get all Vehicle GEMs
	@Query(value="select * from gem where type='V' order by requestno", nativeQuery = true)
	public List<GEM> getAllVehicleGEMs();
	
	
	

}
