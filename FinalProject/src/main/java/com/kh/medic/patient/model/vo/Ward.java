package com.kh.medic.patient.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Ward implements Serializable{

	private static final long serialVersionUID = 200L;

	private int ward_code;	// 병실 번호
	private int capacity;	// 최대 수용 인원
	private int cur_capacity;// 현재 수용 인원
	private int available_capacity; // 수용 가능 인원
	
	public Ward() {}

	// 병실 번호, 최대 수용 인원을 받는 생성자
	public Ward(int ward_code, int capacity) {
		super();
		this.ward_code = ward_code;
		this.capacity = capacity;
	}
	
	// 병실 번호, 최대 수용 인원, 현재 수용 인원을 받는 생성자
	public Ward(int ward_code, int capacity, int cur_capacity) {
		super();
		this.ward_code = ward_code;
		this.capacity = capacity;
		this.cur_capacity = cur_capacity;
	}
	
	

	public Ward(int ward_code, int capacity, int cur_capacity, int available_capacity) {
		super();
		this.ward_code = ward_code;
		this.capacity = capacity;
		this.cur_capacity = cur_capacity;
		this.available_capacity = available_capacity;
	}

	public int getWard_code() {
		return ward_code;
	}

	public void setWard_code(int ward_code) {
		this.ward_code = ward_code;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getCur_capacity() {
		return cur_capacity;
	}

	public void setCur_capacity(int cur_capacity) {
		this.cur_capacity = cur_capacity;
	}
	
	public int getAvailable_capacity() {
		return available_capacity;
	}

	public void setAvailable_capacity(int available_capacity) {
		this.available_capacity = available_capacity;
	}

	@Override
	public String toString() {
		return "Ward [ward_code=" + ward_code + ", capacity=" + capacity + ", cur_capacity=" + cur_capacity
				+ ", available_capacity=" + available_capacity + "]";
	}	
	
}
