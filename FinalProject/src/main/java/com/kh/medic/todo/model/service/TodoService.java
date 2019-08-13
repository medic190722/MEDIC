package com.kh.medic.todo.model.service;

import java.util.List;
import java.util.Map;

import com.kh.medic.todo.model.vo.Todo;

public interface TodoService {

	List<Todo> selectTodoList();
	
	int insertTodo(Map<String, Object> map);
	
	int deleteTodo(Map<String, Object> map);
}
