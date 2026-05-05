<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee Form</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background: #f0f2f5;
}

.navbar {
	background: #2c3e50;
	padding: 15px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.navbar h1 {
	color: white;
	font-size: 20px;
}

.navbar a {
	color: #ecf0f1;
	text-decoration: none;
	margin-left: 20px;
	padding: 8px 15px;
	border-radius: 4px;
	background: #34495e;
	font-size: 14px;
}

.navbar a:hover {
	background: #3498db;
}

.container {
	padding: 30px;
	max-width: 600px;
	margin: auto;
}

.card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 20px;
}

.card h2 {
	color: #2c3e50;
	margin-bottom: 25px;
	font-size: 22px;
}

.form-group {
	margin-bottom: 18px;
}

.form-group label {
	display: block;
	margin-bottom: 6px;
	font-size: 14px;
	font-weight: bold;
	color: #555;
}

.form-group input {
	width: 100%;
	padding: 10px 14px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
	outline: none;
	font-family: Arial, sans-serif;
}

.form-group input:focus {
	border-color: #3498db;
}

.error {
	color: #e74c3c;
	font-size: 12px;
	margin-top: 4px;
	display: block;
}

.form-actions {
	display: flex;
	gap: 10px;
	margin-top: 25px;
}

.btn {
	padding: 10px 25px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
	text-decoration: none;
	display: inline-block;
}

.btn-primary {
	background: #3498db;
	color: white;
}

.btn-primary:hover {
	background: #2980b9;
}

.btn-secondary {
	background: #95a5a6;
	color: white;
}

.btn-secondary:hover {
	background: #7f8c8d;
}
</style>
</head>
<body>

	<div class="navbar">
		<h1>🏢 Employee Task Manager</h1>
		<div>
			<a href="${pageContext.request.contextPath}/employee/list">Employees</a>
			<a href="${pageContext.request.contextPath}/task/list">Tasks</a>
		</div>
	</div>

	<div class="container">
		<div class="card">

			<h2>
				<c:choose>
					<c:when test="${employee.employeeId == 0}">➕ Add Employee</c:when>
					<c:otherwise>✏️ Edit Employee</c:otherwise>
				</c:choose>
			</h2>

			<c:choose>
				<c:when test="${employee.employeeId == 0}">
					<c:set var="formAction" value="/employee/add" />
				</c:when>
				<c:otherwise>
					<c:set var="formAction"
						value="/employee/edit/${employee.employeeId}" />
				</c:otherwise>
			</c:choose>

			<form:form action="${pageContext.request.contextPath}${formAction}"
				method="post" modelAttribute="employee">

				<div class="form-group">
					<label>Full Name *</label>
					<form:input path="employeeName" placeholder="Enter full name" />
					<form:errors path="employeeName" cssClass="error" />
				</div>

				<div class="form-group">
					<label>Email *</label>
					<form:input path="email" placeholder="Enter email address" />
					<form:errors path="email" cssClass="error" />
				</div>

				<div class="form-group">
					<label>Department *</label>
					<form:input path="department"
						placeholder="e.g. Engineering, HR, Finance" />
					<form:errors path="department" cssClass="error" />
				</div>

				<div class="form-group">
					<label>Designation</label>
					<form:input path="designation"
						placeholder="e.g. Manager, Developer, Analyst" />
				</div>

				<div class="form-actions">
					<button type="submit" class="btn btn-primary">💾 Save
						Employee</button>
					<a href="${pageContext.request.contextPath}/employee/list"
						class="btn btn-secondary"> Cancel </a>
				</div>

			</form:form>
		</div>
	</div>

</body>
</html>