<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Task Form</title>
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

.form-group input, .form-group select, .form-group textarea {
	width: 100%;
	padding: 10px 14px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
	outline: none;
	font-family: Arial, sans-serif;
}

.form-group input:focus, .form-group select:focus, .form-group textarea:focus
	{
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
					<c:when test="${task.taskId == 0}">➕ Add Task</c:when>
					<c:otherwise>✏️ Edit Task</c:otherwise>
				</c:choose>
			</h2>

			<%-- ✅ Using plain HTML form — NOT Spring form tags for task --%>
			<c:choose>
				<c:when test="${task.taskId == 0}">
					<form action="${pageContext.request.contextPath}/task/add"
						method="post">
				</c:when>
				<c:otherwise>
					<form
						action="${pageContext.request.contextPath}/task/edit/${task.taskId}"
						method="post">
				</c:otherwise>
			</c:choose>

			<div class="form-group">
				<label>Task Title *</label> <input type="text" name="taskTitle"
					value="${task.taskTitle}" placeholder="Enter task title" required />
				<c:if test="${not empty titleError}">
					<span class="error">${titleError}</span>
				</c:if>
			</div>

			<div class="form-group">
				<label>Description</label>
				<textarea name="description" rows="3"
					placeholder="Enter description">${task.description}</textarea>
			</div>

			<div class="form-group">
				<label>Priority *</label> <select name="priority" required>
					<option value="">-- Select Priority --</option>
					<option value="HIGH"
						<c:if test="${task.priority == 'HIGH'}">selected</c:if>>
						HIGH</option>
					<option value="MEDIUM"
						<c:if test="${task.priority == 'MEDIUM'}">selected</c:if>>
						MEDIUM</option>
					<option value="LOW"
						<c:if test="${task.priority == 'LOW'}">selected</c:if>>
						LOW</option>
				</select>
				<c:if test="${not empty priorityError}">
					<span class="error">${priorityError}</span>
				</c:if>
			</div>

			<div class="form-group">
				<label>Status *</label> <select name="status" required>
					<option value="">-- Select Status --</option>
					<option value="PENDING"
						<c:if test="${task.status == 'PENDING'}">selected</c:if>>
						PENDING</option>
					<option value="IN_PROGRESS"
						<c:if test="${task.status == 'IN_PROGRESS'}">selected</c:if>>
						IN PROGRESS</option>
					<option value="COMPLETED"
						<c:if test="${task.status == 'COMPLETED'}">selected</c:if>>
						COMPLETED</option>
				</select>
				<c:if test="${not empty statusError}">
					<span class="error">${statusError}</span>
				</c:if>
			</div>

			<div class="form-group">
				<label>Assign To *</label> <select name="employeeId" required>
					<option value="">-- Select Employee --</option>
					<c:forEach var="emp" items="${employees}">
						<option value="${emp.employeeId}"
							<c:if test="${emp.employeeId == selectedEmployeeId}">selected</c:if>>
							${emp.employeeName} (${emp.department})</option>
					</c:forEach>
				</select>
				<c:if test="${not empty employeeError}">
					<span class="error">${employeeError}</span>
				</c:if>
			</div>

			<div class="form-actions">
				<button type="submit" class="btn btn-primary">💾 Save Task</button>
				<a href="${pageContext.request.contextPath}/task/list"
					class="btn btn-secondary">Cancel</a>
			</div>

			</form>

		</div>
	</div>

</body>
</html>