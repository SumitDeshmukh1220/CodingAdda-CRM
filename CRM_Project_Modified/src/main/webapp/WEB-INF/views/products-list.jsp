<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Course Catalog – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script>
    function courseDetails(courseName) {
      window.location.href = "/courseDetails?courseName=" + encodeURIComponent(courseName);
    }
  </script>
</head>
<body>
  <jsp:include page="header-admin.jsp"/>
  <div class="page-wrapper">
    <div class="page-header" style="background:linear-gradient(135deg,rgba(255,107,53,0.1) 0%,rgba(0,212,170,0.06) 100%);border:1px solid rgba(255,107,53,0.18);border-radius:var(--radius-xl);padding:1.5rem 2rem;margin-bottom:2rem;">
      <h2>Products / Courses</h2>
      <p>All available courses in the catalog.</p>
    </div>

    <div class="card-dark" style="padding:0;overflow:hidden;">
      <table class="table-dark-custom">
        <thead>
          <tr>
            <th>Image</th>
            <th>Course Name</th>
            <th>Validity</th>
            <th>Price</th>
            <th>Trainer</th>
            <th style="text-align:center;">Details</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="product" items="${model_products_list}">
            <tr>
              <td><img src="${product.getCourseimage()}" alt="" class="table-img"/></td>
              <td><strong>${product.getCoursename()}</strong></td>
              <td style="color:var(--text-secondary);">${product.getCoursevalidity()}</td>
              <td>
                <span class="price-badge">
                  <span class="original">Rs.${product.getOriginalprice()}</span>
                  <span class="discounted">Rs.${product.getDiscountedprice()}</span>
                </span>
              </td>
              <td style="color:var(--text-secondary);">${product.getTrainersname()}</td>
              <td style="text-align:center;">
                <button class="btn-secondary-dark" onclick="courseDetails('${product.getCoursename()}')">
                  <i class="bi bi-eye"></i> View
                </button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
