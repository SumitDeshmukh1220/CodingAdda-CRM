-- ============================================================
--  Seed Data – 5 Technical Courses
--  Uses INSERT IGNORE with explicit IDs so MySQL does not
--  complain about missing auto_increment on the id column.
--  INSERT IGNORE silently skips any row whose id already exists,
--  so re-running the app never creates duplicates.
-- ============================================================

-- Ensure the product table id column has AUTO_INCREMENT set correctly
ALTER TABLE product MODIFY id INT NOT NULL AUTO_INCREMENT;

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1001,
  'Python Programming',
  'Introduction to Python, Data Types, Control Flow, Functions, OOP, File Handling, Exception Handling, Modules & Packages, NumPy, Pandas, Matplotlib, Mini Projects',
  '12000', '8999', '4 Months',
  '/static/uploads/python.jpg',
  'Rahul Sharma',
  'Rahul Sharma is a Python expert with 8+ years of experience in software development and data science. He has trained 500+ students and worked with top MNCs.',
  '/static/uploads/trainer.jpg',
  'Batch starts every month. Weekday & weekend batches available. Placement assistance provided.'
);

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1002,
  'Advanced Java',
  'Core Java Revision, JDBC, Servlets, JSP, Hibernate, Spring Framework, Spring Boot, REST APIs, Microservices, Maven, Git, Interview Preparation',
  '15000', '10999', '6 Months',
  '/static/uploads/advance java.jpg',
  'Priya Mehta',
  'Priya Mehta holds a Masters in Computer Science and has 10+ years of enterprise Java development experience. She specialises in Spring Boot and Microservices architecture.',
  '/static/uploads/instructor.png',
  'Includes live project. Certificate on completion. EMI option available.'
);

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1003,
  'C++ & Data Structures',
  'C++ Basics, OOP in C++, STL, Arrays, Linked Lists, Stacks, Queues, Trees, Graphs, Sorting & Searching Algorithms, Dynamic Programming, Competitive Programming Tips',
  '10000', '7499', '3 Months',
  '/static/uploads/C++.png',
  'Amit Joshi',
  'Amit Joshi is a competitive programmer and software engineer with 7 years of teaching experience. He has guided students to top tech companies through DSA mastery.',
  '/static/uploads/trainer.jpg',
  'Ideal for college students and freshers targeting product-based companies. Daily practice problems included.'
);

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1004,
  'Full Stack Web Development',
  'HTML5, CSS3, JavaScript ES6+, Bootstrap, React.js, Node.js, Express.js, MongoDB, REST APIs, Git & GitHub, Deployment on AWS/Heroku, Capstone Project',
  '20000', '14999', '6 Months',
  '/static/uploads/Advance.png',
  'Sneha Patil',
  'Sneha Patil is a full-stack developer with 9 years of industry experience at leading startups. She specialises in the MERN stack and has helped 300+ students land their first developer role.',
  '/static/uploads/instructor.png',
  'Includes 3 live projects and portfolio review. Job referral support for all graduates.'
);

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1005,
  'Data Science & Machine Learning',
  'Python for Data Science, Statistics & Probability, Data Wrangling, EDA, Machine Learning Algorithms, Supervised & Unsupervised Learning, Deep Learning Basics, NLP Intro, Model Deployment, Kaggle Projects',
  '25000', '17999', '8 Months',
  '/static/uploads/Img.jpeg',
  'Dr. Vikram Rao',
  'Dr. Vikram Rao holds a PhD in AI and has published research in leading journals. With 12 years in academia and industry, he brings real-world ML use cases to every session.',
  '/static/uploads/trainer.jpg',
  'Includes Kaggle competition participation and industry-grade capstone project. Certificate recognised by 50+ hiring partners.'
);

-- Advance the auto_increment counter past our seeded IDs so new admin-added
-- courses get IDs starting from 1006 onwards and never collide with seed data.
ALTER TABLE product AUTO_INCREMENT = 1006;

-- ============================================================
--  Additional 6 Technical Courses (IDs 1006-1011)
--  Added for Coding Adda – total now 12 courses
-- ============================================================

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1006,
  'Android App Development',
  'Java/Kotlin Basics, Android Studio Setup, Layouts & Views, Activities & Fragments, Intents, RecyclerView, SQLite & Room DB, Retrofit & REST APIs, Firebase Integration, Play Store Deployment, Capstone App Project',
  '18000', '12999', '5 Months',
  'https://images.unsplash.com/photo-1607252650355-f7fd0460ccdb?w=600&q=80',
  'Karan Desai',
  'Karan Desai is a Senior Android Developer with 8+ years at top product companies. He has published 15+ apps on the Play Store and trained over 400 students in mobile development.',
  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&q=80',
  'Includes 2 live app projects. Google Developer certification prep. Placement support provided.'
);

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1007,
  'DevOps & Cloud Engineering',
  'Linux Fundamentals, Shell Scripting, Git & GitHub, Docker, Kubernetes, Jenkins CI/CD, Ansible, Terraform, AWS Core Services (EC2, S3, RDS, Lambda), Azure Basics, Monitoring with Prometheus & Grafana',
  '22000', '15999', '6 Months',
  'https://images.unsplash.com/photo-1667372393119-3d4c48d07fc9?w=600&q=80',
  'Neha Kulkarni',
  'Neha Kulkarni is a certified AWS Solutions Architect and DevOps Engineer with 9 years of experience. She has implemented CI/CD pipelines for Fortune 500 companies and mentors engineers worldwide.',
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&h=150&fit=crop&q=80',
  'AWS & Docker certifications prep included. Live cloud lab access throughout the course. Job referrals available.'
);

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1008,
  'UI/UX Design with Figma',
  'Design Thinking, User Research, Wireframing, Prototyping, Figma Mastery, Component Libraries, Design Systems, Accessibility, Usability Testing, Responsive Design, Portfolio Building, Handoff to Developers',
  '14000', '9999', '3 Months',
  'https://images.unsplash.com/photo-1561070791-2526d30994b5?w=600&q=80',
  'Pooja Iyer',
  'Pooja Iyer is a UX Lead at a top design studio in Pune with 7 years of experience. She has designed products used by millions and judges at national design hackathons.',
  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&q=80',
  'Portfolio of 5+ real-world projects. Figma certification prep. Access to premium design resources.'
);

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1009,
  'Cybersecurity & Ethical Hacking',
  'Networking Basics, Linux for Security, OWASP Top 10, Kali Linux, Penetration Testing, Web App Security, Network Security, Cryptography, Social Engineering, Vulnerability Assessment, CTF Challenges, CEH Exam Prep',
  '19000', '13499', '5 Months',
  'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=600&q=80',
  'Arjun Nair',
  'Arjun Nair is a Certified Ethical Hacker (CEH) and OSCP holder with 10+ years in cybersecurity. He has worked with government agencies and banks to secure critical infrastructure.',
  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&q=80',
  'CEH exam voucher included. Access to private lab environment. Bug bounty guidance sessions.'
);

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1010,
  'React.js & Next.js Masterclass',
  'JavaScript ES6+, React Fundamentals, Hooks, Context API, Redux Toolkit, React Router, REST & GraphQL APIs, Next.js SSR/SSG, TypeScript with React, Testing with Jest, Deployment on Vercel & Netlify, Portfolio Projects',
  '16000', '11499', '4 Months',
  'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=600&q=80',
  'Divya Reddy',
  'Divya Reddy is a Frontend Architect with 8 years of experience building scalable React applications for SaaS startups. She is an open-source contributor and a Google Developer Expert candidate.',
  'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=150&h=150&fit=crop&q=80',
  'Build 4 production-ready apps. TypeScript & testing included. Interview mock sessions every fortnight.'
);

INSERT IGNORE INTO product (id, course_name, syllabus, original_price, discounted_price, course_validity, course_img_url, trainers_name, trainers_details, trainers_img_url, other_details)
VALUES (
  1011,
  'Blockchain & Web3 Development',
  'Blockchain Fundamentals, Cryptography, Bitcoin & Ethereum Architecture, Solidity Smart Contracts, Hardhat & Truffle, DeFi Protocols, NFT Development, Web3.js & Ethers.js, IPFS, MetaMask Integration, DApp Deployment',
  '24000', '16999', '5 Months',
  'https://images.unsplash.com/photo-1639762681057-408e52192e55?w=600&q=80',
  'Rohit Verma',
  'Rohit Verma is a Blockchain Engineer and DeFi consultant with 6 years of experience. He has built smart contracts handling over $50M in TVL and regularly speaks at Web3 conferences across India.',
  'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&q=80',
  'Deploy a real DApp on Ethereum mainnet. NFT project included. Access to private Web3 mentorship community.'
);

-- Update auto_increment past new seed IDs
ALTER TABLE product AUTO_INCREMENT = 1012;
