package com.example.demo.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.CustEnquiry;
import com.example.demo.entity.CustFollowup;
import com.example.demo.service.CustEnquiryService;
import com.example.demo.service.CustFollowupService;
import com.example.demo.service.ProductService;

@Controller
public class CustomerController {

    @Autowired
    ProductService productService;

    @Autowired
    CustEnquiryService custEnquiryService;

    @Autowired
    CustFollowupService custFollowupService;

    // ── 1. Customer course listing page ──────────────────────────────────────
    @GetMapping("/customerCourses")
    public String openCustomerCoursesPage(Model model) {
        model.addAttribute("model_products_list", productService.getAllProductsListService());
        return "customer-courses"; // → /WEB-INF/views/customer-courses.jsp
    }

    // ── 2. Customer course detail page ───────────────────────────────────────
    @GetMapping("/customerCourseDetail")
    public String openCustomerCourseDetailPage(
            @RequestParam("courseName") String courseName,
            @RequestParam(name = "enroll_success", required = false) String success,
            @RequestParam(name = "enroll_error",   required = false) String error,
            Model model) {

        model.addAttribute("model_product", productService.getProductDetailsService(courseName));
        model.addAttribute("enroll_success", success);
        model.addAttribute("enroll_error",   error);
        return "customer-course-detail"; // → /WEB-INF/views/customer-course-detail.jsp
    }

    // ── 3. Public enquiry page (standalone, also pre-fills course) ───────────
    @GetMapping("/customerEnquiryPublic")
    public String openCustomerEnquiryPublicPage(
            @RequestParam(name = "enroll_success", required = false) String success,
            @RequestParam(name = "enroll_error",   required = false) String error,
            Model model) {

        model.addAttribute("model_coursename_list", productService.getAllCourseNameService());
        model.addAttribute("enroll_success", success);
        model.addAttribute("enroll_error",   error);
        return "customer-enquiry-public"; // → /WEB-INF/views/customer-enquiry-public.jsp
    }

    // ── 4. Handle enquiry form submission (from both pages) ──────────────────
    @PostMapping("/customerEnquirySubmit")
    public String handleCustomerEnquirySubmit(
            @RequestParam("name")             String name,
            @RequestParam("phoneno")          String phoneno,
            @RequestParam("interestedcourse") String interestedcourse,
            @RequestParam("discussion")       String discussion,
            @RequestParam("enquirytype")      String enquirytype,
            @RequestParam("status")           String status,
            @RequestParam("callto")           String callto,
            @RequestParam(value = "followupdate", required = false, defaultValue = "") String followupdate,
            @RequestParam(value = "sourceCourse",  required = false, defaultValue = "") String sourceCourse,
            RedirectAttributes redirectAttributes) {

        // Current date & time
        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String time = LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss"));

        // Build enquiry entity
        CustEnquiry enquiry = new CustEnquiry();
        enquiry.setName(name);
        enquiry.setPhoneno(phoneno);
        enquiry.setInterestedcourse(interestedcourse);
        enquiry.setDiscussion(discussion);
        enquiry.setEnquirytype(enquirytype);
        enquiry.setStatus(status);
        enquiry.setCallto(callto);
        enquiry.setEnquirydate(date);
        enquiry.setEnquirytime(time);
        enquiry.setEmpemail("website"); // tag as website enquiry

        // Build follow-up entity
        CustFollowup followup = new CustFollowup();
        followup.setPhoneno(phoneno);
        // Default follow-up = tomorrow if none provided
        String fu = (followupdate != null && !followupdate.isBlank())
                ? followupdate
                : LocalDate.now().plusDays(1).toString();
        followup.setFollowupdate(fu);

        boolean ok1 = custEnquiryService.addCustEnquiryDetailsService(enquiry);
        boolean ok2 = custFollowupService.addCustFollowupDateService(followup);

        // Redirect back — use the course-detail page if we came from there
        String redirectBase = sourceCourse.isBlank()
                ? "redirect:/customerEnquiryPublic"
                : "redirect:/customerCourseDetail?courseName=" + sourceCourse;

        if (ok1 && ok2) {
            redirectAttributes.addAttribute("enroll_success",
                    "Thank you " + name + "! We received your enquiry and will contact you shortly.");
        } else {
            redirectAttributes.addAttribute("enroll_error",
                    "Something went wrong. Please try again.");
        }

        return redirectBase;
    }
}
