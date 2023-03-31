package com.app.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.LTC;


public interface LTCRepo extends JpaRepository<LTC, String>{
	
	@Query(value="select * from public.ltc where sanctionorderno= :sanctionorderno", nativeQuery = true)
	public LTC checkSO(String sanctionorderno);

}
