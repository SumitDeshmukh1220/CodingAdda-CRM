<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Course Details – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
  <jsp:include page="header-admin.jsp"/>
  <div class="page-wrapper">

    <div class="page-header">
      <h2>${model_product.getCoursename()}</h2>
      <p>Full details about this course and trainer.</p>
    </div>

    <!-- Course Info -->
    <div class="course-detail-section">
      <h4><i class="bi bi-book me-2"></i>Course Information</h4>
      <div style="display:flex;gap:2rem;align-items:flex-start;">
        <img src="${model_product.getCourseimage()}" alt="Course Image"
          style="width:160px;height:120px;object-fit:cover;border-radius:var(--radius-md);border:1px solid var(--border);flex-shrink:0;"/>
        <div style="flex:1;">
          <div class="detail-row">
            <span class="dlabel">Course Name</span>
            <span class="dvalue" style="color:var(--accent);font-weight:600;">${model_product.getCoursename()}</span>
          </div>
          <div class="detail-row">
            <span class="dlabel">Price</span>
            <span class="dvalue">
              <span class="price-badge">
                <span class="original">Rs.${model_product.getOriginalprice()}</span>
                <span class="discounted">Rs.${model_product.getDiscountedprice()}</span>
              </span>
            </span>
          </div>
          <div class="detail-row">
            <span class="dlabel">Validity</span>
            <span class="dvalue">${model_product.getCoursevalidity()}</span>
          </div>
          <div class="detail-row">
            <span class="dlabel">Syllabus</span>
            <span class="dvalue" style="color:var(--text-secondary);">${model_product.getSyllabus()}</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Trainer Info -->
    <div class="course-detail-section">
      <h4><i class="bi bi-person-badge me-2"></i>Trainer Details</h4>
      <div style="display:flex;gap:2rem;align-items:flex-start;">
        <img src="${model_product.getTrainersimage()}" alt="Trainer Image"
          style="width:100px;height:100px;object-fit:cover;border-radius:50%;border:2px solid var(--accent);flex-shrink:0;"/>
        <div style="flex:1;">
          <div class="detail-row">
            <span class="dlabel">Name</span>
            <span class="dvalue" style="color:var(--accent);font-weight:600;">${model_product.getTrainersname()}</span>
          </div>
          <div class="detail-row">
            <span class="dlabel">About</span>
            <span class="dvalue" style="color:var(--text-secondary);">${model_product.getTrainersdetails()}</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Instructions -->
    <div class="instructions-box">
      <div style="font-weight:600;margin-bottom:8px;"><i class="bi bi-exclamation-triangle me-2"></i>Important Instructions</div>
      ${model_product.getOtherdetails()}
    </div>

  </div>
</body>
</html>
