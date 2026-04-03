package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.CustFollowup;

public interface CustFollowupService 
{
	public boolean addCustFollowupDateService(CustFollowup custFollowup);
	public List<CustFollowup> getFollowupForProvidedDate(String date);

}
