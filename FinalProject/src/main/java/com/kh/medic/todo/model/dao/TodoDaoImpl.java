package com.kh.medic.todo.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.todo.model.vo.Todo;

@Repository
public class TodoDaoImpl implements TodoDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Todo> selectTodoList() {
		return sqlSession.selectList("todo.selectTodoList");
	}

	@Override
	public int insertTodo(Map<String, Object> map) {
		return sqlSession.insert("todo.insertTodo", map);
	}

	@Override
	public int deleteTodo(Map<String, Object> map) {
		return sqlSession.delete("todo.deleteTodo", map);
	}

}
