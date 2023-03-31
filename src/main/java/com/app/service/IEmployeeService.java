package com.app.service;

import com.app.entity.Employee;

public interface IEmployeeService {
	public Employee saveEmployee(Employee employee);
	public Employee getById(String code);
	public Boolean findById(String code);

}
