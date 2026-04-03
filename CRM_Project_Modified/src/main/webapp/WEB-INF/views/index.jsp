<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Coding Adda - Learn. Build. Grow.</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    /* HERO */
    .hero-section {
      position: relative; padding: 5rem 2rem 3.5rem; text-align: center; overflow: hidden;
    }
    .hero-section::before {
      content: ''; position: absolute; inset: 0;
      background: radial-gradient(ellipse 80% 50% at 50% -10%, rgba(255,107,53,0.18) 0%, transparent 70%),
                  radial-gradient(ellipse 40% 30% at 80% 80%, rgba(0,212,170,0.1) 0%, transparent 60%);
      pointer-events: none;
    }
    .hero-badge {
      display: inline-flex; align-items: center; gap: .5rem;
      background: rgba(255,107,53,0.12); border: 1px solid rgba(255,107,53,0.35);
      border-radius: 50px; padding: .35rem 1.1rem; font-size: .78rem;
      color: var(--accent); font-weight: 600; letter-spacing: .5px; text-transform: uppercase;
      margin-bottom: 1.5rem;
    }
    .hero-badge .pdot {
      width: 7px; height: 7px; background: var(--success); border-radius: 50%;
      animation: pulse 1.5s infinite;
    }
    .hero-title {
      font-family: 'Sora', sans-serif;
      font-size: clamp(2rem, 5vw, 3.4rem); font-weight: 900;
      color: var(--text-primary); line-height: 1.1; margin-bottom: 1.25rem;
    }
    .hero-title .grad {
      background: linear-gradient(135deg, #ff6b35 0%, #ffd166 50%, #00d4aa 100%);
      -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;
    }
    .hero-subtitle {
      font-size: 1.025rem; color: var(--text-secondary); max-width: 560px;
      margin: 0 auto 2.25rem; line-height: 1.75;
    }
    .hero-actions {
      display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; margin-bottom: 2.5rem;
    }
    .btn-hp {
      background: linear-gradient(135deg, #ff6b35, #ff8c5a); color: #fff; border: none;
      border-radius: 50px; padding: .75rem 2rem; font-size: .95rem; font-weight: 700;
      cursor: pointer; text-decoration: none; display: inline-flex; align-items: center; gap: .5rem;
      transition: all .25s; box-shadow: 0 4px 20px rgba(255,107,53,0.45);
    }
    .btn-hp:hover { transform: translateY(-2px); box-shadow: 0 8px 30px rgba(255,107,53,0.65); color: #fff; }
    .btn-hs {
      background: transparent; color: var(--text-primary); border: 1px solid var(--border-light);
      border-radius: 50px; padding: .75rem 2rem; font-size: .95rem; font-weight: 600;
      text-decoration: none; display: inline-flex; align-items: center; gap: .5rem; transition: all .25s;
    }
    .btn-hs:hover { border-color: var(--accent); color: var(--accent); background: var(--accent-soft); }
    .tech-pills { display: flex; flex-wrap: wrap; gap: .55rem; justify-content: center; margin-bottom: .5rem; }
    .tech-pill {
      background: var(--bg-card); border: 1px solid var(--border); border-radius: 50px;
      padding: .32rem .9rem; font-size: .77rem; color: var(--text-secondary);
      display: flex; align-items: center; gap: .35rem; transition: all .2s;
    }
    .tech-pill:hover { border-color: var(--accent); color: var(--accent); }
    .tech-pill i { color: var(--accent); }

    /* STATS */
    .stats-bar {
      display: grid; grid-template-columns: repeat(4, 1fr); gap: 1px;
      background: var(--border); border: 1px solid var(--border);
      border-radius: var(--radius-xl); overflow: hidden; margin: 0 auto 3.5rem; max-width: 860px;
    }
    .stat-item { background: var(--bg-card); padding: 1.5rem 1rem; text-align: center; transition: background .2s; }
    .stat-item:hover { background: var(--bg-card-hover); }
    .stat-num { font-family: 'Sora', sans-serif; font-size: 1.9rem; font-weight: 800; color: var(--text-primary); line-height: 1; margin-bottom: .3rem; }
    .stat-num span { color: var(--accent); }
    .stat-label { font-size: .74rem; color: var(--text-secondary); font-weight: 500; }
    @media(max-width:600px){.stats-bar{grid-template-columns:repeat(2,1fr);}}

    /* SECTION HEAD */
    .section-head { text-align: center; margin-bottom: 2.25rem; }
    .section-head .tag {
      display: inline-block; background: var(--accent-soft); color: var(--accent);
      font-size: .72rem; font-weight: 700; letter-spacing: 1px; text-transform: uppercase;
      padding: .28rem .9rem; border-radius: 50px; margin-bottom: .7rem;
    }
    .section-head h2 {
      font-family: 'Sora', sans-serif; font-size: clamp(1.5rem, 3vw, 2rem);
      font-weight: 800; color: var(--text-primary); margin-bottom: .45rem;
    }
    .section-head p { color: var(--text-secondary); font-size: .9rem; max-width: 480px; margin: 0 auto; }

    /* CATEGORY TABS */
    .cat-tabs { display: flex; gap: .45rem; flex-wrap: wrap; justify-content: center; margin-bottom: 1.75rem; }
    .cat-tab {
      background: var(--bg-card); border: 1px solid var(--border); border-radius: 50px;
      padding: .38rem 1.05rem; font-size: .79rem; color: var(--text-secondary);
      cursor: pointer; transition: all .2s; font-weight: 500;
    }
    .cat-tab:hover, .cat-tab.active { background: var(--accent-soft); border-color: var(--accent); color: var(--accent); }

    /* FILTER BAR */
    .filter-bar { display: flex; align-items: center; gap: .7rem; flex-wrap: wrap; margin-bottom: 1.75rem; }
    .search-wrap { position: relative; flex: 1; min-width: 200px; }
    .search-wrap i { position: absolute; left: .75rem; top: 50%; transform: translateY(-50%); color: var(--text-secondary); font-size: .9rem; pointer-events: none; }
    .search-wrap input {
      width: 100%; background: var(--bg-card); border: 1px solid var(--border);
      border-radius: var(--radius-md); color: var(--text-primary);
      padding: .6rem 1rem .6rem 2.4rem; font-size: .875rem; outline: none; transition: var(--transition);
    }
    .search-wrap input:focus { border-color: var(--accent); box-shadow: 0 0 0 3px var(--accent-soft); }
    .sort-select {
      background: var(--bg-card); border: 1px solid var(--border);
      border-radius: var(--radius-md); color: var(--text-primary);
      padding: .6rem 1rem; font-size: .875rem; outline: none; cursor: pointer;
    }
    .results-count { color: var(--text-secondary); font-size: .8rem; white-space: nowrap; }

    /* COURSE CARDS */
    .courses-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 1.35rem; }
    .course-card {
      background: var(--bg-card); border: 1px solid var(--border);
      border-radius: var(--radius-lg); overflow: hidden;
      display: flex; flex-direction: column; transition: all .25s; cursor: pointer; position: relative;
    }
    .course-card::after {
      content: ''; position: absolute; inset: 0; border-radius: var(--radius-lg);
      background: linear-gradient(135deg, rgba(255,107,53,0.06) 0%, transparent 60%);
      opacity: 0; transition: opacity .25s; pointer-events: none;
    }
    .course-card:hover::after { opacity: 1; }
    .course-card:hover { border-color: var(--accent); transform: translateY(-6px); box-shadow: 0 12px 40px rgba(255,107,53,0.18); }
    .course-card .img-wrap { position: relative; overflow: hidden; }
    .course-card-img { width: 100%; height: 185px; object-fit: cover; display: block; background: var(--bg-secondary); transition: transform .4s ease; }
    .course-card:hover .course-card-img { transform: scale(1.05); }
    .img-overlay { position: absolute; inset: 0; background: linear-gradient(to top, rgba(13,15,20,0.65) 0%, transparent 50%); }
    .sale-badge {
      position: absolute; top: 12px; left: 12px; background: var(--success); color: #000;
      font-size: .68rem; font-weight: 700; padding: 3px 10px; border-radius: 20px;
    }
    .course-card-body { padding: 1.2rem 1.3rem; flex: 1; display: flex; flex-direction: column; }
    .trainer-mini { display: flex; align-items: center; gap: .6rem; margin-bottom: .75rem; }
    .trainer-mini img { width: 30px; height: 30px; border-radius: 50%; object-fit: cover; border: 2px solid var(--accent); }
    .trainer-mini .tname { font-size: .78rem; color: var(--text-secondary); }
    .trainer-mini .tname strong { color: var(--text-primary); font-weight: 600; }
    .course-card-name { font-size: 1rem; font-weight: 700; color: var(--text-primary); margin-bottom: .4rem; line-height: 1.35; }
    .course-card-desc {
      font-size: .79rem; color: var(--text-muted); line-height: 1.6; margin-bottom: .8rem;
      display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
    }
    .course-meta-row { display: flex; gap: .6rem; margin-bottom: .85rem; flex-wrap: wrap; }
    .meta-chip {
      background: var(--bg-secondary); border: 1px solid var(--border); border-radius: 8px;
      padding: .28rem .65rem; font-size: .72rem; color: var(--text-secondary);
      display: flex; align-items: center; gap: .3rem;
    }
    .meta-chip i { color: var(--accent); font-size: .75rem; }
    .course-card-footer {
      display: flex; align-items: center; justify-content: space-between;
      margin-top: auto; padding-top: .9rem; border-top: 1px solid var(--border);
    }
    .price-group .orig { font-size: .72rem; color: var(--text-muted); text-decoration: line-through; display: block; }
    .price-group .sale { font-size: 1.1rem; font-weight: 800; color: var(--success); }
    .btn-enroll {
      background: linear-gradient(135deg, #ff6b35, #ff8c5a); color: #fff; border: none;
      border-radius: var(--radius-sm); padding: .48rem 1rem; font-size: .8rem; font-weight: 700;
      cursor: pointer; transition: all .25s; text-decoration: none;
      display: inline-flex; align-items: center; gap: .35rem;
      box-shadow: 0 2px 10px rgba(255,107,53,0.32);
    }
    .btn-enroll:hover { transform: translateY(-1px); box-shadow: 0 4px 18px rgba(255,107,53,0.52); color: #fff; }

    /* EMPTY STATE */
    .empty-state {
      display: none; text-align: center; padding: 4.5rem 2rem;
      color: var(--text-secondary); grid-column: 1 / -1;
    }
    .empty-state i { font-size: 3rem; display: block; margin-bottom: .85rem; color: var(--border-light); }

    /* WHY US */
    .why-section {
      margin: 4rem 0; padding: 3rem 2rem;
      background: var(--bg-card); border: 1px solid var(--border);
      border-radius: var(--radius-xl); position: relative; overflow: hidden;
    }
    .why-section::before {
      content: ''; position: absolute; top: -40%; right: -15%;
      width: 380px; height: 380px;
      background: radial-gradient(circle, rgba(255,107,53,0.07) 0%, transparent 70%);
      pointer-events: none;
    }
    .why-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 1.35rem; margin-top: 2rem; }
    .why-card {
      background: var(--bg-secondary); border: 1px solid var(--border);
      border-radius: var(--radius-lg); padding: 1.5rem 1.25rem; text-align: center; transition: all .25s;
    }
    .why-card:hover { border-color: var(--accent); transform: translateY(-3px); }
    .why-icon {
      width: 52px; height: 52px; background: var(--accent-soft); border: 1px solid rgba(255,107,53,0.3);
      border-radius: var(--radius-md); display: flex; align-items: center; justify-content: center;
      margin: 0 auto .85rem; font-size: 1.4rem;
    }
    .why-card h5 { font-family: 'Sora', sans-serif; font-size: .9rem; font-weight: 700; color: var(--text-primary); margin-bottom: .4rem; }
    .why-card p { font-size: .78rem; color: var(--text-secondary); line-height: 1.6; margin: 0; }

    /* TESTIMONIALS */
    .t-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(275px, 1fr)); gap: 1.15rem; }
    .t-card {
      background: var(--bg-card); border: 1px solid var(--border);
      border-radius: var(--radius-lg); padding: 1.4rem; transition: all .2s;
    }
    .t-card:hover { border-color: var(--border-light); transform: translateY(-2px); }
    .t-card .qm { font-size: 2rem; color: var(--accent); opacity: .3; line-height: 1; margin-bottom: .4rem; font-family: Georgia, serif; }
    .t-card p { font-size: .84rem; color: var(--text-secondary); line-height: 1.7; margin-bottom: 1rem; font-style: italic; }
    .t-author { display: flex; align-items: center; gap: .75rem; }
    .t-author img { width: 36px; height: 36px; border-radius: 50%; object-fit: cover; border: 2px solid var(--accent); }
    .t-name { font-size: .83rem; font-weight: 700; color: var(--text-primary); }
    .t-role { font-size: .72rem; color: var(--text-muted); }
    .t-stars { color: #fbbf24; font-size: .74rem; margin-bottom: .1rem; }

    /* CTA BANNER */
    .cta-banner {
      margin-top: 4rem; padding: 3rem 2rem;
      background: linear-gradient(135deg, rgba(255,107,53,0.12) 0%, rgba(0,212,170,0.07) 100%);
      border: 1px solid rgba(255,107,53,0.22); border-radius: var(--radius-xl);
      text-align: center; position: relative; overflow: hidden;
    }
    .cta-banner h2 {
      font-family: 'Sora', sans-serif; font-size: clamp(1.35rem, 3vw, 1.85rem);
      font-weight: 800; color: var(--text-primary); margin-bottom: .6rem;
    }
    .cta-banner p { color: var(--text-secondary); font-size: .93rem; margin-bottom: 1.75rem; max-width: 460px; margin-left: auto; margin-right: auto; }

    /* STAFF OVERLAY */
    .staff-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,.75); backdrop-filter: blur(4px); z-index: 3000; align-items: center; justify-content: center; }
    .staff-overlay.show { display: flex; }
    .staff-panel { background: var(--bg-card); border: 1px solid var(--border-light); border-radius: var(--radius-xl); padding: 2rem 2.25rem; width: 100%; max-width: 340px; position: relative; animation: slideUp .25s ease; }
    .staff-panel h5 { font-family: 'Sora', sans-serif; font-size: 1.05rem; font-weight: 700; color: var(--text-primary); text-align: center; margin-bottom: 1.5rem; }
    .staff-panel .close-btn { position: absolute; top: .85rem; right: 1rem; background: none; border: none; color: var(--text-secondary); font-size: 1.2rem; cursor: pointer; }
    .staff-panel .close-btn:hover { color: var(--text-primary); }
    .login-choice { display: flex; flex-direction: column; gap: .75rem; }
    .login-choice a { display: flex; align-items: center; gap: 1rem; padding: .9rem 1.1rem; background: var(--bg-secondary); border: 1px solid var(--border); border-radius: var(--radius-md); color: var(--text-primary); text-decoration: none; font-size: .9rem; font-weight: 500; transition: var(--transition); }
    .login-choice a:hover { border-color: var(--accent); background: var(--accent-soft); color: var(--accent); }
    .login-choice a i { font-size: 1.4rem; color: var(--accent); width: 28px; text-align: center; }
    .login-choice .sub { font-size: .73rem; color: var(--text-secondary); font-weight: 400; display: block; }

    /* FOOTER */
    .site-footer { margin-top: 4rem; padding: 2.5rem 2rem 1.5rem; border-top: 1px solid var(--border); text-align: center; }
    .footer-brand { font-family: 'Sora', sans-serif; font-size: 1.3rem; font-weight: 800; color: var(--text-primary); margin-bottom: .5rem; display: flex; align-items: center; gap: .6rem; justify-content: center; }
    .footer-brand .fdot { width: 8px; height: 8px; background: var(--accent); border-radius: 50%; box-shadow: 0 0 8px var(--accent); }
    .footer-links { display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap; margin: 1rem 0; }
    .footer-links a { color: var(--text-secondary); font-size: .83rem; text-decoration: none; transition: color .2s; }
    .footer-links a:hover { color: var(--accent); }
    .footer-copy { font-size: .74rem; color: var(--text-muted); margin-top: .75rem; }

    @keyframes slideUp { from { opacity:0;transform:translateY(30px); } to { opacity:1;transform:translateY(0); } }
    @media(max-width:768px){ .hero-section{padding:3rem 1.25rem 2.5rem;} .courses-grid{grid-template-columns:1fr;} }
  </style>
</head>
<body>

  <!-- HEADER -->
  <header class="crm-header">
    <a href="/" class="brand">
      <span class="brand-dot"></span>
      Coding Adda
    </a>
    <div class="header-right" style="display:flex;align-items:center;gap:.75rem;">
      <a href="customerCourses"
         style="color:var(--text-secondary);font-size:.875rem;text-decoration:none;display:flex;align-items:center;gap:.35rem;"
         onmouseover="this.style.color='var(--accent)'" onmouseout="this.style.color='var(--text-secondary)'">
        <i class="bi bi-grid-3x3-gap"></i> Courses
      </a>
      <a href="customerEnquiryPublic"
         style="color:var(--text-secondary);font-size:.875rem;text-decoration:none;display:flex;align-items:center;gap:.35rem;"
         onmouseover="this.style.color='var(--accent)'" onmouseout="this.style.color='var(--text-secondary)'">
        <i class="bi bi-chat-dots"></i> Enquiry
      </a>
      <button class="btn-primary-dark" style="padding:.45rem 1rem;font-size:.85rem;" onclick="showStaffPanel()">
        <i class="bi bi-box-arrow-in-right"></i> Staff Login
      </button>
    </div>
  </header>

  <!-- STAFF LOGIN OVERLAY -->
  <div class="staff-overlay" id="staffOverlay" onclick="hideOnBackdrop(event)">
    <div class="staff-panel">
      <button class="close-btn" onclick="hideStaffPanel()"><i class="bi bi-x-lg"></i></button>
      <h5><i class="bi bi-shield-lock me-2" style="color:var(--accent);"></i>Staff Login</h5>
      <div class="login-choice">
        <a href="login">
          <i class="bi bi-shield-check"></i>
          <div>Admin <span class="sub">Full system access</span></div>
        </a>
        <a href="login">
          <i class="bi bi-person-badge"></i>
          <div>Employee <span class="sub">Enquiries, follow-ups &amp; sales</span></div>
        </a>
      </div>
      <p style="text-align:center;font-size:.75rem;color:var(--text-muted);margin-top:1.25rem;">Both roles use the same login page.</p>
    </div>
  </div>

  <!-- HERO -->
  <section class="hero-section">
    <div class="hero-badge">
      <span class="pdot"></span>
      12 Courses Now Live - Enroll Today!
    </div>
    <h1 class="hero-title">
      Your Code Journey<br>Starts at <span class="grad">Coding Adda</span>
    </h1>
    <p class="hero-subtitle">
      Master in-demand tech skills with India's most passionate trainers.
      From Python to Blockchain - we have your career covered.
    </p>
    <div class="hero-actions">
      <a href="#courses" class="btn-hp"><i class="bi bi-rocket-takeoff"></i> Explore Courses</a>
      <a href="customerEnquiryPublic" class="btn-hs"><i class="bi bi-chat-dots"></i> Talk to an Advisor</a>
    </div>
    <div class="tech-pills">
      <span class="tech-pill"><i class="bi bi-code-slash"></i> Python</span>
      <span class="tech-pill"><i class="bi bi-cup-hot"></i> Java</span>
      <span class="tech-pill"><i class="bi bi-phone"></i> Android</span>
      <span class="tech-pill"><i class="bi bi-cloud"></i> DevOps</span>
      <span class="tech-pill"><i class="bi bi-shield"></i> Cybersecurity</span>
      <span class="tech-pill"><i class="bi bi-palette"></i> UI/UX</span>
      <span class="tech-pill"><i class="bi bi-currency-bitcoin"></i> Blockchain</span>
      <span class="tech-pill"><i class="bi bi-graph-up"></i> Data Science</span>
    </div>
  </section>

  <div class="page-wrapper">

    <!-- STATS BAR -->
    <div class="stats-bar">
      <div class="stat-item">
        <div class="stat-num" id="sn1">2000<span>+</span></div>
        <div class="stat-label">Students Trained</div>
      </div>
      <div class="stat-item">
        <div class="stat-num" id="sn2">12<span>+</span></div>
        <div class="stat-label">Expert Courses</div>
      </div>
      <div class="stat-item">
        <div class="stat-num" id="sn3">95<span>%</span></div>
        <div class="stat-label">Placement Rate</div>
      </div>
      <div class="stat-item">
        <div class="stat-num" id="sn4">10<span>+</span></div>
        <div class="stat-label">Expert Trainers</div>
      </div>
    </div>

    <!-- COURSES SECTION -->
    <section id="courses">
      <div class="section-head">
        <span class="tag">All Courses</span>
        <h2>Choose Your Learning Path</h2>
        <p>Handpicked technical courses designed to get you job-ready fast.</p>
      </div>

      <div class="cat-tabs" id="catTabs">
        <button class="cat-tab active" onclick="filterByCategory('all', this)">All Courses</button>
        <button class="cat-tab" onclick="filterByCategory('web', this)">Web Dev</button>
        <button class="cat-tab" onclick="filterByCategory('data', this)">Data and AI</button>
        <button class="cat-tab" onclick="filterByCategory('mobile', this)">Mobile</button>
        <button class="cat-tab" onclick="filterByCategory('security', this)">Security</button>
        <button class="cat-tab" onclick="filterByCategory('design', this)">Design</button>
        <button class="cat-tab" onclick="filterByCategory('blockchain', this)">Blockchain</button>
      </div>

      <div class="filter-bar">
        <div class="search-wrap">
          <i class="bi bi-search"></i>
          <input type="text" id="searchInput" placeholder="Search courses or trainer name..." oninput="filterCourses()">
        </div>
        <select class="sort-select" id="sortSelect" onchange="filterCourses()">
          <option value="default">Sort: Default</option>
          <option value="price-low">Price: Low to High</option>
          <option value="price-high">Price: High to Low</option>
          <option value="name-az">Name: A to Z</option>
        </select>
        <span class="results-count" id="resultsCount"></span>
      </div>

      <div class="courses-grid" id="coursesGrid">
        <c:forEach var="product" items="${model_products_list}">
          <div class="course-card"
               data-name="${product.coursename}"
               data-trainer="${product.trainersname}"
               data-price="${product.discountedprice}"
               onclick="goToDetail('${product.coursename}')">
            <div class="img-wrap">
              <img class="course-card-img"
                   src="${product.courseimage}"
                   alt="${product.coursename}"
                   onerror="this.src='https://images.unsplash.com/photo-1516116216624-53e697fedbea?w=600&q=80'"/>
              <div class="img-overlay"></div>
              <c:if test="${product.originalprice != product.discountedprice}">
                <span class="sale-badge">SALE</span>
              </c:if>
            </div>
            <div class="course-card-body">
              <div class="trainer-mini">
                <img src="${product.trainerimage}"
                     alt="${product.trainersname}"
                     onerror="this.src='https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=60&q=80'"/>
                <div class="tname">by <strong>${product.trainersname}</strong></div>
              </div>
              <div class="course-card-name">${product.coursename}</div>
              <div class="course-card-desc">${product.syllabus}</div>
              <div class="course-meta-row">
                <span class="meta-chip"><i class="bi bi-clock"></i>${product.coursevalidity}</span>
                <span class="meta-chip"><i class="bi bi-patch-check"></i>Certificate</span>
              </div>
              <div class="course-card-footer">
                <div class="price-group">
                  <span class="orig">Rs. ${product.originalprice}</span>
                  <span class="sale">Rs. ${product.discountedprice}</span>
                </div>
                <a href="customerCourseDetail?courseName=${product.coursename}"
                   class="btn-enroll" onclick="event.stopPropagation()">
                  <i class="bi bi-arrow-right-circle"></i> Enroll
                </a>
              </div>
            </div>
          </div>
        </c:forEach>
        <div class="empty-state" id="emptyState">
          <i class="bi bi-search"></i>
          <p>No courses match your search. Try a different keyword.</p>
        </div>
      </div>
    </section>

    <!-- WHY CODING ADDA -->
    <div class="why-section">
      <div class="section-head" style="margin-bottom:0;">
        <span class="tag">Why Choose Us</span>
        <h2>The Coding Adda Difference</h2>
        <p>We do not just teach code - we build careers.</p>
      </div>
      <div class="why-grid">
        <div class="why-card"><div class="why-icon">&#127942;</div><h5>Industry Experts</h5><p>Learn from professionals with 7-12 years of real-world experience at top MNCs and startups.</p></div>
        <div class="why-card"><div class="why-icon">&#128640;</div><h5>Live Projects</h5><p>Every course includes 2-4 real-world projects to build your portfolio from day one.</p></div>
        <div class="why-card"><div class="why-icon">&#128220;</div><h5>Recognized Certificates</h5><p>Our certificates are recognized by 50+ hiring partners across India and abroad.</p></div>
        <div class="why-card"><div class="why-icon">&#128172;</div><h5>24/7 Doubt Support</h5><p>Never get stuck. Our mentors are available round the clock to clear your doubts.</p></div>
        <div class="why-card"><div class="why-icon">&#128188;</div><h5>Placement Assistance</h5><p>95% of our students get placed within 3 months. We do mock interviews and referrals.</p></div>
        <div class="why-card"><div class="why-icon">&#128197;</div><h5>Flexible Batches</h5><p>Weekday, weekend, and evening batches. Learn at your pace, not ours.</p></div>
      </div>
    </div>

    <!-- TESTIMONIALS -->
    <section style="margin:4rem 0;">
      <div class="section-head">
        <span class="tag">Student Stories</span>
        <h2>What Our Students Say</h2>
        <p>Real results from real students who chose Coding Adda.</p>
      </div>
      <div class="t-grid">
        <div class="t-card">
          <div class="qm">"</div>
          <p>Coding Adda's Full Stack course completely changed my career. I went from a BCA fresher to a React developer at a Pune startup in just 6 months. The live projects were the game-changer!</p>
          <div class="t-author">
            <img src="https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=80&q=80" alt="Akash"/>
            <div><div class="t-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div><div class="t-name">Akash Mahajan</div><div class="t-role">Frontend Dev at TechSpark, Pune</div></div>
          </div>
        </div>
        <div class="t-card">
          <div class="qm">"</div>
          <p>The Data Science course with Dr. Vikram was absolutely phenomenal. His teaching style breaks down complex ML algorithms into simple concepts. Got placed at a fintech startup right after!</p>
          <div class="t-author">
            <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=80&q=80" alt="Meghna"/>
            <div><div class="t-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div><div class="t-name">Meghna Shetty</div><div class="t-role">Data Analyst at PayEdge, Mumbai</div></div>
          </div>
        </div>
        <div class="t-card">
          <div class="qm">"</div>
          <p>Arjun sir's Cybersecurity course is the real deal. I cleared my CEH exam on the first attempt! The CTF challenges and hands-on labs made everything click. Worth every rupee!</p>
          <div class="t-author">
            <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=80&q=80" alt="Ravi"/>
            <div><div class="t-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div><div class="t-name">Ravi Thorat</div><div class="t-role">Security Analyst at InfoGuard, Bangalore</div></div>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA BANNER -->
    <div class="cta-banner">
      <h2>Ready to Start Your Tech Career?</h2>
      <p>Join 2,000+ students already learning at Coding Adda. Limited seats available.</p>
      <div style="display:flex;gap:1rem;justify-content:center;flex-wrap:wrap;">
        <a href="#courses" class="btn-hp"><i class="bi bi-mortarboard"></i> Browse All Courses</a>
        <a href="customerEnquiryPublic" class="btn-hs"><i class="bi bi-telephone"></i> Get a Free Callback</a>
      </div>
    </div>

    <!-- FOOTER -->
    <footer class="site-footer">
      <div class="footer-brand"><span class="fdot"></span>Coding Adda</div>
      <div class="footer-links">
        <a href="#courses">Courses</a>
        <a href="customerCourses">All Courses</a>
        <a href="customerEnquiryPublic">Enquiry</a>
        <a href="login">Staff Login</a>
        <a href="#">About Us</a>
        <a href="#">Contact</a>
      </div>
      <div class="footer-copy">2025 Coding Adda. All rights reserved. Made with love for learners.</div>
    </footer>

  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      var n = document.querySelectorAll('#coursesGrid .course-card[data-name]').length;
      document.getElementById('resultsCount').textContent = n + ' courses available';
    });
    function goToDetail(name) { window.location.href = '/customerCourseDetail?courseName=' + encodeURIComponent(name); }
    var _cat = 'all';
    function filterByCategory(cat, btn) {
      document.querySelectorAll('.cat-tab').forEach(function(t){ t.classList.remove('active'); });
      btn.classList.add('active');
      _cat = cat;
      filterCourses();
    }
    function filterCourses() {
      var query = (document.getElementById('searchInput').value || '').toLowerCase().trim();
      var sort  = document.getElementById('sortSelect').value;
      var grid  = document.getElementById('coursesGrid');
      var cards = Array.from(grid.querySelectorAll('.course-card[data-name]'));
      var visible = cards.filter(function(c) {
        var n = (c.dataset.name || '').toLowerCase();
        var t = (c.dataset.trainer || '').toLowerCase();
        var all = n + ' ' + t;
        var matchQ = !query || all.includes(query);
        var matchC = _cat === 'all';
        if (!matchC) {
          if (_cat === 'web')        matchC = all.includes('web') || all.includes('react') || all.includes('node') || all.includes('full stack') || all.includes('next');
          else if (_cat === 'data')  matchC = all.includes('data') || all.includes('machine') || all.includes('python') || all.includes('science') || all.includes('ml') || all.includes('ai');
          else if (_cat === 'mobile') matchC = all.includes('android') || all.includes('app');
          else if (_cat === 'security') matchC = all.includes('security') || all.includes('cyber') || all.includes('hack') || all.includes('ethical');
          else if (_cat === 'design') matchC = all.includes('design') || all.includes('ui') || all.includes('ux') || all.includes('figma');
          else if (_cat === 'blockchain') matchC = all.includes('blockchain') || all.includes('web3') || all.includes('crypto');
        }
        return matchQ && matchC;
      });
      visible.sort(function(a, b) {
        if (sort === 'price-low')  return parseFloat(a.dataset.price||0) - parseFloat(b.dataset.price||0);
        if (sort === 'price-high') return parseFloat(b.dataset.price||0) - parseFloat(a.dataset.price||0);
        if (sort === 'name-az')    return (a.dataset.name||'').localeCompare(b.dataset.name||'');
        return 0;
      });
      cards.forEach(function(c) { c.style.display = 'none'; });
      visible.forEach(function(c) { c.style.display = 'flex'; grid.appendChild(c); });
      document.getElementById('emptyState').style.display = visible.length === 0 ? 'block' : 'none';
      document.getElementById('resultsCount').textContent = visible.length + (visible.length !== 1 ? ' courses' : ' course') + ' found';
    }
    function showStaffPanel() { document.getElementById('staffOverlay').classList.add('show'); }
    function hideStaffPanel() { document.getElementById('staffOverlay').classList.remove('show'); }
    function hideOnBackdrop(e) { if (e.target === document.getElementById('staffOverlay')) hideStaffPanel(); }
    document.querySelectorAll('a[href^="#"]').forEach(function(a) {
      a.addEventListener('click', function(e) {
        var t = document.querySelector(this.getAttribute('href'));
        if (t) { e.preventDefault(); t.scrollIntoView({behavior:'smooth',block:'start'}); }
      });
    });
  </script>
</body>
</html>
