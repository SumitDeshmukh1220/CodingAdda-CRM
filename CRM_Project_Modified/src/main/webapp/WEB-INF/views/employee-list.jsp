<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Employee List – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script>
    function confirmEmpDelete(empEmail) {
      $('#deleteEmpConfirmationModal').modal('show');
      $('#deleteButton').attr('href', '/deleteEmployee?empEmail=' + empEmail);
    }
    function editEmployee(empEmail) {
      window.location.href = "/editEmployee?empEmail=" + encodeURIComponent(empEmail);
    }
  </script>
</head>
<body>
  <jsp:include page="header-admin.jsp"/>
  <div class="page-wrapper">

    <div class="page-header" style="background:linear-gradient(135deg,rgba(255,107,53,0.1) 0%,rgba(0,212,170,0.06) 100%);border:1px solid rgba(255,107,53,0.18);border-radius:var(--radius-xl);padding:1.5rem 2rem;margin-bottom:2rem;">
      <h2>Employee List</h2>
      <p>Manage all registered employees. Showing 5 per page.</p>
    </div>

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

    <div class="card-dark" style="padding:0;overflow:hidden;">
      <table class="table-dark-custom">
        <thead>
          <tr>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone No</th>
            <th style="text-align:center;">Edit</th>
            <th style="text-align:center;">Delete</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="Employee" items="${model_list_Emp}">
            <tr>
              <td><i class="bi bi-person-circle me-2" style="color:var(--accent);"></i>${Employee.getName()}</td>
              <td style="color:var(--text-secondary);">${Employee.getEmail()}</td>
              <td style="color:var(--text-secondary);">${Employee.getPhoneno()}</td>
              <td style="text-align:center;">
                <button class="btn-secondary-dark" onclick="editEmployee('${Employee.getEmail()}')">
                  <i class="bi bi-pencil-square"></i>
                </button>
              </td>
              <td style="text-align:center;">
                <button class="btn-danger-dark" onclick="confirmEmpDelete('${Employee.getEmail()}')">
                  <i class="bi bi-trash3-fill"></i>
                </button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="pagination-dark">
      <c:choose>
        <c:when test="${model_current_pages > 1}">
          <a href="emplist?page=${model_current_pages-1}"><i class="bi bi-chevron-left"></i> Prev</a>
        </c:when>
        <c:otherwise>
          <a class="disabled"><i class="bi bi-chevron-left"></i> Prev</a>
        </c:otherwise>
      </c:choose>

      <c:forEach begin="1" end="${model_total_pages}" var="pageNumber">
        <c:choose>
          <c:when test="${model_current_pages == pageNumber}">
            <a class="active" href="emplist?page=${pageNumber}">${pageNumber}</a>
          </c:when>
          <c:otherwise>
            <a href="emplist?page=${pageNumber}">${pageNumber}</a>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <c:choose>
        <c:when test="${model_current_pages < model_total_pages}">
          <a href="emplist?page=${model_current_pages+1}">Next <i class="bi bi-chevron-right"></i></a>
        </c:when>
        <c:otherwise>
          <a class="disabled">Next <i class="bi bi-chevron-right"></i></a>
        </c:otherwise>
      </c:choose>
    </div>

  </div>

  <!-- Delete Modal -->
  <div class="modal modal-dark fade" id="deleteEmpConfirmationModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><i class="bi bi-trash3 me-2" style="color:var(--danger);"></i>Delete Employee</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">Are you sure you want to delete this employee? This action cannot be undone.</div>
        <div class="modal-footer">
          <button type="button" class="btn-secondary-dark" data-bs-dismiss="modal">Cancel</button>
          <a type="button" class="btn-danger-dark" id="deleteButton">Delete</a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
