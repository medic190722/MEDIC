package com.kh.medic.attendance.model.vo;

import java.io.Serializable;

public class TodayAttend implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1000L;
	
	
	private int empNo;
	private String todayAttend;
	private String todayLeave;
	public TodayAttend() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TodayAttend(int empNo, String todayAttend, String todayLeave) {
		super();
		this.empNo = empNo;
		this.todayAttend = todayAttend;
		this.todayLeave = todayLeave;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getTodayAttend() {
		return todayAttend;
	}
	public void setTodayAttend(String todayAttend) {
		this.todayAttend = todayAttend;
	}
	public String getTodayLeave() {
		return todayLeave;
	}
	public void setTodayLeave(String todayLeave) {
		this.todayLeave = todayLeave;
	}
	@Override
	public String toString() {
		return "TodayAttend [empNo=" + empNo + ", todayAttend=" + todayAttend + ", todayLeave=" + todayLeave + "]";
	}
	
	

}
