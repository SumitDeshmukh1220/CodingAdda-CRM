<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <style>
    .admin-welcome {
      background: linear-gradient(135deg, rgba(255,107,53,0.12) 0%, rgba(0,212,170,0.07) 100%);
      border: 1px solid rgba(255,107,53,0.22); border-radius: var(--radius-xl);
      padding: 2.25rem 2rem; display:flex; align-items:center; gap:1.75rem;
      margin-bottom: 2.25rem; position:relative; overflow:hidden;
    }
    .admin-welcome::before {
      content:''; position:absolute; top:-40px; right:-40px;
      width:200px; height:200px;
      background: radial-gradient(circle, rgba(255,107,53,0.12) 0%, transparent 70%);
      pointer-events:none;
    }
    .admin-avatar {
      width:72px; height:72px; background:var(--accent-soft);
      border:2px solid rgba(255,107,53,0.5); border-radius:20px;
      display:flex; align-items:center; justify-content:center;
      font-size:2rem; flex-shrink:0;
    }
    .admin-welcome h2 { font-family:"Sora",sans-serif; font-size:1.5rem; font-weight:800; color:var(--text-primary); margin-bottom:.25rem; }
    .admin-welcome p { color:var(--text-secondary); font-size:.875rem; margin:0; }
    .role-badge {
      display:inline-flex; align-items:center; gap:.4rem;
      background:var(--accent-soft); border:1px solid rgba(255,107,53,0.35);
      color:var(--accent); border-radius:50px; padding:.22rem .8rem;
      font-size:.72rem; font-weight:700; letter-spacing:.5px; margin-bottom:.5rem;
    }
    .admin-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(220px,1fr)); gap:1.25rem; }
    .admin-action-card {
      background:var(--bg-card); border:1px solid var(--border);
      border-radius:var(--radius-lg); padding:1.6rem 1.4rem;
      text-decoration:none; transition:all .25s; display:block;
      position:relative; overflow:hidden;
    }
    .admin-action-card::before {
      content:''; position:absolute; inset:0;
      background: linear-gradient(135deg, rgba(255,107,53,0.05) 0%, transparent 60%);
      opacity:0; transition:opacity .25s; pointer-events:none;
    }
    .admin-action-card:hover::before { opacity:1; }
    .admin-action-card:hover { border-color:var(--accent); transform:translateY(-4px); box-shadow:0 10px 32px rgba(255,107,53,0.15); }
    .card-icon-wrap {
      width:48px; height:48px; border-radius:var(--radius-md);
      display:flex; align-items:center; justify-content:center;
      font-size:1.4rem; margin-bottom:1rem;
    }
    .admin-action-card h4 { font-family:"Sora",sans-serif; font-size:.95rem; font-weight:700; color:var(--text-primary); margin-bottom:.3rem; }
    .admin-action-card p { font-size:.78rem; color:var(--text-secondary); margin:0; line-height:1.5; }
    .section-label {
      font-family:"Sora",sans-serif; font-size:.72rem; font-weight:700;
      color:var(--text-muted); letter-spacing:1px; text-transform:uppercase;
      margin-bottom:1rem; margin-top:2rem;
    }
    @media(max-width:600px){ .admin-welcome{flex-direction:column;text-align:center;} }
  </style>
</head>
<body>
  <jsp:include page="header-admin.jsp"/>
  <div class="page-wrapper">

    <div class="admin-welcome">
      <div class="admin-avatar">&#128737;</div>
      <div>
        <div class="role-badge"><i class="bi bi-shield-fill-check"></i> Super Administrator</div>
        <h2>Welcome Back, Admin!</h2>
        <p>Manage your Coding Adda platform — employees, courses, and operations from one place.</p>
      </div>
    </div>

    <div class="section-label"><i class="bi bi-people me-1"></i>Employee Management</div>
    <div class="admin-grid">
      <a href="addEmployee" class="admin-action-card">
        <div class="card-icon-wrap" style="background:rgba(255,107,53,0.12);">&#128100;</div>
        <h4>Add Employee</h4>
        <p>Register a new staff member into the Coding Adda system.</p>
      </a>
      <a href="emplist" class="admin-action-card">
        <div class="card-icon-wrap" style="background:rgba(0,212,170,0.1);">&#128203;</div>
        <h4>Employee List</h4>
        <p>View, edit and manage all current employees.</p>
      </a>
    </div>

    <div class="section-label"><i class="bi bi-box me-1"></i>Course Management</div>
    <div class="admin-grid">
      <a href="addProducts" class="admin-action-card">
        <div class="card-icon-wrap" style="background:rgba(251,191,36,0.1);">&#10133;</div>
        <h4>Add New Course</h4>
        <p>Add a brand-new course to the Coding Adda catalog.</p>
      </a>
      <a href="productList" class="admin-action-card">
        <div class="card-icon-wrap" style="background:rgba(255,84,112,0.1);">&#128218;</div>
        <h4>Course Catalog</h4>
        <p>Browse and manage all published courses and pricing.</p>
      </a>
    </div>

  </div>
</body>
</html>
