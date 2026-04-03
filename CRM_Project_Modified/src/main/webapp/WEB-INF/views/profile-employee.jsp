<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Profile – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
  <jsp:include page="header-employee.jsp"/>
  <div class="page-wrapper">

    <div class="profile-card">
      <div class="avatar-big">👤</div>
      <div class="info">
        <h2>${session_employee.getName()}</h2>
        <span class="badge-role">Employee</span>
        <div class="info-row">
          <span class="label"><i class="bi bi-envelope me-1"></i>Email</span>
          ${session_employee.getEmail()}
        </div>
        <div class="info-row">
          <span class="label"><i class="bi bi-telephone me-1"></i>Phone</span>
          ${session_employee.getPhoneno()}
        </div>
      </div>
    </div>

  </div>
</body>
</html>
