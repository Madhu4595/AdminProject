package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Employee_Family;
import com.app.repo.Employee_Family_Repo;
import com.app.service.IEmployee_Family_Service;

@Service
public class Employee_Family_Service_Impl implements IEmployee_Family_Service{
	
	@Autowired private Employee_Family_Repo repo;

	@Override
	public Employee_Family saveEmployee_Family(Employee_Family employee_Family) {
		return repo.save(employee_Family);
	}

	@Override
	public Employee_Family updateEmployee_Family(Employee_Family employee_Family) {
		return repo.save(employee_Family);
	}

	@Override
	public void deleteEmployee_Family(Integer emp_code) {
		repo.deleteById(emp_code);
	}

	@Override
	public Employee_Family getEmployee_Family(Integer emp_code) {
		return repo.getById(emp_code);
	}

	@Override
	public List<Employee_Family> getAllEmpcode(String emp_code) {
		// TODO Auto-generated method stub
		return repo.getAllByEmpcode(emp_code);
	}

	 

}
