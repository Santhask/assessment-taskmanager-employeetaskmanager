package com.task.main;

import java.util.Scanner;

import com.task.entity.Task;
import com.task.linkedlist.TaskLinkedList;
import com.task.ser.TaskProcess;

public class MainApp {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		TaskLinkedList tll = new TaskLinkedList();

		while (true) {
			System.err.println(
					"\n1.Add Task \n2.Delete Task \n3.Search Task \n4.Display Tasks \n5.Reverse Tasks \n6.Get Task Count \n7.Start Task Processing \n8.Exit");
			int choice = sc.nextInt();

			switch (choice) {
			case 1:

				System.out.print("Enter ID: ");
				int id = sc.nextInt();
				sc.nextLine();

				System.out.print("Enter Name: ");
				String name = sc.nextLine();

				System.out.print("Enter Priority: ");
				String priority = sc.nextLine();

				tll.addTask(new Task(id, name, priority, "PENDING"));
				break;

			case 2:

				System.out.print("Enter ID: ");
				tll.deleteTask(sc.nextInt());
				break;

			case 3:
				System.out.print("Enter ID: ");
				Task t = tll.searchTask(sc.nextInt());
				System.out.println(t != null ? t : "Not Found");
				break;

			case 4:
				tll.displayTasks();
				break;

			case 5:
				tll.reverseTasks();
				break;
			case 6:
				int in=tll.getTaskCount();
				System.out.println(in!=0 ? in :"LinkedList is Empty" );
				break;
			case 7:
				System.out.println("Starting Task Processing.......");
				Thread t1 = new TaskProcess(tll, "Worker-1");
				Thread t2 = new TaskProcess(tll, "Worker-2");

				t1.start();
				t2.start();

				try {
					t1.join();
					t2.join();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				System.out.println("All Tasks  Completed");
				break;

			case 8:
				System.exit(0);

			}
		}

	}

}
