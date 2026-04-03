package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.employee;

public interface EmpService {
	
	
	public employee authenticate(String email);
	public boolean addEmployeeService(employee emp);
	public List<employee> getAllEmployeesService();
	public boolean deleteEmployeeService(String email);
	public boolean updateEmployeeService( employee emp);

}
