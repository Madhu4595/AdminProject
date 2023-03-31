package com.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Employee;
import com.app.repo.EmployeeRepo;
import com.app.service.IEmployeeService;

@Service
public class EmployeeServiceImpl implements IEmployeeService{
	
	@Autowired private EmployeeRepo repo;
	
	@Override
	public Employee saveEmployee(Employee employee) {
		return repo.save(employee);
	}

	@Override
	public Employee getById(String code) {
		return repo.findById(code).get();
	}

	@Override
	public Boolean findById(String code) {
		// TODO Auto-generated method stub
		return repo.existsById(code);
	}

}
