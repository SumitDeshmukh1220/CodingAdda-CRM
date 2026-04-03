package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="sale_course")
public class SaleCourse
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="cust_phoneno")
	private String custphoneno;
	
	@Column(name="course_name")
	private String coursename; 
	
	@Column(name="emp_emailid")
	private String empemailid;
	
	@Column(name="purchased_date")
	private String Date;
	
	
	@Column(name="purchased_time")
	private String Time;


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getCustphoneno() {
		return custphoneno;
	}


	public void setCustphoneno(String custphoneno) {
		this.custphoneno = custphoneno;
	}
	public String getCoursename() {
		return coursename;
	}


	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getEmpemailid() {
		return empemailid;
	}


	public void setEmpemailid(String empemailid) {
		this.empemailid = empemailid;
	}


	public String getDate() {
		return Date;
	}


	public void setDate(String date) {
		Date = date;
	}


	public String getTime() {
		return Time;
	}


	public void setTime(String time) {
		Time = time;
	}

}
