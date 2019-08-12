package com.kh.medic.todo.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.medic.todo.model.vo.Todo;

public interface TodoDao {

	List<Todo> selectTodoList();
	
	int insertTodo(Map<String, String> map);
	
	int deleteTodo(Map<String, String> map);
	
}
