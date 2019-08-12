package com.kh.medic.todo.model.exception;

public class TodoException extends RuntimeException {

	public TodoException() {}

	public TodoException(String msg) {
		super(msg);
	}
}
