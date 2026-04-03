<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <style>
    .login-page {
      min-height: 100vh; display: flex; align-items: center; justify-content: center;
      background: var(--bg-primary); padding: 2rem; position: relative; overflow: hidden;
    }
    .login-page::before {
      content: ''; position: absolute; inset: 0;
      background: radial-gradient(ellipse 70% 60% at 30% 40%, rgba(255,107,53,0.12) 0%, transparent 60%),
                  radial-gradient(ellipse 50% 40% at 80% 70%, rgba(0,212,170,0.07) 0%, transparent 60%);
      pointer-events: none;
    }
    .login-box {
      width: 100%; max-width: 400px; position: relative; z-index: 1;
    }
    .login-brand {
      text-align: center; margin-bottom: 2rem;
    }
    .login-brand .brand-icon {
      width: 64px; height: 64px; background: var(--accent-soft);
      border: 2px solid rgba(255,107,53,0.4); border-radius: 20px;
      display: flex; align-items: center; justify-content: center;
      margin: 0 auto 1rem; font-size: 1.6rem;
    }
    .login-brand h2 {
      font-family: "Sora", sans-serif; font-size: 1.5rem; font-weight: 800;
      color: var(--text-primary); margin-bottom: .25rem;
    }
    .login-brand p { color: var(--text-secondary); font-size: .85rem; }
    .login-card-inner {
      background: var(--bg-card); border: 1px solid var(--border-light);
      border-radius: var(--radius-xl); padding: 2rem 2.25rem;
      box-shadow: 0 20px 60px rgba(0,0,0,0.4);
    }
    .form-label { color: var(--text-secondary); font-size: .82rem; font-weight: 500; margin-bottom: .4rem; display: block; }
    .form-control {
      background: var(--bg-secondary); border: 1px solid var(--border);
      border-radius: var(--radius-md); color: var(--text-primary);
      padding: .65rem 1rem; font-size: .88rem; width: 100%; outline: none;
      transition: all .2s;
    }
    .form-control:focus { border-color: var(--accent); box-shadow: 0 0 0 3px var(--accent-soft); background: var(--bg-card); }
    .form-control::placeholder { color: var(--text-muted); }
    .btn-login {
      width: 100%; background: linear-gradient(135deg, #ff6b35, #ff8c5a);
      color: #fff; border: none; border-radius: var(--radius-md);
      padding: .75rem; font-size: .95rem; font-weight: 700; cursor: pointer;
      transition: all .25s; box-shadow: 0 4px 16px rgba(255,107,53,0.38); margin-top: .5rem;
    }
    .btn-login:hover { transform: translateY(-1px); box-shadow: 0 6px 24px rgba(255,107,53,0.55); }
    .back-link {
      display: flex; align-items: center; justify-content: center; gap: .4rem;
      color: var(--text-secondary); font-size: .82rem; text-decoration: none;
      margin-top: 1.5rem; transition: color .2s;
    }
    .back-link:hover { color: var(--accent); }
    .alert-dark-error {
      background: var(--danger-soft); border: 1px solid rgba(255,84,112,0.3);
      border-radius: var(--radius-md); padding: .7rem 1rem;
      color: var(--danger); font-size: .84rem; margin-bottom: 1.25rem;
    }
    .divider { display: flex; align-items: center; gap: .75rem; margin: 1.25rem 0; }
    .divider::before, .divider::after { content: ''; flex: 1; height: 1px; background: var(--border); }
    .divider span { color: var(--text-muted); font-size: .75rem; white-space: nowrap; }
  </style>
</head>
<body>
<div class="login-page">
  <div class="login-box">
    <div class="login-brand">
      <div class="brand-icon">&#9889;</div>
      <h2>Coding Adda</h2>
      <p>Staff Portal - Sign in to continue</p>
    </div>
    <div class="login-card-inner">
      <c:if test="${not empty model_error}">
        <div class="alert-dark-error">
          <i class="bi bi-exclamation-circle me-2"></i>${model_error}
        </div>
      </c:if>
      <form action="LoginForm" method="post">
        <div class="mb-3">
          <label class="form-label"><i class="bi bi-envelope me-1"></i>Email Address</label>
          <input type="email" name="email" placeholder="you@codingadda.in" class="form-control" required/>
        </div>
        <div class="mb-4">
          <label class="form-label"><i class="bi bi-lock me-1"></i>Password</label>
          <input type="password" name="password" placeholder="Enter your password" class="form-control" required autocomplete="off"/>
          <div style="color:var(--text-muted);font-size:.75rem;margin-top:6px;">
            <i class="bi bi-shield-check me-1"></i>Your credentials are secure and encrypted.
          </div>
        </div>
        <button type="submit" class="btn-login">
          <i class="bi bi-box-arrow-in-right me-2"></i>Sign In to Staff Portal
        </button>
      </form>
    </div>
    <a href="/" class="back-link"><i class="bi bi-arrow-left"></i> Back to Coding Adda Home</a>
  </div>
</div>
</body>
</html>
