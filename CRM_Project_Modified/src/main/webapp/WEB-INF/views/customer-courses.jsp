<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Our Courses – Coding Adda</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

  <style>
    /* ── Customer Page Styles ── */
    .customer-hero {
      background: linear-gradient(135deg, var(--bg-card) 0%, var(--bg-dark) 100%);
      border: 1px solid var(--border);
      border-radius: var(--radius-lg);
      padding: 3rem 2rem;
      text-align: center;
      margin-bottom: 2rem;
      position: relative;
      overflow: hidden;
    }
    .customer-hero::before {
      content: '';
      position: absolute;
      top: -60px; right: -60px;
      width: 200px; height: 200px;
      border-radius: 50%;
      background: var(--accent);
      opacity: 0.05;
    }
    .customer-hero h1 {
      font-size: 2rem;
      font-weight: 700;
      color: var(--text-primary);
      margin-bottom: .5rem;
    }
    .customer-hero h1 span { color: var(--accent); }
    .customer-hero p { color: var(--text-secondary); font-size: 1rem; margin-bottom: 1.5rem; }

    /* Filter bar */
    .filter-bar {
      display: flex;
      align-items: center;
      gap: .75rem;
      flex-wrap: wrap;
      margin-bottom: 1.75rem;
    }
    .filter-bar input {
      flex: 1;
      min-width: 200px;
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: var(--radius-md);
      color: var(--text-primary);
      padding: .55rem 1rem .55rem 2.4rem;
      font-size: .875rem;
      outline: none;
      transition: border-color .2s;
    }
    .filter-bar input:focus { border-color: var(--accent); }
    .filter-bar .search-wrap { position: relative; flex: 1; min-width: 200px; }
    .filter-bar .search-wrap i {
      position: absolute; left: .75rem; top: 50%;
      transform: translateY(-50%);
      color: var(--text-secondary); font-size: .9rem;
    }
    .sort-select {
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: var(--radius-md);
      color: var(--text-primary);
      padding: .55rem 1rem;
      font-size: .875rem;
      outline: none;
      cursor: pointer;
    }
    .results-count {
      color: var(--text-secondary);
      font-size: .8rem;
      white-space: nowrap;
    }

    /* Course Cards Grid */
    .courses-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(290px, 1fr));
      gap: 1.25rem;
    }
    .course-card {
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: var(--radius-lg);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      transition: transform .2s, border-color .2s, box-shadow .2s;
      cursor: pointer;
    }
    .course-card:hover {
      transform: translateY(-4px);
      border-color: var(--accent);
      box-shadow: 0 8px 32px rgba(0,0,0,.3);
    }
    .course-card-img {
      width: 100%;
      height: 170px;
      object-fit: cover;
      display: block;
      background: var(--bg-dark);
    }
    .course-card-body {
      padding: 1.1rem 1.2rem;
      flex: 1;
      display: flex;
      flex-direction: column;
    }
    .course-card-name {
      font-size: 1rem;
      font-weight: 600;
      color: var(--text-primary);
      margin-bottom: .35rem;
      line-height: 1.4;
    }
    .course-card-trainer {
      font-size: .78rem;
      color: var(--text-secondary);
      margin-bottom: .75rem;
    }
    .course-card-trainer i { color: var(--accent); margin-right: .25rem; }
    .course-card-validity {
      font-size: .75rem;
      color: var(--text-secondary);
      margin-bottom: .85rem;
    }
    .course-card-validity i { margin-right: .25rem; }
    .course-card-footer {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-top: auto;
      padding-top: .85rem;
      border-top: 1px solid var(--border);
    }
    .price-group .original-price {
      font-size: .75rem;
      color: var(--text-secondary);
      text-decoration: line-through;
      display: block;
    }
    .price-group .sale-price {
      font-size: 1.05rem;
      font-weight: 700;
      color: var(--accent);
    }
    .btn-enroll {
      background: linear-gradient(135deg, #ff6b35, #ff8c5a);
      color: #fff;
      border: none;
      border-radius: var(--radius-md);
      padding: .45rem 1rem;
      font-size: .8rem;
      font-weight: 600;
      cursor: pointer;
      transition: all .25s;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: .3rem;
      box-shadow: 0 2px 10px rgba(255,107,53,0.3);
    }
    .btn-enroll:hover { transform: translateY(-1px); box-shadow: 0 4px 18px rgba(255,107,53,0.5); color: #fff; }

    /* Discount badge */
    .discount-badge {
      position: absolute;
      top: 10px; left: 10px;
      background: #22c55e;
      color: #fff;
      font-size: .7rem;
      font-weight: 700;
      padding: 2px 8px;
      border-radius: 20px;
    }
    .img-wrap { position: relative; }

    /* Empty state */
    .empty-state {
      text-align: center;
      padding: 4rem 2rem;
      color: var(--text-secondary);
      display: none;
    }
    .empty-state i { font-size: 3rem; margin-bottom: 1rem; display: block; }

    /* Page nav link */
    .page-link-cta {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 2rem;
      flex-wrap: wrap;
      margin-top: 3rem;
      padding: 1.5rem;
      background: var(--bg-card);
      border: 1px solid var(--border);
      border-radius: var(--radius-lg);
    }
    .page-link-cta p { color: var(--text-secondary); margin: 0; font-size: .9rem; }
  </style>
</head>
<body>
  <jsp:include page="header-customer.jsp"/>

  <div class="page-wrapper">

    <!-- Hero -->
    <div class="customer-hero">
      <h1>Find Your Perfect <span>Course</span></h1>
      <p>Browse our expert-led courses and take the next step in your career journey.</p>
      <div style="display:flex;gap:.75rem;justify-content:center;flex-wrap:wrap;">
        <span style="background:var(--bg-dark);border:1px solid var(--border);border-radius:20px;padding:4px 14px;font-size:.8rem;color:var(--text-secondary);">
          <i class="bi bi-mortarboard me-1"></i> Expert Trainers
        </span>
        <span style="background:var(--bg-dark);border:1px solid var(--border);border-radius:20px;padding:4px 14px;font-size:.8rem;color:var(--text-secondary);">
          <i class="bi bi-patch-check me-1"></i> Certificate Included
        </span>
        <span style="background:var(--bg-dark);border:1px solid var(--border);border-radius:20px;padding:4px 14px;font-size:.8rem;color:var(--text-secondary);">
          <i class="bi bi-headset me-1"></i> 24/7 Support
        </span>
      </div>
    </div>

    <!-- Filter Bar -->
    <div class="filter-bar">
      <div class="search-wrap">
        <i class="bi bi-search"></i>
        <input type="text" id="searchInput" placeholder="Search courses or trainer..." oninput="filterCourses()">
      </div>
      <select class="sort-select" id="sortSelect" onchange="filterCourses()">
        <option value="default">Sort: Default</option>
        <option value="price-low">Price: Low to High</option>
        <option value="price-high">Price: High to Low</option>
        <option value="name-az">Name: A–Z</option>
      </select>
      <span class="results-count" id="resultsCount"></span>
    </div>

    <!-- Grid -->
    <div class="courses-grid" id="coursesGrid">
      <c:forEach var="product" items="${model_products_list}">
        <div class="course-card"
             data-name="${product.coursename}"
             data-trainer="${product.trainersname}"
             data-price="${product.discountedprice}"
             onclick="goToCourseDetail('${product.coursename}')">

          <div class="img-wrap">
            <img class="course-card-img"
                 src="${product.courseimage}"
                 alt="${product.coursename}"
                 onerror="this.src='/static/images/CRMimg.jpeg'"/>
            <c:set var="orig" value="${product.originalprice}"/>
            <c:set var="disc" value="${product.discountedprice}"/>
            <c:if test="${not empty orig and not empty disc and orig != disc}">
              <span class="discount-badge">SALE</span>
            </c:if>
          </div>

          <div class="course-card-body">
            <div class="course-card-name">${product.coursename}</div>
            <div class="course-card-trainer">
              <i class="bi bi-person-circle"></i>${product.trainersname}
            </div>
            <div class="course-card-validity">
              <i class="bi bi-clock"></i>Validity: ${product.coursevalidity}
            </div>
            <div class="course-card-footer">
              <div class="price-group">
                <span class="original-price">Rs. ${product.originalprice}</span>
                <span class="sale-price">Rs. ${product.discountedprice}</span>
              </div>
              <a href="customerCourseDetail?courseName=${product.coursename}"
                 class="btn-enroll"
                 onclick="event.stopPropagation()">
                <i class="bi bi-arrow-right-circle"></i> Enroll
              </a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>

    <!-- Empty state -->
    <div class="empty-state" id="emptyState">
      <i class="bi bi-search"></i>
      No courses found matching your search.
    </div>

    <!-- Bottom CTA -->
    <div class="page-link-cta">
      <p><i class="bi bi-question-circle me-2"></i>Have a question about a course?</p>
      <a href="customerEnquiryPublic" class="btn-enroll">
        <i class="bi bi-chat-dots"></i> Send an Enquiry
      </a>
    </div>

  </div>

  <script>
    // Count on load
    document.addEventListener('DOMContentLoaded', function() {
      updateCount(document.querySelectorAll('#coursesGrid .course-card').length);
    });

    function goToCourseDetail(courseName) {
      window.location.href = '/customerCourseDetail?courseName=' + encodeURIComponent(courseName);
    }

    function updateCount(n) {
      document.getElementById('resultsCount').textContent = n + ' course' + (n !== 1 ? 's' : '') + ' found';
    }

    function filterCourses() {
      const query = document.getElementById('searchInput').value.toLowerCase().trim();
      const sort  = document.getElementById('sortSelect').value;
      const grid  = document.getElementById('coursesGrid');
      let cards   = Array.from(grid.querySelectorAll('.course-card'));

      // Filter
      let visible = cards.filter(card => {
        const name    = (card.dataset.name    || '').toLowerCase();
        const trainer = (card.dataset.trainer || '').toLowerCase();
        return name.includes(query) || trainer.includes(query);
      });

      // Sort
      visible.sort((a, b) => {
        if (sort === 'price-low')  return parseFloat(a.dataset.price || 0) - parseFloat(b.dataset.price || 0);
        if (sort === 'price-high') return parseFloat(b.dataset.price || 0) - parseFloat(a.dataset.price || 0);
        if (sort === 'name-az')    return (a.dataset.name || '').localeCompare(b.dataset.name || '');
        return 0;
      });

      // Hide all, then re-append visible in sorted order
      cards.forEach(c => c.style.display = 'none');
      visible.forEach(c => { c.style.display = 'flex'; grid.appendChild(c); });

      // Empty state
      document.getElementById('emptyState').style.display = visible.length === 0 ? 'block' : 'none';
      updateCount(visible.length);
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
