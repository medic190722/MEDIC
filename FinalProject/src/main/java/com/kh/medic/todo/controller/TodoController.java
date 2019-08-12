package com.kh.medic.todo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.medic.todo.model.service.TodoService;
import com.kh.medic.todo.model.vo.Todo;

@Controller
public class TodoController {

	@Autowired
	TodoService todoService;

	@RequestMapping("/todo/todo.do")
	@ResponseBody
	public List<Todo> todo(Model model) {

		List<Todo> todoList = todoService.selectTodoList();

		model.addAttribute("todoList", new Gson().toJson(todoList));

		return todoList;
	}

	@RequestMapping("/todo/insertTodo.do")
	public String insertTodo(@RequestParam String todo) {

		Map<String, String> map = new HashMap<>();

		map.put("todo", todo);

		todoService.insertTodo(map);

		return "index";

	}

	@RequestMapping("/todo/deleteTodo.do")
	public String deleteTodo(@RequestParam String todoNo) {

		Map<String, String> map = new HashMap<>();

		map.put("todoNo", todoNo);

		todoService.deleteTodo(map);

		return "index";
	}

}
