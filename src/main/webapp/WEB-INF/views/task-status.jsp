<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Status</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f0f2f5; }

        .navbar {
            background: #2c3e50;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h1 { color: white; font-size: 20px; }
        .navbar a {
            color: #ecf0f1;
            text-decoration: none;
            margin-left: 20px;
            padding: 8px 15px;
            border-radius: 4px;
            background: #34495e;
            font-size: 14px;
        }
        .navbar a:hover { background: #3498db; }

        .container { padding: 30px; max-width: 500px; margin: auto; }

        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 30px;
            margin-top: 20px;
        }
        .card h2 { color: #2c3e50; margin-bottom: 10px; }

        .task-info {
            background: #f8f9fa;
            border-left: 4px solid #3498db;
            padding: 12px 16px;
            margin-bottom: 25px;
            border-radius: 4px;
        }
        .task-info p { color: #555; font-size: 14px; }
        .task-info strong { color: #2c3e50; }

        .form-group { margin-bottom: 20px; }
        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #555;
            font-size: 14px;
        }
        .form-group select {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            outline: none;
        }
        .form-group select:focus { border-color: #3498db; }

        .form-actions { display: flex; gap: 10px; }
        .btn {
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-success { background: #27ae60; color: white; }
        .btn-success:hover { background: #219a52; }
        .btn-secondary { background: #95a5a6; color: white; }
        .btn-secondary:hover { background: #7f8c8d; }
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
        <h2>🔄 Update Task Status</h2>

        <div class="task-info">
            <p>Task : <strong>${task.taskTitle}</strong></p>
            <p>Current Status : <strong>${task.status}</strong></p>
        </div>

        <%-- ✅ Plain HTML form with correct action --%>
        <form action="${pageContext.request.contextPath}/task/update-status/${task.taskId}"
              method="post">

            <div class="form-group">
                <label>Select New Status</label>
                <select name="status">
                    <option value="PENDING"
                        <c:if test="${task.status == 'PENDING'}">selected</c:if>>
                        ⏳ PENDING
                    </option>
                    <option value="IN_PROGRESS"
                        <c:if test="${task.status == 'IN_PROGRESS'}">selected</c:if>>
                        🔄 IN PROGRESS
                    </option>
                    <option value="COMPLETED"
                        <c:if test="${task.status == 'COMPLETED'}">selected</c:if>>
                        ✅ COMPLETED
                    </option>
                </select>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-success">
                    Update Status
                </button>
                <a href="${pageContext.request.contextPath}/task/list"
                   class="btn btn-secondary">
                    Cancel
                </a>
            </div>

        </form>
    </div>
</div>

</body>
</html>