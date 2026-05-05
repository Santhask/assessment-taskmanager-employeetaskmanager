package com.task.entity;

public class Task {

	int taskId;
	String taskName;
	String priority;
	String status;

	public Task(int taskId, String taskName, String priority, String status) {
		super();
		this.taskId = taskId;
		this.taskName = taskName;
		this.priority = priority;
		this.status = status;
	}

	public int getTaskId() {
		return taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public String getPriority() {
		return priority;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return taskId + " - " + taskName + " - " + priority + " - " + status;
	}

}
