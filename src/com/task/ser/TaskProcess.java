package com.task.ser;

import com.task.entity.Task;
import com.task.linkedlist.TaskLinkedList;

public class TaskProcess extends Thread {

	private TaskLinkedList tl;

	public TaskProcess(TaskLinkedList tl, String name) {
		super(name);
		this.tl = tl;

	}

	@Override
	public void run() {
		while (true) {
			Task task;

			synchronized (tl) {
				task = tl.getPendingTask();
			}

			if (task == null) {
				break;
			}

			System.out.println(getName() + " processing Task ID: " + task.getTaskId());

			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

			task.setStatus("COMPLETED");
			System.out.println(getName() + " completed Task ID: " + task.getTaskId());
		}
	}

}
