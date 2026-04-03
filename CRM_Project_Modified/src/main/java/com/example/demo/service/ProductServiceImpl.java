package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Product;
import com.example.demo.entity.SaleCourse;
import com.example.demo.repository.ProductRepository;
import com.example.demo.repository.SaleCourseRepository;

@Service
public class ProductServiceImpl implements ProductService
{
	@Autowired
	ProductRepository productRepository; 
	
	@Autowired
	SaleCourseRepository  saleCourseRepository;

	@Override
	public boolean addProductService(Product product) 
	{ 
		boolean status=false;
		
		try 
		{
			productRepository.save(product);
			status=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Product> getAllProductsListService() {
		
		return productRepository.findAll();
	}

	@Override
	public Product getProductDetailsService(String coursename) {
		
		return productRepository.findByCoursename(coursename);
	}

	@Override
	public List<String> getAllCourseNameService() {
		
		return productRepository.findCourseName();
	}

	@Override
	public Product getSelectedCourseDetailsService(String coursename) {
		
		return  productRepository.findByCoursename(coursename);
		
	}

	@Override
	public boolean addSaleCourseDeatilsService(SaleCourse saleCourse) 
	{
		boolean status=false;
		try
		{
			saleCourseRepository.save(saleCourse);
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
	public List<Object[]> getPurchasedCourseCountService() {
	
		return saleCourseRepository.countByPurchasedDate();
	}

}
