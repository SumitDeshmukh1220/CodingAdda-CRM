<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${model_product.coursename} – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

  <style>
    .back-link {
      display: inline-flex;
      align-items: center;
      gap: .4rem;
      color: var(--text-secondary);
      font-size: .85rem;
      text-decoration: none;
      margin-bottom: 1.5rem;
      transition: color .2s;
    }
    .back-link:hover { color: var(--accent); }

    /* Two-column layout */
    .detail-layout {
      display: grid;
      grid-template-columns: 1fr 380px;
      gap: 1.5rem;
      align-items: start;
    }
    @media (max-width: 900px) {
      .detail-layout { grid-template-columns: 1fr; }
    }

    /* Left: Course info */
    .course-main-img {
      width: 100%;
      height: 240px;
      object-fit: cover;
      border-radius: var(--radius-lg);
      border: 1px solid var(--border);
      margin-bottom: 1.25rem;
      display: block;
    }
    .course-title {
      font-size: 1.6rem;
      font-weight: 700;
      color: var(--text-primary);
      margin-bottom: .5rem;
    }
    .meta-pills {
      display: flex;
      flex-wrap: wrap;
      gap: .5rem;
      margin-bottom: 1.25rem;
    }
    .meta-pill {
      background: var(--bg-dark);
      border: 1px solid var(--border);
      border-radius: 20px;
      padding: 4px 12px;
      font-size: .78rem;
      color: var(--text-secondary);
    }
    .meta-pill i { margin-right: .3rem; color: var(--accent); }

    .section-card {
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: var(--radius-lg);
      padding: 1.25rem 1.4rem;
      margin-bottom: 1.1rem;
    }
    .section-card h5 {
      font-size: .95rem;
      font-weight: 600;
      color: var(--text-primary);
      margin-bottom: .85rem;
      display: flex;
      align-items: center;
      gap: .45rem;
    }
    .section-card h5 i { color: var(--accent); }
    .section-card p {
      font-size: .875rem;
      color: var(--text-secondary);
      line-height: 1.7;
      margin: 0;
    }

    /* Trainer */
    .trainer-row {
      display: flex;
      align-items: center;
      gap: 1rem;
    }
    .trainer-avatar {
      width: 72px; height: 72px;
      border-radius: 50%;
      object-fit: cover;
      border: 2px solid var(--accent);
      flex-shrink: 0;
    }
    .trainer-name { font-size: .95rem; font-weight: 600; color: var(--text-primary); margin-bottom: .25rem; }
    .trainer-about { font-size: .8rem; color: var(--text-secondary); line-height: 1.6; }

    /* Right: Sticky enroll card */
    .enroll-card {
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: var(--radius-lg);
      padding: 1.5rem;
      position: sticky;
      top: 80px;
    }
    .enroll-card .price-big {
      font-size: 2rem;
      font-weight: 700;
      color: var(--accent);
      margin-bottom: .1rem;
    }
    .enroll-card .price-original {
      font-size: .875rem;
      color: var(--text-secondary);
      text-decoration: line-through;
      margin-bottom: 1.25rem;
    }
    .enroll-card .divider {
      height: 1px;
      background: var(--border);
      margin: 1.1rem 0;
    }
    .enroll-info-row {
      display: flex;
      justify-content: space-between;
      font-size: .82rem;
      color: var(--text-secondary);
      margin-bottom: .55rem;
    }
    .enroll-info-row span:last-child { color: var(--text-primary); font-weight: 500; }

    .btn-enroll-big {
      display: block;
      width: 100%;
      background: linear-gradient(135deg,#ff6b35,#ff8c5a);
      color: #fff;
      border: none;
      border-radius: var(--radius-md);
      padding: .75rem;
      font-size: .95rem;
      font-weight: 600;
      cursor: pointer;
      transition: opacity .2s;
      text-align: center;
      text-decoration: none;
      margin-bottom: .75rem;
    }
    .btn-enroll-big:hover { opacity: .85; color: #fff; }
    .btn-enquiry {
      display: block;
      width: 100%;
      background: transparent;
      color: var(--text-secondary);
      border: 1px solid var(--border);
      border-radius: var(--radius-md);
      padding: .65rem;
      font-size: .875rem;
      cursor: pointer;
      transition: border-color .2s, color .2s;
      text-align: center;
      text-decoration: none;
    }
    .btn-enquiry:hover { border-color: var(--accent); color: var(--accent); }

    /* Enquiry inline form (shown on Enroll click) */
    .enquiry-form-section {
      display: none;
      margin-top: 1.25rem;
      border-top: 1px solid var(--border);
      padding-top: 1.25rem;
    }
    .enquiry-form-section.show { display: block; }
    .enquiry-form-section label { font-size: .8rem; color: var(--text-secondary); display: block; margin-bottom: .3rem; }
    .enquiry-form-section input,
    .enquiry-form-section select,
    .enquiry-form-section textarea {
      width: 100%;
      background: var(--bg-dark);
      border: 1px solid var(--border);
      border-radius: var(--radius-md);
      color: var(--text-primary);
      padding: .5rem .75rem;
      font-size: .82rem;
      margin-bottom: .85rem;
      outline: none;
      transition: border-color .2s;
    }
    .enquiry-form-section input:focus,
    .enquiry-form-section select:focus,
    .enquiry-form-section textarea:focus { border-color: var(--accent); }
    .phone-feedback { font-size: .75rem; margin-top: -.6rem; margin-bottom: .65rem; display: none; }
    .phone-feedback.exists { color: #f87171; display: block; }
    .phone-feedback.free   { color: #4ade80; display: block; }
  </style>
</head>
<body>
  <jsp:include page="header-customer.jsp"/>

  <div class="page-wrapper">

    <a href="/" class="back-link">
      <i class="bi bi-arrow-left"></i> Back to all courses
    </a>

    <div class="detail-layout">

      <!-- LEFT COLUMN -->
      <div>
        <img class="course-main-img"
             src="${model_product.courseimage}"
             alt="${model_product.coursename}"
             onerror="this.src='/static/images/CRMimg.jpeg'"/>

        <h1 class="course-title">${model_product.coursename}</h1>

        <div class="meta-pills">
          <span class="meta-pill"><i class="bi bi-clock"></i>${model_product.coursevalidity}</span>
          <span class="meta-pill"><i class="bi bi-person-circle"></i>${model_product.trainersname}</span>
          <span class="meta-pill"><i class="bi bi-patch-check"></i>Certificate</span>
        </div>

        <!-- Syllabus -->
        <div class="section-card">
          <h5><i class="bi bi-list-check"></i> Syllabus</h5>
          <p>${model_product.syllabus}</p>
        </div>

        <!-- Trainer -->
        <div class="section-card">
          <h5><i class="bi bi-person-badge"></i> About the Trainer</h5>
          <div class="trainer-row">
            <img class="trainer-avatar"
                 src="${model_product.trainersimage}"
                 alt="${model_product.trainersname}"
                 onerror="this.src='/static/images/profile.png'"/>
            <div>
              <div class="trainer-name">${model_product.trainersname}</div>
              <div class="trainer-about">${model_product.trainersdetails}</div>
            </div>
          </div>
        </div>

        <!-- Important instructions -->
        <c:if test="${not empty model_product.otherdetails}">
          <div class="section-card" style="border-color:#f59e0b44;">
            <h5><i class="bi bi-exclamation-triangle" style="color:#f59e0b;"></i> Important Instructions</h5>
            <p>${model_product.otherdetails}</p>
          </div>
        </c:if>
      </div>

      <!-- RIGHT COLUMN: Enroll card -->
      <div>
        <div class="enroll-card">
          <div class="price-big" style="background:linear-gradient(135deg,#ff6b35,#00d4aa);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;">Rs. ${model_product.discountedprice}</div>
          <div class="price-original">Original: Rs. ${model_product.originalprice}</div>

          <div class="enroll-info-row">
            <span><i class="bi bi-clock me-1"></i>Validity</span>
            <span>${model_product.coursevalidity}</span>
          </div>
          <div class="enroll-info-row">
            <span><i class="bi bi-person me-1"></i>Trainer</span>
            <span>${model_product.trainersname}</span>
          </div>
          <div class="enroll-info-row">
            <span><i class="bi bi-award me-1"></i>Certificate</span>
            <span>Yes</span>
          </div>

          <div class="divider"></div>

          <!-- Enroll button → shows inline form -->
          <button class="btn-enroll-big" id="enrollBtn" onclick="toggleEnrollForm()">
            <i class="bi bi-rocket-takeoff me-1"></i> Enroll Now
          </button>
          <a href="customerEnquiryPublic?course=${model_product.coursename}" class="btn-enquiry">
            <i class="bi bi-chat-dots me-1"></i> Ask a Question
          </a>

          <!-- Inline quick-enquiry form -->
          <div class="enquiry-form-section" id="enrollForm">
            <div style="font-size:.85rem;font-weight:600;color:var(--text-primary);margin-bottom:1rem;">
              <i class="bi bi-clipboard-check me-1" style="color:var(--accent);"></i>
              Complete your enrolment enquiry
            </div>

            <%-- success / error flash --%>
            <c:if test="${not empty enroll_success}">
              <div class="alert-dark-success" style="margin-bottom:.9rem;">
                <span><i class="bi bi-check-circle me-2"></i>${enroll_success}</span>
              </div>
            </c:if>
            <c:if test="${not empty enroll_error}">
              <div class="alert-dark-error" style="margin-bottom:.9rem;">
                <span><i class="bi bi-exclamation-circle me-2"></i>${enroll_error}</span>
              </div>
            </c:if>

            <form action="customerEnquirySubmit" method="post">
              <input type="hidden" name="interestedcourse" value="${model_product.coursename}"/>
              <input type="hidden" name="enquirytype" value="Website"/>
              <input type="hidden" name="callto" value="Customer To Company"/>
              <input type="hidden" name="status" value="1"/>
              <input type="hidden" name="followupdate" value=""/>

              <label>Your Name *</label>
              <input type="text" name="name" placeholder="Full name" required/>

              <label>Phone Number *</label>
              <input type="text" name="phoneno" id="quickPhone" placeholder="10-digit mobile number"
                     maxlength="10" oninput="quickPhoneCheck(this.value)" required/>
              <div class="phone-feedback" id="quickPhoneFeedback"></div>

              <label>Your Message</label>
              <textarea name="discussion" rows="3" placeholder="Any questions or message..."></textarea>

              <button type="submit" class="btn-enroll-big" style="margin-bottom:0;">
                <i class="bi bi-send me-1"></i> Submit Enquiry
              </button>
            </form>
          </div>
        </div>
      </div>
    </div><!-- end detail-layout -->

  </div>

  <script>
    function toggleEnrollForm() {
      var form = document.getElementById('enrollForm');
      var btn  = document.getElementById('enrollBtn');
      var open = form.classList.toggle('show');
      btn.innerHTML = open
        ? '<i class="bi bi-x-circle me-1"></i> Cancel'
        : '<i class="bi bi-rocket-takeoff me-1"></i> Enroll Now';
    }

    // Auto-open if there's a flash message after redirect
    <c:if test="${not empty enroll_success or not empty enroll_error}">
    document.getElementById('enrollForm').classList.add('show');
    document.getElementById('enrollBtn').innerHTML = '<i class="bi bi-x-circle me-1"></i> Cancel';
    </c:if>

    var phoneTimer;
    function quickPhoneCheck(val) {
      clearTimeout(phoneTimer);
      var fb = document.getElementById('quickPhoneFeedback');
      fb.className = 'phone-feedback';
      if (val.length < 10) return;
      phoneTimer = setTimeout(function() {
        $.get('/checkPhoneNumberAvailability', { phoneNumber: val }, function(res) {
          if (res === 'exist') {
            fb.textContent = 'This number already has an enquiry. We will follow up with you.';
            fb.className = 'phone-feedback exists';
          } else {
            fb.textContent = 'Phone number looks good!';
            fb.className = 'phone-feedback free';
          }
        });
      }, 500);
    }
  </script>

  <!-- Coding Adda Footer -->
  <footer style="margin-top:3rem;padding:1.75rem 2rem 1.25rem;border-top:1px solid var(--border);text-align:center;">
    <div style="font-family:'Sora',sans-serif;font-size:1.1rem;font-weight:800;color:var(--text-primary);margin-bottom:.5rem;display:flex;align-items:center;gap:.5rem;justify-content:center;">
      <span style="width:7px;height:7px;background:var(--accent);border-radius:50%;box-shadow:0 0 8px var(--accent);display:inline-block;"></span>
      Coding Adda
    </div>
    <div style="display:flex;gap:1.25rem;justify-content:center;flex-wrap:wrap;margin:.75rem 0;">
      <a href="/" style="color:var(--text-secondary);font-size:.8rem;text-decoration:none;">Home</a>
      <a href="customerEnquiryPublic" style="color:var(--text-secondary);font-size:.8rem;text-decoration:none;">Enquiry</a>
      <a href="customerCourses" style="color:var(--text-secondary);font-size:.8rem;text-decoration:none;">All Courses</a>
      <a href="login" style="color:var(--text-secondary);font-size:.8rem;text-decoration:none;">Staff Login</a>
    </div>
    <div style="font-size:.72rem;color:var(--text-muted);">2025 Coding Adda. All rights reserved.</div>
  </footer>

</body>
</html>
