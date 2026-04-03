<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/style.css">

<header class="crm-header">
  <a href="customerCourses" class="brand">
    <span class="brand-dot"></span>
    Coding Adda
  </a>
  <div class="header-right" style="display:flex;align-items:center;gap:.75rem;">
    <a href="customerCourses"
       style="color:var(--text-secondary);font-size:.875rem;text-decoration:none;display:flex;align-items:center;gap:.35rem;transition:color .2s;"
       onmouseover="this.style.color='var(--accent)'" onmouseout="this.style.color='var(--text-secondary)'">
      <i class="bi bi-grid-3x3-gap"></i> Courses
    </a>
    <a href="customerEnquiryPublic"
       style="color:var(--text-secondary);font-size:.875rem;text-decoration:none;display:flex;align-items:center;gap:.35rem;transition:color .2s;"
       onmouseover="this.style.color='var(--accent)'" onmouseout="this.style.color='var(--text-secondary)'">
      <i class="bi bi-chat-dots"></i> Enquiry
    </a>
    <a href="login" class="btn-primary-dark" style="font-size:.8rem;padding:.4rem .9rem;">
      <i class="bi bi-box-arrow-in-right"></i> Staff Login
    </a>
  </div>
</header>
