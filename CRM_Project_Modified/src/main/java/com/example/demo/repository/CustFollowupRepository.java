package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.CustFollowup;

public interface CustFollowupRepository  extends JpaRepository<CustFollowup, Integer>
{ 
	CustFollowup findByPhoneno(String phoneno);
   List<CustFollowup> findByFollowupdate(String followupdate);
   

} 
