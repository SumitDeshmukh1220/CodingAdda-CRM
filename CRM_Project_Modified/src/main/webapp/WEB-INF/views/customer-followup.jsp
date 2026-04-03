<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Follow Ups – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script>
    function getSelectedDate() {
      var selectedDate = $("#datePickerId").val();
      $.ajax({
        type: "GET",
        url: "/customerFollowupPage",
        data: { selectedDate: selectedDate },
        success: function (data) {
          var tableBody = $(data).find("tbody");
          $("#followupTable tbody").html(tableBody.html());
        },
        error: function (xhr, status, error) { alert("ERROR: " + error); }
      });
    }

    function cusEnquiryHistory(phoneNumber) {
      if (phoneNumber !== '') {
        window.location.href = "custEnquiryHistoryPage?phno=" + encodeURIComponent(phoneNumber);
      }
    }
  </script>
</head>
<body>
  <jsp:include page="header-employee.jsp"/>
  <div class="page-wrapper">

    <div class="page-header">
      <h2>Customer Follow Ups</h2>
      <p>Customers scheduled for a follow-up call today or on a selected date.</p>
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

    <div class="card-dark" style="margin-bottom:1.5rem;">
      <label class="form-label"><i class="bi bi-calendar3 me-2"></i>Filter by Date</label>
      <input type="date" class="form-control" id="datePickerId" onchange="getSelectedDate()" style="max-width:220px;"/>
    </div>

    <div class="card-dark" style="padding:0;overflow:hidden;">
      <table id="followupTable" class="table-dark-custom">
        <thead>
          <tr>
            <th style="width:60px;">#</th>
            <th>Phone Number</th>
            <th style="text-align:center;">Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="followup" items="${model_followups}" varStatus="Loop">
            <tr>
              <td style="color:var(--text-muted);">${Loop.index + 1}</td>
              <td><i class="bi bi-telephone me-2" style="color:var(--success);"></i>${followup.phoneno}</td>
              <td style="text-align:center;">
                <button class="btn-success-dark" onclick="cusEnquiryHistory('${followup.phoneno}')">
                  <i class="bi bi-clock-history"></i> Get History
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
