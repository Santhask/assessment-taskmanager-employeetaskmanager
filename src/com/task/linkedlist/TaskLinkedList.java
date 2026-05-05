
package com.task.linkedlist;

import com.task.entity.Task;

public class TaskLinkedList {

	Node head;

	public synchronized void addTask(Task task) {

		Node n = new Node(task);

		// if linkedlist is empty
		if (head == null) {
			head = n;
			System.out.println("Sucessfully Added the Task");
			return;
		}
		// if linkedlist is not empty
		else {
			Node temp = head;
			while (temp.next != null) {
				temp = temp.next;
			}
			temp.next = n;
			System.out.println("Sucessfully Added the Task");

		}

	}

	public synchronized void deleteTask(int taskId) {
		// if linkedlist is empty
		if (head == null) {
			System.out.println("List is empty");
			return;
		}
		// if first node taskid equals to given taskid
		if (head.task.getTaskId() == taskId) {
			head = head.next;
			System.out.println("Task Deleted Successfully");
			return;
		}

		Node temp = head;
		while (temp.next != null) {
			if (temp.next.task.getTaskId() == taskId) {
				temp.next = temp.next.next;
				System.out.println("Task Deleted Successfully");
				return;
			}
			temp = temp.next;
		}

		System.out.println("Task Not Found");

	}

	public synchronized Task searchTask(int taskId) {

		Node temp = head;
		while (temp != null) {
			if (temp.task.getTaskId() == taskId) {
				return temp.task;
			}
			temp = temp.next;
		}
		return null;

	}

	public synchronized void displayTasks() {

		Node temp = head;
		if (head == null) {
			System.out.println("No tasks available");
			return;
		}
		while (temp != null) {

			System.out.println(temp.task.getTaskId() + " - " + temp.task.getTaskName() + " - " + temp.task.getPriority()
					+ " - " + temp.task.getStatus());

			temp = temp.next;

		}
	}

	public synchronized int getTaskCount() {

		Node temp = head;

		if (head == null) {
			return 0;

		}
		int count = 0;
		while (temp != null) {
			count++;
			temp = temp.next;
		}
		return count;
		
	}

	public synchronized void reverseTasks() {

		Node curr = head, prev = null, next = null;

		while (curr != null) {
			next = curr.next;
			curr.next = prev;
			prev = curr;
			curr = next;

		}
		head = prev;

	}

	public synchronized Task getPendingTask() {
		Node temp = head;
		while (temp != null) {
			if (temp.task.getStatus().equals("PENDING")) {
				temp.task.setStatus("IN_PROGRESS");
				return temp.task;
			}
			temp = temp.next;
		}
		return null;
	}

}
