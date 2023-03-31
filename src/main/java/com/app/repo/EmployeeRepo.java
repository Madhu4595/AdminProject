package com.app.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.Employee;


public interface EmployeeRepo extends JpaRepository<Employee, String>{
	
	@Query(value="SELECT * FROM public.employee_master where code = :code", nativeQuery = true)
	public Employee getNamewithDesg(String code);

}
