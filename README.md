# 🧑‍💼 Employee Task Manager — Spring MVC

A full-featured **Employee Task Management System** built using the Spring Framework with MVC architecture. The application supports complete CRUD operations for both employees and tasks, with PostgreSQL as the database and Spring IoC container for dependency injection and bean management.

---

## 🧰 Technologies Used

| Layer | Technology |
|---|---|
| Language | Java |
| Framework | Spring MVC (Spring Framework) |
| IoC / DI | Spring Container (ApplicationContext) |
| ORM | Hibernate (JPA) |
| Database | PostgreSQL |
| View Technology | JSP (JavaServer Pages) |
| Server | Apache Tomcat v10.1 |
| Build Tool | Maven (`pom.xml`) |
| IDE | Eclipse IDE |
| JDK | Java JDK 22 |

---

## 🏗️ Architecture

The project follows a clean **layered MVC architecture** with Spring's IoC container managing all object creation and dependency injection:

```
Client Request
     ↓
DispatcherServlet (Spring MVC Front Controller)
     ↓
Controller Layer  →  Service Layer  →  DAO Layer  →  PostgreSQL DB
     ↓
JSP View (Response)
```

- **Spring Container** handles all bean creation (`@Component`, `@Service`, `@Repository`, `@Controller`)
- **Hibernate + JPA** manages ORM and database transactions
- **DispatcherServlet** routes all HTTP requests

---

## 📂 Project Structure

```
EmployeeTaskManager/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/assessment/taskmanager/
│   │   │       ├── config/
│   │   │       │   ├── AppConfig.java          # Spring Application Configuration
│   │   │       │   ├── WebConfig.java          # Spring MVC Web Configuration
│   │   │       │   └── WebInitializer.java     # Replaces web.xml (Servlet initializer)
│   │   │       ├── controller/
│   │   │       │   ├── EmployeeController.java # Handles employee HTTP requests
│   │   │       │   └── TaskController.java     # Handles task HTTP requests
│   │   │       ├── dao/
│   │   │       │   ├── EmployeeDao.java        # Employee DB operations
│   │   │       │   └── TaskDao.java            # Task DB operations
│   │   │       ├── entity/
│   │   │       │   ├── Employee.java           # Employee JPA Entity
│   │   │       │   └── Task.java               # Task JPA Entity
│   │   │       └── service/
│   │   │           ├── EmployeeService.java    # Employee business logic
│   │   │           └── TaskService.java        # Task business logic
│   │   ├── resources/                          # App properties / Hibernate config
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── views/
│   │       │       ├── employee-form.jsp       # Add/Edit employee form
│   │       │       ├── employee-list.jsp       # View all employees
│   │       │       ├── task-form.jsp           # Add/Edit task form
│   │       │       ├── task-list.jsp           # View all tasks
│   │       │       └── task-status.jsp         # Update task status
│   │       └── index.jsp                       # Landing/home page
│   └── test/
│       ├── java/
│       └── resources/
├── target/                                     # Compiled build output
├── pom.xml                                     # Maven dependencies
└── Deployed Resources/
```

---

## ⚙️ Features

### 👤 Employee Management
- ➕ Add new employee (Name, Email, Department, Designation)
- 📋 View all employees in a tabular list
- ✏️ Edit employee details
- 🗑️ Delete employee

### 📝 Task Management
- ➕ Add new task (Title, Description, Priority, Status)
- 👤 Assign tasks to employees
- 📋 View all tasks with priority and status indicators
- ✏️ Edit task details
- 🔄 Update task status (e.g., `IN_PROGRESS`, `DONE`)
- 🗑️ Delete task

---

## 🗄️ Database Configuration

**Database:** PostgreSQL

### Create Database

```sql
CREATE DATABASE employee_db;
```

### Employee Table

```sql
CREATE TABLE employee (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100),
    email       VARCHAR(100),
    department  VARCHAR(100),
    designation VARCHAR(100)
);
```

### Task Table

```sql
CREATE TABLE task (
    id          SERIAL PRIMARY KEY,
    title       VARCHAR(200),
    description TEXT,
    priority    VARCHAR(20),
    status      VARCHAR(20),
    employee_id INT REFERENCES employee(id)
);
```

### DB Connection (in `AppConfig.java`)

```java
String url      = "jdbc:postgresql://localhost:5432/employee_db";
String username = "postgres";
String password = "root";
```

---

## 🔧 Spring Container Configuration

Object creation and dependency injection are managed entirely by the **Spring IoC Container**:

```java
// AppConfig.java
@Configuration
@ComponentScan(basePackages = "com.assessment.taskmanager")
@EnableTransactionManagement
public class AppConfig {
    // DataSource, SessionFactory, TransactionManager beans defined here
}

// WebConfig.java
@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {
    // ViewResolver and static resource configuration
}

// WebInitializer.java — replaces web.xml
public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    // Registers DispatcherServlet programmatically
}
```

---

## 🔌 Setup Instructions

### Prerequisites
- JDK 22+
- Apache Tomcat 10.1
- PostgreSQL installed and running
- Eclipse IDE with Spring Tools / Maven support

### 1. Clone the Repository

```bash
git clone <your-repo-link>
cd EmployeeTaskManager
```

### 2. Import into Eclipse

- Open **Eclipse IDE**
- Go to `File` → `Import` → `Maven` → `Existing Maven Projects`
- Select the cloned project folder

### 3. Configure Database

Update DB credentials in `AppConfig.java`:

```java
url      = "jdbc:postgresql://localhost:5432/employee_db";
username = "postgres";
password = "root";
```

### 4. Deploy to Tomcat

- Right-click project → `Run As` → `Run on Server`
- Select **Apache Tomcat v10.1**
- Deploy and start the server

---

## ▶️ Run the Application

Once the server starts, open your browser:

```
http://localhost:8080/EmployeeTaskManager/
```

---

## ⚠️ Assumptions & Limitations

- Basic input validation only — no server-side bean validation (`@Valid`)
- No user authentication or role-based access control
- Designed for **local development** only
- No REST API — uses traditional Spring MVC form submissions

---

## 🚀 Future Enhancements

- [ ] Add Spring Security for login & role-based authentication
- [ ] Migrate to **Spring Boot** for auto-configuration
- [ ] Expose **REST APIs** with `@RestController`
- [ ] Integrate **React / Angular** as a frontend
- [ ] Add **pagination** to employee and task lists
- [ ] Implement bean validation with `@Valid` + `BindingResult`

---

## ✅ Project Status

| Feature | Status |
|---|---|
| Spring MVC Setup | ✔ Complete |
| Spring Container (IoC/DI) | ✔ Configured |
| Hibernate + JPA Integration | ✔ Working |
| PostgreSQL Connection | ✔ Connected |
| Employee CRUD | ✔ Implemented |
| Task CRUD | ✔ Implemented |
| Task Status Update | ✔ Working |
| Task Assignment to Employee | ✔ Working |
| Tomcat Deployment | ✔ Successful |

---

## 👨‍💻 Author

**Project:** EmployeeTaskManager  
**Package:** `com.assessment.taskmanager`  
**Server Runtime:** Apache Tomcat v10.1 @ `localhost:8080`
