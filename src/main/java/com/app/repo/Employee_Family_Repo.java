package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.app.entity.Employee_Family;


public interface Employee_Family_Repo extends JpaRepository<Employee_Family, Integer>{
	
	@Query(value="select * from emp_family where emp_code=:emp_code", nativeQuery = true)
	public List<Employee_Family> getAllByEmpcode(String emp_code);
	
	
	@Query(value="select * from emp_family where emp_code=:emp_code and per_name=:per_name", nativeQuery = true)
	public  Employee_Family  getRelation(String emp_code, String per_name);
	
	@Modifying
	@Transactional
	@Query(value="delete from emp_family where emp_code=:emp_code", nativeQuery = true)
	public void deleteAllFamilyDetailsByEmpCode(String emp_code);
	
	@Query(value="delete from emp_family where emp_code=:emp_code", nativeQuery = true)
	public Boolean existsByEmpCode(String emp_code);
	

}
