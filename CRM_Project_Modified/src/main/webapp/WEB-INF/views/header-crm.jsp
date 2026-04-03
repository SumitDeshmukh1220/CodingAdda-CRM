<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/style.css">

<header class="crm-header">
  <a href="home" class="brand">
    <span class="brand-dot"></span>
    Coding Adda
  </a>
  <div class="header-right">
    <div class="dropdown">
      <button class="btn-secondary-dark dropdown-toggle" data-bs-toggle="dropdown">
        <i class="bi bi-grid-3x3-gap"></i> Menu
      </button>
      <ul class="dropdown-menu dropdown-menu-end" style="background:var(--bg-card);border:1px solid var(--border);border-radius:var(--radius-md);padding:6px;">
        <li><a class="dropdown-item" href="home" style="color:var(--text-secondary);border-radius:var(--radius-sm);padding:8px 12px;font-size:.875rem;">
          <i class="bi bi-house me-2"></i>Home</a></li>
        <li><a class="dropdown-item" href="login" style="color:var(--text-secondary);border-radius:var(--radius-sm);padding:8px 12px;font-size:.875rem;">
          <i class="bi bi-box-arrow-in-right me-2"></i>Login</a></li>
        <li><a class="dropdown-item" href="#" style="color:var(--text-secondary);border-radius:var(--radius-sm);padding:8px 12px;font-size:.875rem;">
          <i class="bi bi-info-circle me-2"></i>About Us</a></li>
        <li><a class="dropdown-item" href="#" style="color:var(--text-secondary);border-radius:var(--radius-sm);padding:8px 12px;font-size:.875rem;">
          <i class="bi bi-envelope me-2"></i>Contact Us</a></li>
      </ul>
    </div>
  </div>
</header>
