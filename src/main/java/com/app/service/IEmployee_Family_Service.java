package com.app.service;

import java.util.List;

import com.app.entity.Employee_Family;


public interface IEmployee_Family_Service {
	
	public Employee_Family saveEmployee_Family(Employee_Family employee_Family);
	public Employee_Family updateEmployee_Family(Employee_Family employee_Family);
	public void deleteEmployee_Family(Integer emp_code);
	public Employee_Family getEmployee_Family(Integer emp_code);
	public List<Employee_Family> getAllEmpcode(String emp_code);
	

}
