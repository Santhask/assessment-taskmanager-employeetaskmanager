package com.assessment.taskmanager.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.*;
import jakarta.transaction.Transactional;

import com.assessment.taskmanager.entity.Employee;

@Repository
@Transactional
public class EmployeeDao {

	@PersistenceContext
	private EntityManager em;

	public void save(Employee employee) {
		em.persist(employee);
	}

	public Employee findById(int id) {
		return em.find(Employee.class, id);
	}

	public List<Employee> findAll() {
		return em.createQuery("SELECT e FROM Employee e", Employee.class).getResultList();
	}

	public void update(Employee employee) {
		em.merge(employee);
	}

	public void delete(int id) {
		Employee employee = em.find(Employee.class, id);
		if (employee != null) {
			em.remove(employee);
		}
	}
}