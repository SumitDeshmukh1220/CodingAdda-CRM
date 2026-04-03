package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
 
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entity.employee;



//@Repository
@Transactional
public interface EmpRepository extends JpaRepository<employee,Integer>
{
  employee findByEmail(String email);
  
  void deleteByEmail(String email);
}
