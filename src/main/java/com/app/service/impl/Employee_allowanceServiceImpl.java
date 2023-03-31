package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Employee_allowance;
import com.app.repo.Employee_allowanceRepo;
import com.app.service.IEmployee_allowanceService;

@Service
public class Employee_allowanceServiceImpl implements IEmployee_allowanceService{

	@Autowired private Employee_allowanceRepo repo;

	@Override
	public Employee_allowance saveEmpAllowance(Employee_allowance empAllowance) {
		return repo.save(empAllowance);
	}

	@Override
	public List<Employee_allowance> getAllEmpAllowance() {
		return repo.findAll();
	}

	@Override
	public Employee_allowance updateEmpAllowance(Employee_allowance empAllowance) {
		return repo.save(empAllowance);
	}
	@Override
	public Employee_allowance getByReqNo(Integer request_no) {
		return repo.getById(request_no);
	}
}
