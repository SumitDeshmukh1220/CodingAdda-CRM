<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Enquiry – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script>
    $(document).ready(function () {
      $('#phonenoInput').keyup(function () {
        var phoneNumber = $(this).val();
        $.ajax({
          url: "/checkPhoneNumberAvailability",
          data: { phoneNumber: phoneNumber },
          success: function (response) {
            var exists = response === "exist";
            $('#phonenoInput').toggleClass("is-invalid", exists);
            ["#nameInput","#discussionInput","#followupdateInput"].forEach(function(id){ $(id).prop('readonly', exists); });
            ["#interestedcourseInput","#enquirytypeInput","#statusInput","#calltoInput"].forEach(function(id){ $(id).prop('disabled', exists); });
            $("#addEnquiryBtnId").prop('disabled', exists);
            $('#getHistoryBtn').toggle(exists);
          }
        });
      });
    });

    function custEnquiryHistory() {
      var phoneNumber = $('#phonenoInput').val();
      if (phoneNumber !== '') {
        window.location.href = "/custEnquiryHistoryPage?phno=" + encodeURIComponent(phoneNumber);
      }
    }

    function handleOption() {
      var statusOption = document.getElementById('statusInput').value;
      $('#followupdateInput').prop('readonly', statusOption !== "1");
    }
  </script>
</head>
<body>
  <jsp:include page="header-employee.jsp"/>
  <div class="page-wrapper">
    <div class="page-header">
      <h2>Customer Enquiry</h2>
      <p>Log a new customer enquiry or update an existing one.</p>
    </div>

    <div class="card-dark" style="max-width:580px;margin:0 auto;">

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

      <form:form action="custEnquiryForm" method="post" modelAttribute="modelCustEnquiryAttr">
        <div class="mb-3">
          <label class="form-label">Phone Number</label>
          <form:input path="phoneno" cssClass="form-control" id="phonenoInput" placeholder="Enter customer phone no."/>
          <button type="button" id="getHistoryBtn" class="btn-success-dark mt-2" style="display:none;" onclick="custEnquiryHistory()">
            <i class="bi bi-clock-history"></i> View History
          </button>
          <form:errors path="phoneno" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Customer Name</label>
          <form:input path="custEnquiry.name" id="nameInput" cssClass="form-control" placeholder="Enter customer name"/>
          <form:errors path="custEnquiry.name" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Interested Course</label>
          <form:select path="custEnquiry.interestedcourse" id="interestedcourseInput" cssClass="form-select">
            <form:option value="">-- Select Course --</form:option>
            <form:options items="${model_coursename_list}"/>
          </form:select>
          <form:errors path="custEnquiry.interestedcourse" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Discussion Notes</label>
          <form:textarea path="custEnquiry.discussion" id="discussionInput" cssClass="form-control" placeholder="What was discussed..."/>
          <form:errors path="custEnquiry.discussion" cssClass="error_message_design"/>
        </div>
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
          <div class="mb-3">
            <label class="form-label">Enquiry Type</label>
            <form:select path="custEnquiry.enquirytype" id="enquirytypeInput" cssClass="form-select">
              <form:option value="">-- Select --</form:option>
              <form:option value="Call">Call</form:option>
              <form:option value="Mail">Mail</form:option>
              <form:option value="Website">Website</form:option>
              <form:option value="Social Networking">Social Networking</form:option>
            </form:select>
            <form:errors path="custEnquiry.enquirytype" cssClass="error_message_design"/>
          </div>
          <div class="mb-3">
            <label class="form-label">Status</label>
            <form:select path="custEnquiry.status" id="statusInput" cssClass="form-select" onchange="handleOption()">
              <form:option value="">-- Select --</form:option>
              <form:option value="1">Open</form:option>
              <form:option value="2">Interested- Closed</form:option>
              <form:option value="3">Not Interested - Closed</form:option>
              <form:option value="4">Purchased - Closed</form:option>
            </form:select>
            <form:errors path="custEnquiry.status" cssClass="error_message_design"/>
          </div>
        </div>
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
          <div class="mb-3">
            <label class="form-label">Followup Date</label>
            <form:input type="date" path="custFollowup.followupdate" id="followupdateInput" cssClass="form-control"/>
            <form:errors path="custFollowup.followupdate" cssClass="error_message_design"/>
          </div>
          <div class="mb-3">
            <label class="form-label">Call Direction</label>
            <form:select path="custEnquiry.callto" id="calltoInput" cssClass="form-select">
              <form:option value="">-- Select --</form:option>
              <form:option value="Customer To Company">Customer → Company</form:option>
              <form:option value="Company To Customer">Company → Customer</form:option>
            </form:select>
            <form:errors path="custEnquiry.callto" cssClass="error_message_design"/>
          </div>
        </div>
        <button type="submit" class="btn-primary-dark w-full" id="addEnquiryBtnId">
          <i class="bi bi-plus-circle"></i> Add Enquiry
        </button>
      </form:form>
    </div>
  </div>
</body>
</html>
