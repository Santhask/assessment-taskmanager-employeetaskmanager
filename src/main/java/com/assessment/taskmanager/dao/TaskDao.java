package com.assessment.taskmanager.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.assessment.taskmanager.entity.Task;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Repository
@Transactional
public class TaskDao {

	@PersistenceContext
	private EntityManager em;

	public void save(Task task) {
		em.persist(task);
	}

	public Task findById(int id) {
		return em.find(Task.class, id);
	}

	public List<Task> findAll() {
		return em.createQuery("SELECT t FROM Task t LEFT JOIN FETCH t.assignedEmployee", Task.class).getResultList();
	}

	public void update(Task task) {
		em.merge(task);
	}
	
	public void updateStatus(int id, String status) {
	    em.createQuery("UPDATE Task t SET t.status = :status WHERE t.taskId = :id")
	      .setParameter("status", status)
	      .setParameter("id", id)
	      .executeUpdate();
	}

	public void delete(int id) {
		Task task = em.find(Task.class, id);
		if (task != null) {
			em.remove(task);
		}
	}
}