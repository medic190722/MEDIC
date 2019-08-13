package com.kh.medic.todo.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.todo.model.dao.TodoDao;
import com.kh.medic.todo.model.vo.Todo;

@Service
public class TodoServiceImpl implements TodoService {

	@Autowired
	private TodoDao tdao;
	
	@Override
	public List<Todo> selectTodoList() {
		return tdao.selectTodoList();
	}

	@Override
	public int insertTodo(Map<String, Object> map) {
		return tdao.insertTodo(map);
	}

	@Override
	public int deleteTodo(Map<String, Object> map) {
		return tdao.deleteTodo(map);
	}

}
