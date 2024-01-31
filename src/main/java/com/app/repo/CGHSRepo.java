package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entity.CGHS;

public interface CGHSRepo extends JpaRepository<CGHS, String>{
	
	
	public List<CGHS> findByEmpCode(String empCode);

}
