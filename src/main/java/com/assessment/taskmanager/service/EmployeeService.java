package com.assessment.taskmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assessment.taskmanager.dao.EmployeeDao;
import com.assessment.taskmanager.entity.Employee;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;

	public void addEmployee(Employee employee) {
		employeeDao.save(employee);
	}

	public Employee getEmployee(int id) {
		return employeeDao.findById(id);
	}

	public List<Employee> getAllEmployees() {
		return employeeDao.findAll();
	}

	public void updateEmployee(Employee employee) {
		employeeDao.update(employee);
	}

	public void deleteEmployee(int id) {
		employeeDao.delete(id);
	}
}
