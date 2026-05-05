<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Task Management</title>
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
	max-width: 1200px;
	margin: auto;
}

.page-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.page-header h2 {
	color: #2c3e50;
	font-size: 24px;
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
	font-size: 13px;
	display: inline-block;
}

.btn-primary {
	background: #3498db;
	color: white;
}

.btn-primary:hover {
	background: #2980b9;
}

.btn-warning {
	background: #f39c12;
	color: white;
}

.btn-warning:hover {
	background: #e67e22;
}

.btn-danger {
	background: #e74c3c;
	color: white;
}

.btn-danger:hover {
	background: #c0392b;
}

.btn-success {
	background: #27ae60;
	color: white;
}

.btn-success:hover {
	background: #219a52;
}

.card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead {
	background: #2c3e50;
	color: white;
}

thead th {
	padding: 14px 16px;
	text-align: left;
	font-size: 14px;
}

tbody tr {
	border-bottom: 1px solid #ecf0f1;
}

tbody tr:hover {
	background: #f8f9fa;
}

tbody td {
	padding: 13px 16px;
	font-size: 14px;
	color: #555;
}

.badge {
	padding: 5px 12px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: bold;
}

/* Priority */
.badge-HIGH {
	background: #fde8e8;
	color: #e74c3c;
}

.badge-MEDIUM {
	background: #fef9e7;
	color: #f39c12;
}

.badge-LOW {
	background: #eafaf1;
	color: #27ae60;
}

/* Status */
.badge-PENDING {
	background: #fef9e7;
	color: #f39c12;
}

.badge-IN_PROGRESS {
	background: #d6eaf8;
	color: #2980b9;
}

.badge-COMPLETED {
	background: #eafaf1;
	color: #27ae60;
}

.actions {
	display: flex;
	gap: 6px;
	flex-wrap: wrap;
}

.empty-msg {
	text-align: center;
	padding: 40px;
	color: #999;
	font-size: 16px;
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
		<div class="page-header">
			<h2>📋 Tasks</h2>
			<a href="${pageContext.request.contextPath}/task/add"
				class="btn btn-primary">+ Add Task</a>
		</div>

		<div class="card">
			<table>
				<thead>
					<tr>
						<th>#</th>
						<th>Title</th>
						<th>Description</th>
						<th>Priority</th>
						<th>Status</th>
						<th>Assigned To</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty tasks}">
							<tr>
								<td colspan="7" class="empty-msg">No tasks found. Add one!
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="task" items="${tasks}" varStatus="s">
								<tr>
									<td>${s.count}</td>
									<td><strong>${task.taskTitle}</strong></td>
									<td>${task.description}</td>
									<td><span class="badge badge-${task.priority}">
											${task.priority} </span></td>
									<td><span class="badge badge-${task.status}">
											${task.status} </span></td>
									<td><c:choose>
											<c:when test="${task.assignedEmployee != null}">
                                            ${task.assignedEmployee.employeeName}
                                        </c:when>
											<c:otherwise>
												<span style="color: #999">Unassigned</span>
											</c:otherwise>
										</c:choose></td>
									<td>
										<div class="actions">
											<a
												href="${pageContext.request.contextPath}/task/edit/${task.taskId}"
												class="btn btn-warning">Edit</a> <a
												href="${pageContext.request.contextPath}/task/update-status/${task.taskId}"
												class="btn btn-success">Status</a> <a
												href="${pageContext.request.contextPath}/task/delete/${task.taskId}"
												class="btn btn-danger"
												onclick="return confirm('Are you sure you want to delete this task?')">
												Delete </a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>