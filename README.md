# Task Manager — Java Core

**Custom LinkedList + Multithreading Assessment**

---

## 📌 Project Overview

This is a **Java Core console-based application** designed to manage tasks using a **custom singly linked list**.
It supports complete CRUD operations and demonstrates **multithreading with proper synchronization**.

* **Language:** Java (Core)
* **Technology:** Java SE (No frameworks)
* **Architecture:** OOP (4 packages, 5 classes)
* **Storage:** Custom Singly Linked List (No `java.util.LinkedList`)
* **Threading:** 2 Worker Threads
* **Synchronization:** `synchronized` methods & blocks

---

## 📂 Project Structure

```
src/
└── com/
    └── task/
        ├── entity/
        │   └── Task.java
        ├── linkedlist/
        │   ├── Node.java
        │   └── TaskLinkedList.java
        ├── ser/
        │   └── TaskProcess.java
        └── main/
            └── MainApp.java
```

---

## 🧠 Class Responsibilities

### 🔹 Task.java

* Represents a task entity
* Fields:

  * `taskId` (int)
  * `taskName` (String)
  * `priority` (HIGH / MEDIUM / LOW)
  * `status` (PENDING / IN_PROGRESS / COMPLETED)

---

### 🔹 Node.java

* Wrapper class for linked list node
* Contains:

  * `Task data`
  * `Node next`

---

### 🔹 TaskLinkedList.java

Custom singly linked list implementation with thread safety:

* `addTask(Task task)`
* `deleteTask(int taskId)`
* `searchTask(int taskId)`
* `displayTasks()`
* `reverseTasks()`
* `getTaskCount()`
* `getPendingTask()` (atomic operation)

---

### 🔹 TaskProcess.java

* Extends `Thread`
* Picks pending tasks and processes them
* Simulates processing using:

  ```java
  Thread.sleep(1000);
  ```

---

### 🔹 MainApp.java

* Entry point of application
* Provides menu-driven interface
* Manages thread execution

---

## ⚙️ Setup & Execution

### ✅ Prerequisites

* Java 8 or above
* Eclipse / IntelliJ (optional)

---

### ▶️ Compile (Command Line)

```
cd src
javac com/task/main/MainApp.java
```

---

### ▶️ Run

```
java com.task.main.MainApp
```

---

### ▶️ Run in IDE

* Import project as Java Project
* Set `src` as source folder
* Run `MainApp.java`

---

## 📋 Features

* Add Task
* Delete Task
* Search Task
* Display All Tasks
* Reverse Task List
* Get Task Count
* Multithreaded Task Processing

---

## 🧵 Multithreading & Synchronization

### 🔸 Problem

Multiple threads accessing a shared list can cause **race conditions**.

### 🔸 Solution

* All list methods are declared `synchronized`
* `getPendingTask()` ensures atomic operation
* Additional `synchronized` block used in thread execution

### 🔸 Result

* Thread-safe processing
* No duplicate task execution

---

## ⚠️ Assumptions & Limitations

### Assumptions

* Task IDs are unique
* User input is valid

### Limitations

* No validation for duplicate IDs
* Uses `String` instead of `Enum`
* Operations are O(n)

### Known Issues

* Minor naming inconsistency (`getTaskCounts` → should be `getTaskCount`)
* Minor spelling issues
* Uses `System.err` for menu display

---

## 🚀 Possible Improvements

* Add input validation
* Use Enums for priority & status
* Implement `wait()` / `notify()` for better threading
* Add persistence (file/database)
* Add unit testing

---

# **Sample Output **

 

## **Adding Tasks (Option 1 × 3)**

| 📟 **Console 			Output** 			  			 			Enter 			ID: 101 			Enter 			Name: Review Case File 			Enter 			Priority: HIGH 			Sucessfully 			Added the Task 			  			 			Enter 			ID: 102 			Enter 			Name: Generate Report 			Enter 			Priority: MEDIUM 			Sucessfully 			Added the Task 			  			 			Enter 			ID: 103 			Enter 			Name: Upload Documents 			Enter 			Priority: LOW 			Sucessfully 			Added the Task |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |


  

## ** Display All Tasks (Option 4)**

| 📟 **Console 			Output** 			  			 			101 			- Review Case File - HIGH - PENDING 			102 			- Generate Report - MEDIUM - PENDING 			103 			- Upload Documents - LOW - PENDING |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

## ** Search Task (Option 3)**

| 📟 **Console 			Output** 			  			 			Enter 			ID: 102 			102 			- Generate Report - MEDIUM - PENDING 			  			 			Enter 			ID: 999 			Not 			Found |
| ------------------------------------------------------------------------------------------------------------------------------------------------- |

## **Get Task Count (Option 6)**

| 📟 **Console 			Output** 			 3 |
| ------------------------------ |

## **  Reverse Task List (Option 5) → then Display (Option 4)**

| 📟 **Console 			Output** 			  			 			103 			- Upload Documents - LOW - PENDING 			102 			- Generate Report - MEDIUM - PENDING 			101 			- Review Case File - HIGH - PENDING |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

## **  Delete Task (Option 2)**

| 📟 **Console 			Output** 			  			 			Enter 			ID: 102 			Task 			Deleted Successfully |
| ------------------------------------------------------------------------------------- |


  

## **Start Task Processing — Multithreaded (Option 7)**

| 📟 **Console 			Output** 			  			 			Starting 			Task Processing....... 			  			 			Worker-1 			processing Task ID: 101 			Worker-2 			processing Task ID: 102 			  			 			Worker-1 			completed Task ID: 101 			Worker-2 			completed Task ID: 102 			Worker-1 			processing Task ID: 103 			Worker-1 			completed Task ID: 103 			  			 			All 			Tasks  Completed |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |


  

---

## ✅ Status

✔ All requirements implemented
✔ Custom LinkedList used
✔ Multithreading implemented
✔ Thread-safe execution
✔ No external libraries used

---
