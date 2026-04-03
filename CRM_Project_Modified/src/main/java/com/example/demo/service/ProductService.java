package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.Product;
import com.example.demo.entity.SaleCourse;

public interface ProductService 
{
	public boolean addProductService(Product product);
	public List<Product> getAllProductsListService();
	public Product getProductDetailsService(String coursename);
	public List<String> getAllCourseNameService(); 
	public Product getSelectedCourseDetailsService(String coursename);
	public boolean addSaleCourseDeatilsService(SaleCourse saleCourse);
	public List<Object[]> getPurchasedCourseCountService();

}
