<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Employee Dashboard – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
  <style>
    .emp-welcome {
      background: linear-gradient(135deg, rgba(255,107,53,0.11) 0%, rgba(0,212,170,0.06) 100%);
      border: 1px solid rgba(255,107,53,0.2); border-radius: var(--radius-xl);
      padding: 1.75rem 2rem; display:flex; align-items:center; gap:1.5rem;
      margin-bottom: 2rem; position:relative; overflow:hidden;
    }
    .emp-welcome::after {
      content:''; position:absolute; top:-50px; right:-50px;
      width:180px; height:180px;
      background: radial-gradient(circle, rgba(255,107,53,0.1) 0%, transparent 70%);
      pointer-events:none;
    }
    .emp-avatar {
      width:60px; height:60px; background:var(--accent-soft);
      border:2px solid rgba(255,107,53,0.45); border-radius:16px;
      display:flex; align-items:center; justify-content:center;
      font-size:1.6rem; flex-shrink:0;
    }
    .emp-welcome h2 { font-family:"Sora",sans-serif; font-size:1.35rem; font-weight:800; color:var(--text-primary); margin-bottom:.2rem; }
    .emp-welcome p { color:var(--text-secondary); font-size:.84rem; margin:0; }
    .emp-role-badge {
      display:inline-flex; align-items:center; gap:.35rem;
      background:rgba(0,212,170,0.1); border:1px solid rgba(0,212,170,0.3);
      color:var(--success); border-radius:50px; padding:.2rem .75rem;
      font-size:.7rem; font-weight:700; letter-spacing:.4px; margin-bottom:.35rem;
    }
    .quick-actions { display:grid; grid-template-columns:repeat(auto-fill,minmax(200px,1fr)); gap:1.1rem; margin-bottom:2rem; }
    .qa-card {
      background:var(--bg-card); border:1px solid var(--border);
      border-radius:var(--radius-lg); padding:1.4rem 1.25rem;
      text-decoration:none; display:block; transition:all .25s; position:relative; overflow:hidden;
    }
    .qa-card::before {
      content:''; position:absolute; inset:0; border-radius:var(--radius-lg);
      background:linear-gradient(135deg,rgba(255,107,53,0.05) 0%,transparent 60%);
      opacity:0; transition:opacity .25s; pointer-events:none;
    }
    .qa-card:hover::before { opacity:1; }
    .qa-card:hover { border-color:var(--accent); transform:translateY(-4px); box-shadow:0 10px 30px rgba(255,107,53,0.15); }
    .qa-icon { width:44px; height:44px; border-radius:12px; display:flex; align-items:center; justify-content:center; font-size:1.3rem; margin-bottom:.9rem; }
    .qa-card h4 { font-family:"Sora",sans-serif; font-size:.9rem; font-weight:700; color:var(--text-primary); margin-bottom:.25rem; }
    .qa-card p { font-size:.77rem; color:var(--text-secondary); margin:0; line-height:1.5; }
    .chart-section { background:var(--bg-card); border:1px solid var(--border); border-radius:var(--radius-xl); padding:1.6rem 1.75rem; margin-bottom:2rem; }
    .chart-section h4 { font-family:"Sora",sans-serif; font-size:1rem; font-weight:700; color:var(--text-primary); margin-bottom:1.25rem; display:flex; align-items:center; gap:.5rem; }
    .chart-section h4 i { color:var(--accent); }
    .enq-section { background:var(--bg-card); border:1px solid var(--border); border-radius:var(--radius-xl); padding:1.6rem 1.75rem; }
    .enq-section-head { display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:.75rem; margin-bottom:1.25rem; }
    .enq-section-head h4 { font-family:"Sora",sans-serif; font-size:1rem; font-weight:700; color:var(--text-primary); margin:0; display:flex; align-items:center; gap:.5rem; }
    .enq-count-badge { background:var(--accent); color:#fff; font-size:.68rem; padding:.15rem .55rem; border-radius:999px; }
    .refresh-note { font-size:.75rem; color:var(--text-muted); }
    .status-pill { display:inline-block; font-size:.68rem; font-weight:600; padding:.22rem .65rem; border-radius:999px; }
    .sp-open      { background:rgba(0,212,170,0.12); color:#4ade80; }
    .sp-purchased { background:rgba(96,165,250,0.12); color:#60a5fa; }
    .sp-closed    { background:var(--bg-secondary); color:var(--text-muted); }
    .src-pill { display:inline-block; font-size:.68rem; font-weight:600; padding:.22rem .65rem; border-radius:999px; }
    .src-web  { background:rgba(96,165,250,0.12); color:#60a5fa; }
    .src-call { background:rgba(0,212,170,0.12); color:#4ade80; }
    .src-other{ background:var(--bg-secondary); color:var(--text-muted); }
    @media(max-width:600px){ .emp-welcome{flex-direction:column;text-align:center;} }
  </style>
</head>
<body>
  <jsp:include page="header-employee.jsp"/>
  <div class="page-wrapper">

    <!-- Welcome Banner -->
    <div class="emp-welcome">
      <div class="emp-avatar">&#128104;&#8205;&#128187;</div>
      <div>
        <div class="emp-role-badge"><i class="bi bi-person-badge"></i> Employee</div>
        <h2>Welcome back, ${session_employee.getName()}!</h2>
        <p>Here is your Coding Adda dashboard — manage enquiries, follow-ups and sales.</p>
      </div>
    </div>

    <!-- Quick Actions -->
    <div class="quick-actions">
      <a href="customerEnquiryPage" class="qa-card">
        <div class="qa-icon" style="background:rgba(255,107,53,0.12);">&#128172;</div>
        <h4>New Enquiry</h4>
        <p>Log a fresh customer enquiry from any source.</p>
      </a>
      <a href="customerFollowupPage" class="qa-card">
        <div class="qa-icon" style="background:rgba(0,212,170,0.1);">&#128222;</div>
        <h4>Follow Ups</h4>
        <p>View and manage today's scheduled follow-up calls.</p>
      </a>
      <a href="saleCourse" class="qa-card">
        <div class="qa-icon" style="background:rgba(251,191,36,0.1);">&#127891;</div>
        <h4>Record Sale</h4>
        <p>Mark a successful course sale in the system.</p>
      </a>
    </div>

    <!-- Chart -->
    <div class="chart-section">
      <h4><i class="bi bi-bar-chart-fill"></i>Course Sales Overview</h4>
      <canvas id="myChart" style="width:100%;max-width:720px;max-height:320px;"></canvas>
    </div>

    <!-- Enquiries Table -->
    <div class="enq-section">
      <div class="enq-section-head">
        <h4>
          <i class="bi bi-inbox" style="color:var(--accent);"></i>
          Customer Enquiries
          <span class="enq-count-badge">${model_all_enquiries != null ? model_all_enquiries.size() : 0}</span>
        </h4>
        <span class="refresh-note"><i class="bi bi-arrow-clockwise me-1"></i>Auto-refreshes every 30s</span>
      </div>
      <c:choose>
        <c:when test="${not empty model_all_enquiries}">
          <div style="overflow-x:auto;">
            <table class="table-dark-custom">
              <thead>
                <tr>
                  <th>#</th><th>Name</th><th>Phone</th><th>Course</th>
                  <th>Source</th><th>Date / Time</th><th>Status</th><th>Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="enq" items="${model_all_enquiries}">
                  <tr>
                    <td style="color:var(--text-muted);font-size:.76rem;">${enq.getId()}</td>
                    <td><strong>${enq.getName()}</strong></td>
                    <td style="color:var(--text-secondary);">${enq.getPhoneno()}</td>
                    <td style="color:var(--accent);">
                      <c:choose>
                        <c:when test="${not empty enq.getInterestedcourse()}">${enq.getInterestedcourse()}</c:when>
                        <c:otherwise>—</c:otherwise>
                      </c:choose>
                    </td>
                    <td>
                      <c:choose>
                        <c:when test="${enq.getEnquirytype() == 'Website'}"><span class="src-pill src-web">&#127760; Website</span></c:when>
                        <c:when test="${enq.getEnquirytype() == 'Call'}"><span class="src-pill src-call">&#128222; Call</span></c:when>
                        <c:otherwise><span class="src-pill src-other"><c:out value="${not empty enq.getEnquirytype() ? enq.getEnquirytype() : '—'}"/></span></c:otherwise>
                      </c:choose>
                    </td>
                    <td style="color:var(--text-muted);font-size:.76rem;">${enq.getEnquirydate()}<br/><span style="font-size:.7rem;">${enq.getEnquirytime()}</span></td>
                    <td>
                      <c:choose>
                        <c:when test="${enq.getStatus() == '1'}"><span class="status-pill sp-open">Open</span></c:when>
                        <c:when test="${enq.getStatus() == '4'}"><span class="status-pill sp-purchased">Purchased</span></c:when>
                        <c:otherwise><span class="status-pill sp-closed">Closed</span></c:otherwise>
                      </c:choose>
                    </td>
                    <td>
                      <a href="custEnquiryHistoryPage?phno=${enq.getPhoneno()}" style="font-size:.78rem;color:var(--accent);text-decoration:none;display:flex;align-items:center;gap:.25rem;">
                        <i class="bi bi-eye"></i> View
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:when>
        <c:otherwise>
          <div style="text-align:center;padding:3.5rem 1rem;color:var(--text-muted);">
            <i class="bi bi-inbox" style="font-size:2.8rem;display:block;margin-bottom:.75rem;opacity:.4;"></i>
            <p style="font-size:.875rem;">No enquiries yet. They will appear here automatically.</p>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

  </div>
  <script>
    const xValues = [<c:forEach items="${model_count_course_sale}" var="row" varStatus="s">"${row[0]}"${not s.last ? ',' : ''}</c:forEach>];
    const yValues = [<c:forEach items="${model_count_course_sale}" var="row" varStatus="s">${row[1]}${not s.last ? ',' : ''}</c:forEach>];
    new Chart("myChart", {
      type: "bar",
      data: {
        labels: xValues,
        datasets: [{ label: "Sales", backgroundColor: "rgba(255,107,53,0.65)", borderColor: "rgba(255,107,53,1)", borderWidth: 1, borderRadius: 8, data: yValues }]
      },
      options: {
        legend: { display: false },
        scales: {
          yAxes: [{ ticks: { min:0, fontColor:'#8b8fa8', beginAtZero:true }, gridLines: { color:'#2a2d3e' } }],
          xAxes: [{ ticks: { fontColor:'#8b8fa8' }, gridLines: { color:'#2a2d3e' } }]
        }
      }
    });
    setTimeout(function(){ window.location.reload(); }, 30000);
  </script>
</body>
</html>
