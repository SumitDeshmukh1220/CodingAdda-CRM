 package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.SaleCourse;

public interface SaleCourseRepository extends JpaRepository<SaleCourse, Integer>
{
	@Query("SELECT Date,COUNT(id) FROM SaleCourse GROUP BY Date")
	List<Object[]> countByPurchasedDate();
	
}
