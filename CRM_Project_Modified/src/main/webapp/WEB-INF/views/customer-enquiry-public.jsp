<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Enquiry – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    .enq-page { position:relative; overflow:hidden; }
    .enq-page::before {
      content:''; position:absolute; inset:0; pointer-events:none;
      background: radial-gradient(ellipse 60% 50% at 50% 0%, rgba(255,107,53,0.13) 0%, transparent 65%);
    }
    .enq-wrapper { max-width: 620px; margin: 0 auto; }
    .enq-hero { text-align:center; margin-bottom:2.25rem; }
    .enq-hero .hero-icon {
      width:64px; height:64px; background:var(--accent-soft); border:2px solid rgba(255,107,53,0.4);
      border-radius:20px; display:flex; align-items:center; justify-content:center;
      font-size:1.6rem; margin:0 auto 1rem;
    }
    .enq-hero h2 { font-family:"Sora",sans-serif; font-size:1.75rem; font-weight:800; color:var(--text-primary); margin-bottom:.4rem; }
    .enq-hero p  { color:var(--text-secondary); font-size:.9rem; }
    .enq-form-card {
      background:var(--bg-card); border:1px solid var(--border-light);
      border-radius:var(--radius-xl); padding:2rem 2.25rem;
      box-shadow:0 16px 48px rgba(0,0,0,0.35);
    }
    .field-label { font-size:.82rem; color:var(--text-secondary); font-weight:500; display:block; margin-bottom:.4rem; }
    .field-label i { color:var(--accent); margin-right:.3rem; }
    .field-input {
      width:100%; background:var(--bg-secondary); border:1px solid var(--border);
      border-radius:var(--radius-md); color:var(--text-primary);
      padding:.65rem 1rem; font-size:.875rem; outline:none; transition:all .2s;
      margin-bottom:1.15rem;
    }
    .field-input:focus { border-color:var(--accent); box-shadow:0 0 0 3px var(--accent-soft); background:var(--bg-card); }
    .field-input::placeholder { color:var(--text-muted); }
    .phone-feedback { font-size:.76rem; margin-top:-.85rem; margin-bottom:.85rem; display:none; }
    .phone-feedback.exists { color:#f87171; display:block; }
    .phone-feedback.free   { color:#4ade80; display:block; }
    .btn-submit-enq {
      display:block; width:100%;
      background:linear-gradient(135deg,#ff6b35,#ff8c5a); color:#fff;
      border:none; border-radius:var(--radius-md); padding:.8rem;
      font-size:.95rem; font-weight:700; cursor:pointer; transition:all .25s;
      box-shadow:0 4px 16px rgba(255,107,53,0.38);
    }
    .btn-submit-enq:hover { transform:translateY(-1px); box-shadow:0 6px 24px rgba(255,107,53,0.55); }
    .trust-row { display:flex; gap:.85rem; flex-wrap:wrap; justify-content:center; margin-top:1.75rem; }
    .trust-item {
      background:var(--bg-card); border:1px solid var(--border); border-radius:var(--radius-lg);
      padding:.85rem 1.1rem; text-align:center; font-size:.78rem; color:var(--text-secondary);
      flex:1; min-width:130px; transition:border-color .2s;
    }
    .trust-item:hover { border-color:var(--accent); }
    .trust-item i { font-size:1.3rem; color:var(--accent); display:block; margin-bottom:.35rem; }
    .trust-item strong { display:block; color:var(--text-primary); font-size:.82rem; margin-bottom:.15rem; }
    .back-home { display:flex; align-items:center; justify-content:center; gap:.4rem; color:var(--text-secondary); font-size:.82rem; text-decoration:none; margin-top:1.5rem; transition:color .2s; }
    .back-home:hover { color:var(--accent); }
  </style>
</head>
<body>
  <jsp:include page="header-customer.jsp"/>
  <div class="page-wrapper enq-page">
    <div class="enq-wrapper">
      <div class="enq-hero">
        <div class="hero-icon">&#128172;</div>
        <h2>Get in Touch</h2>
        <p>Fill in your details below and our team will reach out to you within 24 hours.</p>
      </div>
      <div class="enq-form-card">
        <c:if test="${not empty enroll_success}">
          <div class="alert-dark-success" style="margin-bottom:1.25rem;">
            <span><i class="bi bi-check-circle me-2"></i>${enroll_success}</span>
            <button class="alert-close" onclick="this.parentElement.style.display='none'">x</button>
          </div>
        </c:if>
        <c:if test="${not empty enroll_error}">
          <div class="alert-dark-error" style="margin-bottom:1.25rem;">
            <span><i class="bi bi-exclamation-circle me-2"></i>${enroll_error}</span>
            <button class="alert-close" onclick="this.parentElement.style.display='none'">x</button>
          </div>
        </c:if>
        <form action="customerEnquirySubmit" method="post">
          <input type="hidden" name="enquirytype" value="Website"/>
          <input type="hidden" name="callto" value="Customer To Company"/>
          <input type="hidden" name="status" value="1"/>
          <input type="hidden" name="followupdate" value=""/>
          <label class="field-label"><i class="bi bi-person"></i>Your Full Name <span style="color:var(--danger)">*</span></label>
          <input type="text" name="name" class="field-input" placeholder="e.g. Rahul Sharma" required/>
          <label class="field-label"><i class="bi bi-phone"></i>Phone Number <span style="color:var(--danger)">*</span></label>
          <input type="text" name="phoneno" id="pubPhoneInput" class="field-input" placeholder="10-digit mobile number" maxlength="10" oninput="pubPhoneCheck(this.value)" required/>
          <div class="phone-feedback" id="pubPhoneFeedback"></div>
          <label class="field-label"><i class="bi bi-mortarboard"></i>Interested Course</label>
          <select name="interestedcourse" class="field-input">
            <option value="">-- Select a course (optional) --</option>
            <c:forEach var="cname" items="${model_coursename_list}">
              <option value="${cname}" <c:if test="${cname == param.course}">selected</c:if>>${cname}</option>
            </c:forEach>
          </select>
          <label class="field-label"><i class="bi bi-chat-left-text"></i>Your Message</label>
          <textarea name="discussion" rows="4" class="field-input" placeholder="Tell us what you'd like to know, or any special requirements..."></textarea>
          <button type="submit" class="btn-submit-enq"><i class="bi bi-send me-2"></i>Send My Enquiry</button>
        </form>
      </div>
      <div class="trust-row">
        <div class="trust-item"><i class="bi bi-lightning-charge"></i><strong>Quick Response</strong>Within 24 hours</div>
        <div class="trust-item"><i class="bi bi-shield-lock"></i><strong>100% Secure</strong>Your data is safe</div>
        <div class="trust-item"><i class="bi bi-telephone-inbound"></i><strong>We Call You</strong>No spam, ever</div>
      </div>
      <a href="/" class="back-home"><i class="bi bi-arrow-left"></i> Back to Coding Adda Home</a>
    </div>
  </div>
  <script>
    var pubPhoneTimer;
    function pubPhoneCheck(val) {
      clearTimeout(pubPhoneTimer);
      var fb = document.getElementById('pubPhoneFeedback');
      fb.className = 'phone-feedback';
      if (val.length < 10) return;
      pubPhoneTimer = setTimeout(function() {
        $.get('/checkPhoneNumberAvailability', { phoneNumber: val }, function(res) {
          if (res === 'exist') { fb.textContent = 'We already have your number — our team will follow up soon!'; fb.className = 'phone-feedback exists'; }
          else { fb.textContent = 'Looks good! We will be in touch shortly.'; fb.className = 'phone-feedback free'; }
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
