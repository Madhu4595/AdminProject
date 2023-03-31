package com.app.service;

import java.util.List;

import com.app.entity.Employee_allowance;


public interface IEmployee_allowanceService {
	
	public Employee_allowance saveEmpAllowance(Employee_allowance empAllowance);
	public List<Employee_allowance> getAllEmpAllowance();
	public Employee_allowance updateEmpAllowance(Employee_allowance empAllowance);
	public Employee_allowance getByReqNo(Integer request_no);
	

}
