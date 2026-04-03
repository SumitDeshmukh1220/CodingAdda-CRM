<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Employee – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
  <jsp:include page="header-admin.jsp"/>
  <div class="page-wrapper">
    <div class="page-header">
      <h2>Add Employee</h2>
      <p>Register a new employee into the system.</p>
    </div>

    <div class="card-dark" style="max-width:560px;margin:0 auto;">

      <c:if test="${not empty model_success}">
        <div class="alert-dark-success">
          <span><i class="bi bi-check-circle me-2"></i>${model_success}</span>
          <button class="alert-close" onclick="this.parentElement.style.display='none'">✕</button>
        </div>
      </c:if>
      <c:if test="${not empty model_error}">
        <div class="alert-dark-error">
          <span><i class="bi bi-exclamation-circle me-2"></i>${model_error}</span>
          <button class="alert-close" onclick="this.parentElement.style.display='none'">✕</button>
        </div>
      </c:if>

      <form:form action="addEmpForm" method="post" modelAttribute="modelEmpAttr">
        <div class="mb-3">
          <label class="form-label">Full Name</label>
          <form:input path="name" placeholder="Enter full name" cssClass="form-control"/>
          <form:errors path="name" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Email Address</label>
          <form:input path="email" placeholder="Enter email" cssClass="form-control"/>
          <form:errors path="email" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Password</label>
          <form:password path="password" placeholder="Create a password" cssClass="form-control"/>
          <form:errors path="password" cssClass="error_message_design"/>
        </div>
        <div class="mb-4">
          <label class="form-label">Phone Number</label>
          <form:input path="phoneno" placeholder="Enter phone number" cssClass="form-control"/>
          <form:errors path="phoneno" cssClass="error_message_design"/>
        </div>
        <button type="submit" class="btn-primary-dark w-full">
          <i class="bi bi-person-plus"></i> Register Employee
        </button>
      </form:form>
    </div>
  </div>
</body>
</html>
