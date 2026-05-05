package com.assessment.taskmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assessment.taskmanager.dao.EmployeeDao;
import com.assessment.taskmanager.dao.TaskDao;
import com.assessment.taskmanager.entity.Employee;
import com.assessment.taskmanager.entity.Task;

@Service
public class TaskService {

	@Autowired
	private TaskDao taskDao;

	@Autowired
	private EmployeeDao employeeDao;

	public void addTask(Task task, int employeeId) {
		Employee employee = employeeDao.findById(employeeId);
		task.setAssignedEmployee(employee);
		taskDao.save(task);
	}

	public Task getTask(int id) {
		return taskDao.findById(id);
	}

	public List<Task> getAllTasks() {
		return taskDao.findAll();
	}

	public void updateTask(Task task, int employeeId) {
		Employee employee = employeeDao.findById(employeeId);
		task.setAssignedEmployee(employee); 
		taskDao.update(task);
	}

	public void updateStatus(int id, String status) {
	    taskDao.updateStatus(id, status);
	}

	public void deleteTask(int id) {
		taskDao.delete(id);
	}
}