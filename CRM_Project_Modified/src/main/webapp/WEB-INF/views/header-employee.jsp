<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/style.css">

<header class="crm-header">
  <a href="homeEmployee" class="brand">
    <span class="brand-dot"></span>
    Coding Adda
  </a>
  <div class="header-right">
    <a href="profileEmployee" class="user-chip">
      <span class="avatar"><i class="bi bi-person"></i></span>
      ${session_employee.getName()}
    </a>
    <a href="logout" class="btn-logout"><i class="bi bi-box-arrow-right me-1"></i>Logout</a>
  </div>
</header>

<nav class="crm-nav">
  <div class="nav-inner">
    <a href="homeEmployee" class="nav-link"><i class="bi bi-house me-1"></i>Home</a>
    <a href="customerEnquiryPage" class="nav-link"><i class="bi bi-chat-dots me-1"></i>Customer Enquiry</a>
    <a href="customerFollowupPage" class="nav-link"><i class="bi bi-telephone-forward me-1"></i>Follow Ups</a>
    <a href="saleCourse" class="nav-link"><i class="bi bi-bag-check me-1"></i>Sale Course</a>
  </div>
</nav>
