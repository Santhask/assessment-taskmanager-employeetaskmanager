package com.assessment.taskmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assessment.taskmanager.entity.Task;
import com.assessment.taskmanager.service.EmployeeService;
import com.assessment.taskmanager.service.TaskService;

@Controller
@RequestMapping("/task")
public class TaskController {

	@Autowired
	private TaskService taskService;

	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/list")
	public String listTasks(Model model) {
		model.addAttribute("tasks", taskService.getAllTasks());
		return "task-list";
	}

	@GetMapping("/add")
	public String showAddForm(Model model) {
		model.addAttribute("task", new Task());
		model.addAttribute("employees", employeeService.getAllEmployees());
		model.addAttribute("selectedEmployeeId", 0);
		return "task-form";
	}

	@PostMapping("/add")
	public String addTask(@RequestParam("taskTitle") String taskTitle, @RequestParam("description") String description,
			@RequestParam("priority") String priority, @RequestParam("status") String status,
			@RequestParam(value = "employeeId", required = false) Integer employeeId, Model model) {

		boolean hasError = false;

		if (taskTitle == null || taskTitle.trim().isEmpty()) {
			model.addAttribute("titleError", "Task title is required");
			hasError = true;
		}
		if (priority == null || priority.trim().isEmpty()) {
			model.addAttribute("priorityError", "Priority is required");
			hasError = true;
		}
		if (status == null || status.trim().isEmpty()) {
			model.addAttribute("statusError", "Status is required");
			hasError = true;
		}
		if (employeeId == null || employeeId == 0) {
			model.addAttribute("employeeError", "Please select an employee");
			hasError = true;
		}

		if (hasError) {
			Task task = new Task();
			task.setTaskTitle(taskTitle);
			task.setDescription(description);
			task.setPriority(priority);
			task.setStatus(status);
			model.addAttribute("task", task);
			model.addAttribute("employees", employeeService.getAllEmployees());
			model.addAttribute("selectedEmployeeId", employeeId != null ? employeeId : 0);
			return "task-form";
		}

		Task task = new Task();
		task.setTaskTitle(taskTitle.trim());
		task.setDescription(description);
		task.setPriority(priority);
		task.setStatus(status);

		taskService.addTask(task, employeeId);
		return "redirect:/task/list";
	}

	@GetMapping("/edit/{id}")
	public String showEditForm(@PathVariable("id") int id, Model model) {
		Task task = taskService.getTask(id);
		if (task == null) {
			return "redirect:/task/list";
		}
		model.addAttribute("task", task);
		model.addAttribute("employees", employeeService.getAllEmployees());
		model.addAttribute("selectedEmployeeId",
				task.getAssignedEmployee() != null ? task.getAssignedEmployee().getEmployeeId() : 0);
		return "task-form";
	}

	@PostMapping("/edit/{id}")
	public String updateTask(@PathVariable("id") int id, @RequestParam("taskTitle") String taskTitle,
			@RequestParam("description") String description, @RequestParam("priority") String priority,
			@RequestParam("status") String status,
			@RequestParam(value = "employeeId", required = false) Integer employeeId, Model model) {

		boolean hasError = false;

		if (taskTitle == null || taskTitle.trim().isEmpty()) {
			model.addAttribute("titleError", "Task title is required");
			hasError = true;
		}
		if (priority == null || priority.trim().isEmpty()) {
			model.addAttribute("priorityError", "Priority is required");
			hasError = true;
		}
		if (status == null || status.trim().isEmpty()) {
			model.addAttribute("statusError", "Status is required");
			hasError = true;
		}
		if (employeeId == null || employeeId == 0) {
			model.addAttribute("employeeError", "Please select an employee");
			hasError = true;
		}

		if (hasError) {
			Task task = taskService.getTask(id);
			task.setTaskTitle(taskTitle);
			task.setDescription(description);
			task.setPriority(priority);
			task.setStatus(status);
			model.addAttribute("task", task);
			model.addAttribute("employees", employeeService.getAllEmployees());
			model.addAttribute("selectedEmployeeId", employeeId != null ? employeeId : 0);
			return "task-form";
		}

		Task task = taskService.getTask(id);
		task.setTaskTitle(taskTitle.trim());
		task.setDescription(description);
		task.setPriority(priority);
		task.setStatus(status);
		taskService.updateTask(task, employeeId);
		return "redirect:/task/list";
	}

	@GetMapping("/update-status/{id}")
	public String showStatusForm(@PathVariable("id") int id, Model model) {
		Task task = taskService.getTask(id);
		model.addAttribute("task", task);
		return "task-status";
	}

	@PostMapping("/update-status/{id}")
	public String updateStatus(@PathVariable("id") int id, @RequestParam("status") String status) {
		taskService.updateStatus(id, status);
		return "redirect:/task/list";
	}

	@GetMapping("/delete/{id}")
	public String deleteTask(@PathVariable("id") int id) {
		taskService.deleteTask(id);
		return "redirect:/task/list";
	}
}
