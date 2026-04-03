<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Enquiry History – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script>
    function handleOption() {
      var s = document.getElementById('statusInput').value;
      $('#followupdateInput').prop('readonly', s !== "1");
    }
  </script>
</head>
<body>
  <jsp:include page="header-employee.jsp"/>
  <div class="page-wrapper">

    <div class="page-header">
      <h2>Customer History</h2>
      <p>${model_custenq.get(0).getName()} &nbsp;•&nbsp; ${model_custenq.get(0).getPhoneno()}</p>
    </div>

    <div class="history-layout">

      <!-- History Table -->
      <div>
        <div class="section-title">Past Enquiries</div>
        <div class="card-dark" style="padding:0;overflow:hidden;">
          <table class="table-dark-custom">
            <thead>
              <tr>
                <th>Discussion</th>
                <th>Course</th>
                <th>Date / Time</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="custenq" items="${model_custenq}">
                <tr>
                  <td style="color:var(--text-secondary);">${custenq.getDiscussion()}</td>
                  <td><span style="color:var(--accent);">${custenq.getInterestedcourse()}</span></td>
                  <td style="color:var(--text-muted);font-size:.8rem;">${custenq.getEnquirydate()}<br/>${custenq.getEnquirytime()}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>

      <!-- New Enquiry Form -->
      <div>
        <div class="section-title">New Enquiry</div>
        <div class="card-dark">
          <form:form action="custEnquiryForm" method="post" modelAttribute="modelCustEnquiryAttr">
            <form:hidden path="phoneno" value="${model_custenq.get(0).getPhoneno()}"/>
            <form:hidden path="custEnquiry.name" value="${model_custenq.get(0).getName()}"/>

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
              <form:textarea path="custEnquiry.discussion" id="discussionInput" cssClass="form-control" placeholder="Notes from discussion..."/>
              <form:errors path="custEnquiry.discussion" cssClass="error_message_design"/>
            </div>
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
                <form:option value="2">Interested – Closed</form:option>
                <form:option value="3">Not Interested – Closed</form:option>
                <form:option value="4">Purchased – Closed</form:option>
              </form:select>
              <form:errors path="custEnquiry.status" cssClass="error_message_design"/>
            </div>
            <div class="mb-3">
              <label class="form-label">Followup Date</label>
              <form:input type="date" path="custFollowup.followupdate" id="followupdateInput" cssClass="form-control"/>
              <form:errors path="custFollowup.followupdate" cssClass="error_message_design"/>
            </div>
            <div class="mb-4">
              <label class="form-label">Call Direction</label>
              <form:select path="custEnquiry.callto" id="calltoInput" cssClass="form-select">
                <form:option value="">-- Select --</form:option>
                <form:option value="Customer To Company">Customer → Company</form:option>
                <form:option value="Company To Customer">Company → Customer</form:option>
              </form:select>
              <form:errors path="custEnquiry.callto" cssClass="error_message_design"/>
            </div>
            <button type="submit" class="btn-primary-dark w-full">
              <i class="bi bi-plus-circle"></i> Add Enquiry
            </button>
          </form:form>
        </div>
      </div>

    </div>
  </div>
</body>
</html>
