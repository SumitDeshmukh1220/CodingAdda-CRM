# 🎓 CodingAdda – Course Management & CRM System

A full-stack **Customer Relationship Management (CRM)** web application built for a coding institute (**CodingAdda**). It manages course listings, customer enquiries, employee operations, and follow-ups — all in one platform.

---

## 📌 Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Database Setup](#database-setup)
  - [Running the Application](#running-the-application)
- [Configuration](#configuration)
- [User Roles](#user-roles)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

---

## 📖 About the Project

**CodingAdda CRM** is a Spring Boot–based web application designed to streamline the day-to-day operations of a coding institute. It provides:

- A **public-facing course catalogue** where prospective students can browse and enquire about courses.
- An **admin panel** to manage employees, products (courses), and customer enquiries.
- An **employee portal** to track and follow up on customer enquiries.

---

## ✨ Features

### 🌐 Public / Customer Side
- Browse available courses with details (syllabus, pricing, trainer info)
- Submit course enquiries (name, phone, interested course)
- View course details and discounted pricing

### 🛠️ Admin Panel
- Add, edit, and delete courses (products) with image upload
- Manage employee accounts
- View all customer enquiries and their statuses
- View enquiry history and follow-up records
- Profile management

### 👨‍💼 Employee Portal
- View assigned customer enquiries
- Add follow-up notes on enquiries
- Update enquiry status
- View personal profile

---

## 🧰 Tech Stack

| Layer | Technology |
|---|---|
| Backend | Java 17, Spring Boot 3.4.4 |
| Web MVC | Spring MVC |
| View Layer | JSP + JSTL |
| ORM | Spring Data JPA (Hibernate) |
| Database | MySQL |
| Validation | Spring Boot Validation |
| Build Tool | Maven |
| Frontend | HTML, CSS, Bootstrap, JavaScript |
| Server | Embedded Apache Tomcat |

---

## 📁 Project Structure

```
CRM_Project_Modified/
├── src/
│   ├── main/
│   │   ├── java/com/example/demo/
│   │   │   ├── controller/          # MVC Controllers
│   │   │   │   ├── MainController.java
│   │   │   │   ├── CustomerController.java
│   │   │   │   ├── custEnquiryController.java
│   │   │   │   └── ProductsController.java
│   │   │   ├── entity/              # JPA Entities
│   │   │   │   ├── Product.java
│   │   │   │   ├── CustEnquiry.java
│   │   │   │   ├── CustFollowup.java
│   │   │   │   ├── SaleCourse.java
│   │   │   │   └── employee.java
│   │   │   ├── repository/          # Spring Data JPA Repositories
│   │   │   ├── service/             # Service Layer (interfaces + impls)
│   │   │   ├── model/               # DTO / Model classes
│   │   │   ├── urls/                # URL constants
│   │   │   └── CrmProjectApplication.java
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   ├── data.sql             # Seed data for courses
│   │   │   └── static/
│   │   │       ├── css/style.css
│   │   │       ├── uploads/         # Course & trainer images
│   │   │       └── images/
│   │   └── webapp/WEB-INF/views/    # JSP View Templates
│   │       ├── index.jsp
│   │       ├── login.jsp
│   │       ├── home-employee.jsp
│   │       ├── customer-courses.jsp
│   │       ├── customer-enquiry.jsp
│   │       ├── add-products.jsp
│   │       ├── employee-list.jsp
│   │       └── ... (more views)
│   └── test/
├── pom.xml
└── mvnw / mvnw.cmd
```

---

## 🗄️ Database Schema

The application uses **MySQL** with the following main tables:

| Table | Description |
|---|---|
| `product` | Courses offered (name, syllabus, price, trainer info, image) |
| `customer_enquiry` | Enquiries submitted by prospective students |
| `cust_followup` | Follow-up records by employees on enquiries |
| `employee` | Employee accounts with roles |
| `sale_course` | Records of course sales/enrollments |

> The database is auto-seeded with 5 sample courses on application startup via `data.sql`.

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- [Java 17+](https://www.oracle.com/java/technologies/downloads/)
- [Maven 3.6+](https://maven.apache.org/download.cgi) (or use the included `mvnw` wrapper)
- [MySQL 8.0+](https://dev.mysql.com/downloads/)
- [Git](https://git-scm.com/)

---

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/CodingAdda-CRM.git
   cd CodingAdda-CRM
   ```

2. **Open in your IDE** (Eclipse / IntelliJ IDEA recommended).

---

### Database Setup

1. Open MySQL Workbench or your MySQL client.

2. Create the database:
   ```sql
   CREATE DATABASE crmdb_springboot;
   ```

3. Update your credentials in `src/main/resources/application.properties`:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/crmdb_springboot
   spring.datasource.username=your_mysql_username
   spring.datasource.password=your_mysql_password
   ```

> **Note:** Tables are created automatically by Hibernate on first run (`ddl-auto=update`). Sample course data is inserted via `data.sql` on every startup (uses `INSERT IGNORE` so no duplicates are created).

---

### Running the Application

**Using Maven Wrapper (recommended):**

```bash
# On Linux/Mac
./mvnw spring-boot:run

# On Windows
mvnw.cmd spring-boot:run
```

**Or build and run the JAR:**
```bash
./mvnw clean package
java -jar target/CRM_Project-0.0.1-SNAPSHOT.jar
```

The application starts on **http://localhost:8081**

---

## ⚙️ Configuration

Key settings in `src/main/resources/application.properties`:

```properties
# Server
server.port=8081

# Database
spring.datasource.url=jdbc:mysql://localhost:3306/crmdb_springboot
spring.datasource.username=root
spring.datasource.password=your_password

# JPA
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

# View (JSP)
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

# Seed data
spring.sql.init.mode=always
spring.jpa.defer-datasource-initialization=true
```

> ⚠️ **Security Note:** Never commit real credentials to GitHub. Use environment variables or a `.env` file and add `application.properties` to `.gitignore` if it contains sensitive data.

---

## 👥 User Roles

| Role | Access |
|---|---|
| **Admin** | Full access — manage courses, employees, view all enquiries |
| **Employee** | View & manage assigned enquiries, add follow-ups |
| **Customer / Public** | Browse courses, submit enquiries |

---

## 📸 Screenshots

### Home Page
![Home Page]()

| Page | Description |
|---|---|
| Home / Courses Page | Public course listing with pricing |
| Course Detail | Full course info with trainer details |
| Login | Role-based login screen |
| Admin Dashboard | Manage courses and employees |
| Enquiry Management | View and follow up on leads |

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m "Add: your feature description"`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Author

**CodingAdda**
> Built as a real-world CRM project for a coding institute.

---

*If you find this project helpful, please ⭐ star the repository!*
