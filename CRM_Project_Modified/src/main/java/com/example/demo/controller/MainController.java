package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.CustEnquiry;
import com.example.demo.entity.employee;
import com.example.demo.service.CustEnquiryService;
import com.example.demo.service.EmpService;
import com.example.demo.service.ProductService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {

	@Autowired
	EmpService empService;

	@Autowired
	ProductService productService;

	@Autowired
	CustEnquiryService custEnquiryService;

	// ── PUBLIC HOME PAGE (shows courses to customers) ────────────────────────
	@GetMapping("/")
	public String openIndexPage(Model model) {
		model.addAttribute("model_products_list", productService.getAllProductsListService());
		return "index";
	}

	@GetMapping("/home")
	public String openHomePage(Model model) {
		model.addAttribute("model_products_list", productService.getAllProductsListService());
		return "index";
	}

	// ── LOGIN ────────────────────────────────────────────────────────────────
	@GetMapping("/login")
	public String openLoginPage() {
		return "login";
	}

	// ── EMPLOYEE LIST (with pagination) ──────────────────────────────────────
	int PAGE_SIZE = 5;

	@GetMapping("/emplist")
	public String openEmpListPage(
			@RequestParam(name = "redirectAttr_success", required = false) String Success,
			@RequestParam(name = "redirectAttr_error",   required = false) String error,
			Model model,
			@RequestParam(defaultValue = "1") int page) {

		List<employee> list_emp = empService.getAllEmployeesService();

		int TOTAL_PRODUCTS  = list_emp.size();
		int TOTAL_PAGE      = (int) Math.ceil((double) TOTAL_PRODUCTS / PAGE_SIZE);
		int LIST_START_INDEX = (page - 1) * PAGE_SIZE;
		int LIST_END_INDEX  = Math.min(LIST_START_INDEX + PAGE_SIZE, TOTAL_PRODUCTS);

		List<employee> new_list_emp = list_emp.subList(LIST_START_INDEX, LIST_END_INDEX);
		model.addAttribute("model_list_Emp",       new_list_emp);
		model.addAttribute("model_total_pages",    TOTAL_PAGE);
		model.addAttribute("model_current_pages",  page);
		model.addAttribute("model_success",        Success);
		model.addAttribute("model_error",          error);

		return "employee-list";
	}

	// ── ADMIN PROFILE ────────────────────────────────────────────────────────
	@GetMapping("/profileAdmin")
	public String openAdminProfilePage() {
		return "profile-admin";
	}

	// ── LOGIN FORM SUBMIT ────────────────────────────────────────────────────
	@PostMapping("/LoginForm")
	public String loginForm(
			@RequestParam("email")    String myemail,
			@RequestParam("password") String mypass,
			Model model,
			HttpSession session) {

		String page = "login";

		if (myemail.equals("admin@gmail.com") && mypass.equals("admin123")) {
			page = "profile-admin";
		} else {
			employee emp = empService.authenticate(myemail);
			if (emp != null && emp.getPassword().equals(mypass)) {
				session.setAttribute("session_employee", emp);
				return "redirect:/homeEmployee";
			} else {
				model.addAttribute("model_error", "EmailId & Password doesn't Match");
				page = "login";
			}
		}
		return page;
	}

	// ── ADD EMPLOYEE ─────────────────────────────────────────────────────────
	@GetMapping("/addEmployee")
	public String openAddEmpPage(Model model) {
		model.addAttribute("modelEmpAttr", new employee());
		return "add-employee";
	}

	@PostMapping("/addEmpForm")
	public String registerEmpForm(
			@Valid @ModelAttribute("modelEmpAttr") employee emp,
			BindingResult br,
			Model model) {

		if (!br.hasErrors()) {
			boolean status = empService.addEmployeeService(emp);
			if (status) {
				model.addAttribute("model_success", "Employee Added Successfully");
			} else {
				model.addAttribute("model_error", "Employee Not Added Due To Some ERROR");
			}
			emp.setName("");
			emp.setEmail("");
			emp.setPassword("");
			emp.setPhoneno("");
		}
		return "add-employee";
	}

	// ── LOGOUT ───────────────────────────────────────────────────────────────
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}

	// ── DELETE EMPLOYEE ──────────────────────────────────────────────────────
	@GetMapping("/deleteEmployee")
	public String deleteEmployee(
			@RequestParam("empEmail") String email,
			RedirectAttributes redirectAttributes) {

		boolean status = empService.deleteEmployeeService(email);
		if (status) {
			redirectAttributes.addAttribute("redirectAttr_success", "Employee Deleted Successfully");
		} else {
			redirectAttributes.addAttribute("redirectAttr_error", "Employee Not Deleted Due To Some Error");
		}
		return "redirect:/emplist";
	}

	// ── EDIT EMPLOYEE ────────────────────────────────────────────────────────
	@GetMapping("/editEmployee")
	public String openEditEmpPage(@RequestParam("empEmail") String email, Model model) {
		employee emp = empService.authenticate(email);
		model.addAttribute("modelEmpAttr", new employee());
		model.addAttribute("model_emp", emp);
		return "edit-employee";
	}

	@PostMapping("/updateEmpForm")
	public String updateEmpForm(
			@Valid @ModelAttribute("modelEmpAttr") employee emp,
			BindingResult br,
			Model model) {

		if (!br.hasErrors()) {
			boolean status = empService.updateEmployeeService(emp);
			if (status) {
				model.addAttribute("model_success", "Employee Updated Successfully");
			} else {
				model.addAttribute("model_error", "Employee Not Updated Due To Some ERROR");
			}
		}
		return "edit-employee";
	}

	// ── EMPLOYEE PROFILE & HOME ───────────────────────────────────────────────
	@GetMapping("/profileEmployee")
	public String openEmpProfile() {
		return "profile-employee";
	}

	@GetMapping("/homeEmployee")
	public String openEmpHome(Model model) {
		List<Object[]> list = productService.getPurchasedCourseCountService();
		model.addAttribute("model_count_course_sale", list);
		List<CustEnquiry> allEnquiries = custEnquiryService.getAllEnquiriesService();
		model.addAttribute("model_all_enquiries", allEnquiries);
		return "home-employee";
	}
}
