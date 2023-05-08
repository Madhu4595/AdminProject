package com.app.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.GPF;

public interface GPF_Repo extends JpaRepository<GPF, String>{
	
	@Query(value="select * from gpf where type='withdraw' order by request_no", nativeQuery = true)
	public List<GPF> getAllWithDrawGPF();
	
	@Query(value="select * from gpf where type='withdraw' and request_no=:request_no order by request_no", nativeQuery = true)
	public Optional<GPF> getWithDrawGPFById(String request_no);
	
	

}
