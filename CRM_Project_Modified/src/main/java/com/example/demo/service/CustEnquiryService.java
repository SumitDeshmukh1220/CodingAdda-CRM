package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.CustEnquiry;

public interface CustEnquiryService 
{ 
	public boolean addCustEnquiryDetailsService(CustEnquiry custEnquiry);
	public boolean isPhoneNumberExists(String phoneNumber); 
	public List<CustEnquiry> getCustAllEnquiryHistory(String phoneno);
	public List<CustEnquiry> getAllEnquiriesService();
 
}
