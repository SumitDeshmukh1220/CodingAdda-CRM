<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/style.css">

<header class="crm-header">
  <a href="profileAdmin" class="brand">
    <span class="brand-dot"></span>
    Coding Adda
  </a>
  <div class="header-right">
    <a href="profileAdmin" class="user-chip">
      <span class="avatar"><i class="bi bi-shield-check"></i></span>
      Admin
    </a>
    <a href="logout" class="btn-logout"><i class="bi bi-box-arrow-right me-1"></i>Logout</a>
  </div>
</header>

<nav class="crm-nav">
  <div class="nav-inner">
    <a href="profileAdmin" class="nav-link"><i class="bi bi-house me-1"></i>Home</a>

    <div class="nav-dropdown">
      <a href="#" class="nav-link"><i class="bi bi-people me-1"></i>Employees <i class="bi bi-chevron-down" style="font-size:.65rem;"></i></a>
      <div class="dropdown-menu-dark">
        <a href="addEmployee"><i class="bi bi-person-plus me-2"></i>Add Employee</a>
        <a href="emplist"><i class="bi bi-list-ul me-2"></i>Employee List</a>
      </div>
    </div>

    <div class="nav-dropdown">
      <a href="#" class="nav-link"><i class="bi bi-box me-1"></i>Products <i class="bi bi-chevron-down" style="font-size:.65rem;"></i></a>
      <div class="dropdown-menu-dark">
        <a href="addProducts"><i class="bi bi-plus-circle me-2"></i>Add Products</a>
        <a href="productList"><i class="bi bi-grid me-2"></i>Product List</a>
      </div>
    </div>
  </div>
</nav>
