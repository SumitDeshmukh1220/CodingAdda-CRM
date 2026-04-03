package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.employee;
import com.example.demo.repository.EmpRepository;

@Service
public class EmpServiceImpl implements EmpService

{
	@Autowired
	EmpRepository empRepository;

	@Override
	public boolean addEmployeeService(employee emp) {

		
		boolean  status=false;
		try
		{
			empRepository.save(emp);
			status=true;
		}
		catch(Exception e)
		{
			status=false;
			e.printStackTrace();
			
		}
		return status;
	}

	@Override
	public List<employee> getAllEmployeesService() 
	{
	       
		return empRepository.findAll();
	}

	@Override
	public employee authenticate(String email) 
	{
		 employee emp=empRepository.findByEmail(email);
		return emp;
	}

	@Override
	public boolean deleteEmployeeService(String email)
	{
		boolean status=false;
		try
		{
			empRepository.deleteByEmail(email);
			status=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			status=false;
		}
		return status;
	}

	@Override
	public boolean updateEmployeeService(employee emp) {
		boolean status=false;
		try {
			
			employee existingEmp=empRepository.findByEmail(emp.getEmail());
			if(existingEmp!=null)
			{
				existingEmp.setName(emp.getName());
				existingEmp.setPassword(emp.getPassword());
				existingEmp.setPhoneno(emp.getPhoneno());
				
				
				
				empRepository.save(existingEmp);
				status=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			status=false;
		}
		
		return status;
	}
}
