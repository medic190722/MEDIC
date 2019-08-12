package com.kh.medic.todo.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Todo implements Serializable{

	private static final long serialVersionUID = 3004L;

	private int todoNo;
	private String todo;
	private Date todoDate;
	
	public Todo() {}
	
	public Todo(int todoNo, String todo, Date todoDate) {
		super();
		this.todoNo = todoNo;
		this.todo = todo;
		this.todoDate = todoDate;
	}

	public int getTodoNo() {
		return todoNo;
	}

	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}

	public String getTodo() {
		return todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
	}

	public Date getTodoDate() {
		return todoDate;
	}

	public void setTodoDate(Date todoDate) {
		this.todoDate = todoDate;
	}

	@Override
	public String toString() {
		return "Todo [todoNo=" + todoNo + ", todo=" + todo + ", todoDate=" + todoDate + "]";
	}
	

	
	
}
