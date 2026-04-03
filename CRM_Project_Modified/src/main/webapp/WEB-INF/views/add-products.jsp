<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Course – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
  <jsp:include page="header-admin.jsp"/>
  <div class="page-wrapper">
    <div class="page-header">
      <h2>Add Course / Product</h2>
      <p>Fill in the details to add a new course to the catalog.</p>
    </div>

    <div class="card-dark" style="max-width:620px;margin:0 auto;">

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

      <form:form action="addCourseForm" method="post" enctype="multipart/form-data" modelAttribute="productAttr">

        <div class="section-title" style="font-size:.8rem;margin-bottom:1rem;">Course Info</div>

        <div class="mb-3">
          <label class="form-label">Course Name</label>
          <form:input path="coursename" cssClass="form-control" placeholder="e.g. Java Fullstack"/>
          <form:errors path="coursename" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Course Syllabus</label>
          <form:textarea path="syllabus" cssClass="form-control" placeholder="List topics covered..."/>
          <form:errors path="syllabus" cssClass="error_message_design"/>
        </div>
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
          <div class="mb-3">
            <label class="form-label">Original Price (Rs.)</label>
            <form:input path="originalprice" cssClass="form-control" placeholder="e.g. 15000"/>
            <form:errors path="originalprice" cssClass="error_message_design"/>
          </div>
          <div class="mb-3">
            <label class="form-label">Discounted Price (Rs.)</label>
            <form:input path="discountedprice" cssClass="form-control" placeholder="e.g. 9999"/>
            <form:errors path="discountedprice" cssClass="error_message_design"/>
          </div>
        </div>
        <div class="mb-3">
          <label class="form-label">Course Validity</label>
          <form:input path="coursevalidity" cssClass="form-control" placeholder="e.g. 6 Months"/>
          <form:errors path="coursevalidity" cssClass="error_message_design"/>
        </div>
        <div class="mb-4">
          <label class="form-label">Course Image</label>
          <input type="file" name="courseimage" class="form-control"/>
          <form:errors path="courseimage" cssClass="error_message_design"/>
        </div>

        <div class="section-title" style="font-size:.8rem;margin-bottom:1rem;">Trainer Info</div>

        <div class="mb-3">
          <label class="form-label">Trainer's Name</label>
          <form:input path="trainersname" cssClass="form-control" placeholder="Enter trainer name"/>
          <form:errors path="trainersname" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Trainer's Details</label>
          <form:textarea path="trainersdetails" cssClass="form-control" placeholder="About the trainer..."/>
          <form:errors path="trainersdetails" cssClass="error_message_design"/>
        </div>
        <div class="mb-4">
          <label class="form-label">Trainer's Image</label>
          <input type="file" name="trainersimage" class="form-control"/>
          <form:errors path="trainersimage" cssClass="error_message_design"/>
        </div>

        <div class="section-title" style="font-size:.8rem;margin-bottom:1rem;">Other</div>

        <div class="mb-4">
          <label class="form-label">Other Details / Instructions</label>
          <form:textarea path="otherdetails" cssClass="form-control" placeholder="Any important instructions..."/>
          <form:errors path="otherdetails" cssClass="error_message_design"/>
        </div>

        <button type="submit" class="btn-primary-dark w-full">
          <i class="bi bi-plus-circle"></i> Add Course
        </button>
      </form:form>
    </div>
  </div>
</body>
</html>
