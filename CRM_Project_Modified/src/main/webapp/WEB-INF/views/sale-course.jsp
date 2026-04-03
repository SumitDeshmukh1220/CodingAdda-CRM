<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Record Sale – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script>
    function getSelectedCourse() {
      var selectedcourse = document.getElementById('interestedcourseInput').value;
      if (selectedcourse !== "") {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/getCoursePrices?selectedcourse=" + selectedcourse, true);
        xhr.onreadystatechange = function () {
          if (xhr.readyState === 4 && xhr.status === 200) {
            var product = JSON.parse(xhr.responseText);
            document.getElementById("originalpriceid").textContent = product.originalprice;
            document.getElementById("dicountedpriceid").textContent = product.discountedprice;
            $("#priceDivId").css("visibility", "visible");
          }
        };
        xhr.send();
      } else {
        $("#priceDivId").css("visibility", "hidden");
      }
    }
  </script>
</head>
<body>
  <jsp:include page="header-employee.jsp"/>
  <div class="page-wrapper">
    <div class="page-header">
      <h2>Sale Course</h2>
      <p>Record a course purchase for a customer.</p>
    </div>

    <div class="card-dark" style="max-width:520px;margin:0 auto;">

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

      <form:form action="saleCourseForm" method="post" modelAttribute="modelSaleCourseAttr">
        <div class="mb-3">
          <label class="form-label">Customer Phone Number</label>
          <form:input path="custphoneno" cssClass="form-control" placeholder="Enter customer phone no."/>
          <form:errors path="custphoneno" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Select Course</label>
          <form:select path="coursename" id="interestedcourseInput" cssClass="form-select" onchange="getSelectedCourse()">
            <form:option value="">-- Choose a Course --</form:option>
            <form:options items="${model_coursename_list}"/>
          </form:select>
          <form:errors path="coursename" cssClass="error_message_design"/>
        </div>
        <div class="mb-4" id="priceDivId" style="visibility:hidden;">
          <div style="color:var(--text-muted);font-size:.8rem;margin-bottom:4px;">PRICE SUMMARY</div>
          Original: <del style="color:var(--danger);">Rs.<span id="originalpriceid"></span></del>
          &nbsp;&nbsp;
          Payable: <strong style="color:var(--success);font-size:1.05rem;">Rs.<span id="dicountedpriceid"></span></strong>
        </div>
        <button type="submit" class="btn-primary-dark w-full">
          <i class="bi bi-bag-check"></i> Confirm Sale
        </button>
      </form:form>
    </div>
  </div>
</body>
</html>
